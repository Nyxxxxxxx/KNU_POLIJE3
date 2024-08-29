from flask import Flask, request, render_template, redirect, url_for, jsonify, g
import mysql.connector
import logging
from datetime import datetime
from backend.registerController import register_student
from database import get_db_connection
from backend.dashboardController import get_students_data, get_register_login_data, get_attendance_summary, get_students_summary

app = Flask(__name__)
app.secret_key = 'your_secret_key'
logging.basicConfig(level=logging.DEBUG)

# Variabel global untuk menyimpan student_id dan mode fingerprint
student_id_global = None
fingerprint_mode = None

# Routes
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/dashboard')
def dash():
    global fingerprint_mode
    fingerprint_mode = "register_login"
    logging.debug(f"Fingerprint_mode: {fingerprint_mode}")

    register_login_data = get_register_login_data()
    students_summary = get_students_summary()
    attendance_summary = get_attendance_summary()

    return render_template('dash.html', 
                           register_login_data=register_login_data,
                           students_summary=students_summary,
                           attendance_summary=attendance_summary)


@app.route('/attendance_student')
def attendance_student():
    students_data = get_students_data()
    return render_template('attendance_student.html', attendance_records=students_data)

@app.route('/attendance')
def attendance():
    return redirect(url_for('attendance_student'))

@app.route('/register', methods=['GET', 'POST'])
def register_student_route():
    if request.method == 'POST':
        name = request.form['name']
        student_id = request.form['student_id']
        phone_number = request.form['phone_number']
        department = request.form['department']
        
        register_student(name, student_id, phone_number, department)
        
        # Redirect to fingerprint registration page with student_id as a query parameter
        return redirect(url_for('register_finger_route', student_id=student_id))
    return render_template('register_data.html')

@app.route('/register_finger')
def register_finger_route():
    global student_id_global, fingerprint_mode
    student_id = request.args.get('student_id')
    if student_id:
        student_id_global = student_id  # Simpan student_id di variabel global
        fingerprint_mode = "register"
        logging.debug(f"Fingerprint_mode: {fingerprint_mode}")
        logging.debug(f"Received student_id: {student_id} for fingerprint registration")
    return render_template('register_finger.html', student_id=student_id)

@app.route('/start_fingerprint_registration', methods=['GET'])
def start_fingerprint_registration():
    global student_id_global
    if student_id_global:
        logging.debug(f"Sending student_id {student_id_global} to Arduino")
        return jsonify({'student_id': student_id_global})
    else:
        logging.debug(f"Failed to get student_id in /start_fingerprint_registration. URL parameters: {request.args}")
        return jsonify({'status': 'error', 'message': 'No student_id found'})

@app.route('/get_fingerprint_mode', methods=['GET'])
def get_fingerprint_mode():
    global fingerprint_mode
    if fingerprint_mode:
        logging.debug(f"Sending fingerprint_mode: {fingerprint_mode} to Arduino")
        return jsonify({'fingerprint_mode': fingerprint_mode})
    else:
        logging.debug("Fingerprint mode not set")
        return jsonify({'status': 'error', 'message': 'Fingerprint mode not set'})

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
    app.run(debug=True, host='192.168.249.63', port=5000)
