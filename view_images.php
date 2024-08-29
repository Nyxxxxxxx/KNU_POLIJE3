<!-- this is php file for face -->

<?php
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "kp03_db"; // Nama database yang digunakan

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Ambil data dari database
$sql = "SELECT image_path, upload_time FROM images ORDER BY upload_time DESC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ESP32-CAM Gallery</title>
    <style>
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e0f7fa; /* Background biru cerah */
    color: #333; /* Ubah warna teks agar kontras */
    margin: 0;
    padding: 0;
}

.gallery-container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px;
    text-align: center;
    background-color: #ffffff; /* Background putih untuk container */
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* Shadow lebih ringan */
}

h1 {
    margin-bottom: 30px;
    font-size: 3rem;
    color: #0277bd; /* Biru tua untuk teks utama */
    text-transform: uppercase;
    letter-spacing: 2px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Shadow lebih ringan */
}

.featured-item {
    position: relative;
    background-color: #e3f2fd; /* Biru muda untuk item unggulan */
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Shadow lebih ringan */
    margin-bottom: 40px;
    max-width: 70%;
    margin-left: auto;
    margin-right: auto;
}

.featured-item img {
    width: 100%;
    height: auto;
    display: block;
    transition: transform 0.3s ease;
}

.featured-item:hover img {
    transform: scale(1.05);
}

.overlay-featured {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.3); /* Overlay lebih terang */
    overflow: hidden;
    width: 100%;
    height: 0;
    transition: 0.5s ease;
    border-radius: 0 0 15px 15px;
}

.featured-item:hover .overlay-featured {
    height: 30%;
}

.text-featured {
    color: white;
    font-size: 1.2rem;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    padding: 10px;
}

.text-featured span {
    display: block;
    font-size: 1rem;
    color: #f1f1f1; /* Warna teks overlay */
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    grid-gap: 20px;
}

.gallery-item {
    position: relative;
    background-color: #bbdefb; /* Biru sangat muda untuk item biasa */
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow lebih ringan */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.gallery-item img {
    width: 100%;
    height: auto;
    display: block;
    transition: transform 0.3s ease;
}

.gallery-item:hover img {
    transform: scale(1.1);
}

.gallery-item:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Shadow sedikit lebih kuat saat hover */
}

.overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.3); /* Overlay lebih terang */
    overflow: hidden;
    width: 100%;
    height: 0;
    transition: 0.5s ease;
    border-radius: 0 0 10px 10px;
}

.gallery-item:hover .overlay {
    height: 30%;
}

.text {
    color: white;
    font-size: 1rem;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    padding: 10px;
}

.text span {
    display: block;
    font-size: 0.9rem;
    color: #f1f1f1;
}

@media (max-width: 600px) {
    h1 {
        font-size: 2rem;
    }

    .text-featured {
        font-size: 1rem;
    }

    .text {
        font-size: 0.9rem;
    }
}

    </style>
</head>
<body>
    <div class="gallery-container">
        <h1>ESP32-CAM Gallery</h1>

        <!-- Featured Item (Most Recent Image) -->
        <?php
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc(); // Fetch the most recent image
            echo "<div class='featured-item'>";
            echo "<img src='uploads/" . htmlspecialchars(basename($row['image_path'])) . "' alt='ESP32-CAM Image'>";
            echo "<div class='overlay-featured'>";
            echo "<div class='text-featured'>Uploaded on: <span>" . htmlspecialchars($row['upload_time']) . "</span></div>";
            echo "</div>";
            echo "</div>";
        }
        ?>

        <!-- Gallery Grid (Other Images) -->
        <div class="gallery-grid">
            <?php
            if ($result->num_rows > 1) {
                while($row = $result->fetch_assoc()) {
                    echo "<div class='gallery-item'>";
                    echo "<img src='uploads/" . htmlspecialchars(basename($row['image_path'])) . "' alt='ESP32-CAM Image'>";
                    echo "<div class='overlay'>";
                    echo "<div class='text'>Uploaded on: <span>" . htmlspecialchars($row['upload_time']) . "</span></div>";
                    echo "</div>";
                    echo "</div>";
                }
            } else {
                echo "<p>No images found</p>";
            }
            ?>
        </div>
    </div>
</body>
</html>

<?php
$conn->close();
?>
