<!-- this is php file for face -->

<?php
$servername = "localhost";
$username = "root"; // Ganti dengan username MySQL Anda
$password = ""; // Ganti dengan password MySQL Anda
$dbname = "kp03_db";

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if(isset($_FILES['imageFile'])){
    // Tentukan direktori untuk menyimpan gambar
    $targetDir = "uploads/";
    // Buat nama file unik dengan menambahkan timestamp
    $imageName = time() . "_" . basename($_FILES['imageFile']['name']);
    $targetFilePath = $targetDir . $imageName;

    // Pindahkan file yang diunggah ke direktori tujuan
    if(move_uploaded_file($_FILES['imageFile']['tmp_name'], $targetFilePath)){
        // Simpan path gambar ke dalam database
        $stmt = $conn->prepare("INSERT INTO images (image_path) VALUES (?)");
        $stmt->bind_param("s", $targetFilePath);

        if($stmt->execute()){
            echo "Image uploaded and path saved to database successfully";
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    } else {
        echo "Failed to move uploaded file.";
    }
}

$conn->close();
?>