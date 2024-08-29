<!-- this is php file for fingerprint, it integrate with the database -->

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kp03_db";

// Buat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fungsi untuk mendapatkan ID fingerprint terakhir
function getLastFingerprintId($conn) {
    $result = $conn->query("SELECT MAX(id) as lastId FROM fingerprints");
    $row = $result->fetch_assoc();
    return $row['lastId'] ? $row['lastId'] : 0;
}

// Cek jika ini permintaan untuk mendapatkan ID terakhir
if (isset($_GET['get_last_id'])) {
    echo getLastFingerprintId($conn);
    exit;
}

$student_id = isset($_POST['student_id']) ? $_POST['student_id'] : null;
$fingerprint_id = isset($_POST['fingerprint_id']) ? intval($_POST['fingerprint_id']) : 0;
$status = isset($_POST['status']) ? intval($_POST['status']) : null;

error_log("Received student_id: " . $student_id);
error_log("Received fingerprint_id: " . $fingerprint_id);
error_log("Received status: " . $status);

if (!empty($fingerprint_id) && !empty($student_id) && is_null($status)) {
    // Registrasi sidik jari
    $stmt = $conn->prepare("INSERT INTO fingerprints (student_id, fingerprint_id, reg_date) VALUES (?, ?, NOW())");
    $stmt->bind_param("si", $student_id, $fingerprint_id);
    if ($stmt->execute()) {
        echo "Data stored successfully";
        logLoginAttempt($conn, $fingerprint_id, $student_id, 'SUCCESS', 'Registration successful');
    } else {
        echo "Error storing data: " . $stmt->error;
        logLoginAttempt($conn, $fingerprint_id, $student_id, 'FAILURE', $stmt->error);
    }
    $stmt->close();
} elseif (!empty($fingerprint_id) && empty($student_id) && is_null($status)) {
    // Proses login
    $stmt = $conn->prepare("SELECT student_id FROM fingerprints WHERE fingerprint_id = ?");
    $stmt->bind_param("i", $fingerprint_id);
    $stmt->execute();
    $stmt->bind_result($student_id);
    $stmt->fetch();
    $stmt->close();

    if ($student_id) {
        recordAttendance($conn, $student_id);
        logLoginAttempt($conn, $fingerprint_id, $student_id, 'SUCCESS', 'Login successful');
    } else {
        echo "Fingerprint ID not found in database.";
        logLoginAttempt($conn, $fingerprint_id, null, 'FAILURE', 'Fingerprint ID not found');
    }
} elseif (!empty($fingerprint_id) && !empty($student_id) && !is_null($status)) {
    // Proses registrasi dan login ke tabel register_login
    $stmt = $conn->prepare("INSERT INTO register_login (student_id, check_in) VALUES (?, NOW())");
    $stmt->bind_param("s", $student_id);
    if ($stmt->execute()) {
        echo "Registration and login data stored successfully";
        logLoginAttempt($conn, $fingerprint_id, $student_id, 'SUCCESS', 'Register and login successful');
    } else {
        echo "Error storing registration and login data: " . $stmt->error;
        logLoginAttempt($conn, $fingerprint_id, $student_id, 'FAILURE', $stmt->error);
    }
    $stmt->close();
} else {
    echo "Invalid data";
    logLoginAttempt($conn, $fingerprint_id, $student_id, 'FAILURE', 'Invalid data received');
    error_log("Invalid data received: student_id = $student_id, fingerprint_id = $fingerprint_id, status = $status");
}

// Fungsi untuk mencatat kehadiran
function recordAttendance($conn, $student_id) {
    $stmt = $conn->prepare("INSERT INTO attendances (student_id, time) VALUES (?, NOW())");
    $stmt->bind_param("s", $student_id);
    if ($stmt->execute()) {
        echo "Attendance recorded successfully";
    } else {
        echo "Error recording attendance: " . $stmt->error;
    }
    $stmt->close();
}

// Fungsi untuk mencatat upaya login
function logLoginAttempt($conn, $fingerprint_id, $student_id, $status, $message) {
    $stmt = $conn->prepare("INSERT INTO login_attempts (fingerprint_id, student_id, attempt_time, status, message) VALUES (?, ?, NOW(), ?, ?)");
    $stmt->bind_param("isss", $fingerprint_id, $student_id, $status, $message);
    if (!$stmt->execute()) {
        error_log("Failed to log login attempt: " . $stmt->error);
    }
    $stmt->close();
}

$conn->close();
