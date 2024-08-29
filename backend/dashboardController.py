from database import get_db_connection

def get_students_data():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('SELECT student_id, name, phone_number, department FROM students')
    students_data = cursor.fetchall()
    cursor.close()
    connection.close()
    return students_data

def get_register_login_data():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('''
        SELECT rl.no, rl.student_id, s.name, s.department, rl.check_in
        FROM register_login rl
        JOIN students s ON rl.student_id = s.student_id
        ORDER BY rl.no ASC
    ''')
    register_login_data = cursor.fetchall()
    cursor.close()
    connection.close()
    return register_login_data

def get_students_summary():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('''
        SELECT department, COUNT(*) as total_students
        FROM students
        GROUP BY department
    ''')
    students_summary = cursor.fetchall()
    cursor.close()
    connection.close()
    return students_summary

def get_attendance_summary():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('''
        SELECT COUNT(*) as total_attendance
        FROM register_login
    ''')
    attendance_summary = cursor.fetchone()
    cursor.close()
    connection.close()
    return attendance_summary

