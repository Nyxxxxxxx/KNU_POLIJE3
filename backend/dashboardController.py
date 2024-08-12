from database import get_db_connection

def get_students_data():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('SELECT student_id, name, phone_number, department FROM students')
    students_data = cursor.fetchall()
    cursor.close()
    connection.close()
    return students_data
