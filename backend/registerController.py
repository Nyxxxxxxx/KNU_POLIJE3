import mysql.connector
from database import get_db_connection

def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='kp03_db'
    )
    return connection

def register_student(name, student_id, phone_number, department):
    connection = get_db_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(
            'INSERT INTO students (student_id, name, phone_number, department) VALUES (%s, %s, %s, %s)', 
            (student_id, name, phone_number, department)
        )
        connection.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        connection.rollback()
    finally:
        cursor.close()
        connection.close()
