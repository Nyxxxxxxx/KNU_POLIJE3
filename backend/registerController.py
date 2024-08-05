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

def register_student(name, school_id, phone_number):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute('INSERT INTO students (name, school_id, phone_number) VALUES (%s, %s, %s)', 
                   (name, school_id, phone_number))
    connection.commit()
    cursor.close()
    connection.close()
