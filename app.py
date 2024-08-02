from flask import Flask, request, render_template, redirect, url_for, session
import mysql.connector
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Database connection
def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='KP03_DB'
    )
    return connection

# Routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        fingerprint_data = request.form['fingerprint_data']
        face_data = request.form['face_data']

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute('INSERT INTO students (name, fingerprint_data, face_data) VALUES (%s, %s, %s)', 
                       (name, fingerprint_data, face_data))
        connection.commit()
        cursor.close()
        connection.close()
        return redirect(url_for('index'))
    return render_template('register.html')

@app.route('/recognize', methods=['GET', 'POST'])
def recognize():
    if request.method == 'POST':
        fingerprint_data = request.form['fingerprint_data']
        face_data = request.form['face_data']

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute('SELECT id FROM students WHERE fingerprint_data = %s OR face_data = %s', 
                       (fingerprint_data, face_data))
        student = cursor.fetchone()
        if student:
            student_id = student[0]
            cursor.execute('INSERT INTO attendance (student_id, date, time) VALUES (%s, %s, %s)', 
                           (student_id, datetime.now().date(), datetime.now().time()))
            connection.commit()
            cursor.close()
            connection.close()
            return redirect(url_for('dashboard', student_id=student_id))
        cursor.close()
        connection.close()
    return render_template('recognize.html')

@app.route('/dashboard/<int:student_id>')
def dashboard(student_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM attendance WHERE student_id = %s', (student_id,))
    attendance_records = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('dashboard.html', attendance_records=attendance_records)

if __name__ == '__main__':
    app.run(debug=True)
