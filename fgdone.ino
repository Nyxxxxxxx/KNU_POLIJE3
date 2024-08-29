// this is file for fingerprint, you should open it with arduino IDE. it integrate with the fingerprint cencor

#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <HardwareSerial.h>
#include <Adafruit_Fingerprint.h>

#define mySerial Serial2  // Menggunakan Serial2 untuk komunikasi dengan sensor sidik jari

Adafruit_Fingerprint finger = Adafruit_Fingerprint(&mySerial);
String studentId = "";  // Variabel untuk menyimpan student ID
uint8_t id;  // Deklarasi variabel ID di sini

// Ganti dengan kredensial WiFi Anda
const char* ssid = "k";
const char* password = "kimshahaha";
const char* serverName = "http://192.168.249.63/team3/fingerprint.php";  // Endpoint PHP
const char* flaskServer = "http://192.168.249.63:5000/start_fingerprint_registration";  // Endpoint Flask
const char* modeServer = "http://192.168.249.63:5000/get_fingerprint_mode";  // Endpoint untuk mendapatkan fingerprint mode

void setup() {
  Serial.begin(9600); 
  while (!Serial);

  delay(100);
  Serial.println("\n\nAdafruit Fingerprint sensor setup");

  // Mulai komunikasi dengan sensor sidik jari
  mySerial.begin(57600, SERIAL_8N1, 16, 17);

  // Koneksi ke WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("Connected to WiFi");

  if (finger.verifyPassword()) {
    Serial.println("Found fingerprint sensor!");
  } else {
    Serial.println("Did not find fingerprint sensor :(");
    while (1) {
      delay(1);
    }
  }
}

void loop() {
    Serial.println("Ready to enroll a fingerprint!");
    Serial.println("Please place your finger on the scanner...");
    
    id = getNextFingerprintId();

    if (getFingerprintEnroll()) {
        // Setelah sidik jari terdeteksi, ambil fingerprint mode dari server
        String mode;
        if (getFingerprintModeFromServer(mode)) {
            if (mode == "register") {
                Serial.println("Mode is set to 'register'");
                
                if (getStudentIdFromServer()) {
                    sendDataToServer(id, studentId);  // Kirim data ke server setelah enroll berhasil
                } else {
                    Serial.println("Failed to get student ID, not sending data to server.");
                }
            } else if (mode == "register_login") {
              Serial.println("Mode is set to 'register_login'");
                
                if (getStudentIdFromServer()) {
                    sendDataToServer2(id, studentId);  // Kirim data ke server setelah enroll berhasil
                } else {
                    Serial.println("Failed to get student ID, not sending data to server.");
                }
            } else if (mode == "login") {
                Serial.println("Mode is set to 'login'");
                handleFingerprintLogin();  // Proses login sidik jari
            } else {
                Serial.println("Invalid fingerprint mode received.");
            }
        } else {
            Serial.println("Failed to get fingerprint mode from server.");
        }
    } else {
        Serial.println("Failed to enroll fingerprint.");
    }
    delay(10000);  // Tunggu 10 detik sebelum mencoba lagi
}

bool getFingerprintModeFromServer(String &mode) {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        Serial.println("Attempting to connect to Flask server to get fingerprint mode...");
        http.begin(modeServer);
        int httpResponseCode = http.GET();

        Serial.print("HTTP Response code from Flask (mode): ");
        Serial.println(httpResponseCode);

        if (httpResponseCode > 0) {
            String response = http.getString();
            Serial.print("Response from Flask (mode): ");
            Serial.println(response);

            StaticJsonDocument<200> doc;
            DeserializationError error = deserializeJson(doc, response);

            if (!error) {
                const char* modeChar = doc["fingerprint_mode"];
                mode = String(modeChar);
                Serial.print("Extracted fingerprint mode: ");
                Serial.println(mode);
                http.end();
                return true;
            } else {
                Serial.print("Failed to parse JSON (mode): ");
                Serial.println(error.c_str());
            }
        } else {
            Serial.print("Error getting fingerprint mode: ");
            Serial.println(httpResponseCode);
        }
        http.end();
    } else {
        Serial.println("WiFi not connected");
    }
    return false;
}

bool getStudentIdFromServer() {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        Serial.println("Attempting to connect to Flask server...");
        http.begin(flaskServer);  // Akses Flask server
        int httpResponseCode = http.GET();

        Serial.print("HTTP Response code from Flask: ");
        Serial.println(httpResponseCode);

        if (httpResponseCode > 0) {
            String response = http.getString();
            Serial.print("Response from Flask: ");
            Serial.println(response);

            // Parsing JSON menggunakan ArduinoJson
            StaticJsonDocument<200> doc;
            DeserializationError error = deserializeJson(doc, response);

            if (!error) {
                const char* studentIdChar = doc["student_id"];
                studentId = String(studentIdChar);
                Serial.print("Extracted student ID: ");
                Serial.println(studentId);
                http.end();
                return true;
            } else {
                Serial.print("Failed to parse JSON: ");
                Serial.println(error.c_str());
            }
        } else {
            Serial.print("Error getting student ID: ");
            Serial.println(httpResponseCode);
        }
        http.end();
    } else {
        Serial.println("WiFi not connected");
    }
    return false;
}

uint8_t getNextFingerprintId() {
    uint8_t lastStoredId = 0;

    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        http.begin(String(serverName) + "?get_last_id=1");  // Mengambil ID terakhir dari database
        int httpResponseCode = http.GET();

        if (httpResponseCode > 0) {
            String lastIdStr = http.getString();
            lastStoredId = lastIdStr.toInt();
            Serial.print("Last stored ID: ");
            Serial.println(lastStoredId);
        } else {
            Serial.println("Error getting last ID");
        }

        http.end();
    }

    return lastStoredId + 1;  // Increment ID terakhir untuk ID sidik jari baru
}

uint8_t getFingerprintEnroll() {
    int p = -1;
    Serial.print("Waiting for valid finger to enroll as #");
    Serial.println(id);
    while (p != FINGERPRINT_OK) {
        p = finger.getImage();
        switch (p) {
            case FINGERPRINT_OK:
                Serial.println("Image taken");
                break;
            case FINGERPRINT_NOFINGER:
                Serial.println(".");
                break;
            case FINGERPRINT_PACKETRECIEVEERR:
                Serial.println("Communication error");
                break;
            case FINGERPRINT_IMAGEFAIL:
                Serial.println("Imaging error");
                break;
            default:
                Serial.println("Unknown error");
                break;
        }
        yield();
    }

    p = finger.image2Tz(1);
    if (p != FINGERPRINT_OK) {
        Serial.println("Failed to convert first image to template.");
        return p;
    }

    Serial.println("Remove finger");
    delay(2000);
    p = 0;
    while (p != FINGERPRINT_NOFINGER) {
        p = finger.getImage();
        yield();
    }

    Serial.println("Place same finger again");
    while (p != FINGERPRINT_OK) {
        p = finger.getImage();
        switch (p) {
            case FINGERPRINT_OK:
                Serial.println("Image taken");
                break;
            case FINGERPRINT_NOFINGER:
                Serial.print(".");
                break;
            case FINGERPRINT_PACKETRECIEVEERR:
                Serial.println("Communication error");
                break;
            case FINGERPRINT_IMAGEFAIL:
                Serial.println("Imaging error");
                break;
            default:
                Serial.println("Unknown error");
                break;
        }
    }

    p = finger.image2Tz(2);
    if (p != FINGERPRINT_OK) {
        Serial.println("Failed to convert second image to template.");
        return p;
    }

    Serial.print("Creating model for #");
    Serial.println(id);

    p = finger.createModel();
    if (p != FINGERPRINT_OK) {
        Serial.println("Failed to create model.");
        return p;
    }

    p = finger.storeModel(id);
    if (p == FINGERPRINT_OK) {
        Serial.println("Stored!");

        // Verifikasi tambahan setelah penyimpanan
        p = finger.loadModel(id);
        if (p == FINGERPRINT_OK) {
            Serial.print("Fingerprint ID #");
            Serial.print(id);
            Serial.println(" successfully loaded from memory!");

            uint8_t templateCount = finger.getTemplateCount();
            Serial.print("Total templates stored after enroll: ");
            Serial.println(templateCount);
        } else {
            Serial.print("Error loading Fingerprint ID #");
            Serial.print(id);
            Serial.println(" from memory.");
        }

        return 1;  // Enroll berhasil
    } else {
        Serial.println("Failed to store model.");
        return p;
    }
}

void sendDataToServer(uint8_t id, const String& studentId) {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;

        Serial.println("Starting connection to server...");
        Serial.println(serverName);  // Cetak URL untuk debugging

        http.begin(serverName);  // Pastikan URL endpoint benar
        http.addHeader("Content-Type", "application/x-www-form-urlencoded");

        // Format parameter untuk POST sesuai dengan yang diminta PHP
        String postData = "student_id=" + studentId + "&fingerprint_id=" + String(id);

        Serial.print("Sending data to server: ");
        Serial.println(postData);

        int httpResponseCode = http.POST(postData);  // Kirim POST request dengan data yang diperlukan

        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);  // Cetak HTTP response code

        if (httpResponseCode > 0) {
            String response = http.getString();
            Serial.println("Server Response: " + response);
        } else {
            Serial.print("Error on sending POST: ");
            Serial.println(httpResponseCode);
        }

        http.end();
    } else {
        Serial.println("Error in WiFi connection");
    }
}

void sendDataToServer2(uint8_t id, const String& studentId) {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;

        Serial.println("Starting connection to server...");
        Serial.println(serverName);  // Cetak URL untuk debugging

        http.begin(serverName);  // Pastikan URL endpoint benar
        http.addHeader("Content-Type", "application/x-www-form-urlencoded");

        // Format parameter untuk POST sesuai dengan yang diminta PHP
        String postData = "student_id=" + studentId + "&fingerprint_id=" + String(id) + "&status=" + 1;

        Serial.print("Sending data to server: ");
        Serial.println(postData);

        int httpResponseCode = http.POST(postData);  // Kirim POST request dengan data yang diperlukan

        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);  // Cetak HTTP response code

        if (httpResponseCode > 0) {
            String response = http.getString();
            Serial.println("Server Response: " + response);
        } else {
            Serial.print("Error on sending POST: ");
            Serial.println(httpResponseCode);
        }

        http.end();
    } else {
        Serial.println("Error in WiFi connection");
    }
}

void sendLoginDataToServer(uint8_t id) {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;

        Serial.println("Starting connection to server...");
        Serial.println(serverName);  // Cetak URL untuk debugging

        http.begin(serverName);  // Pastikan URL endpoint benar
        http.addHeader("Content-Type", "application/x-www-form-urlencoded");

        // Format parameter untuk POST sesuai dengan yang diminta PHP
        String postData = "fingerprint_id=" + String(id);

        Serial.print("Sending data to server: ");
        Serial.println(postData);

        int httpResponseCode = http.POST(postData);  // Kirim POST request dengan data yang diperlukan

        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);  // Cetak HTTP response code

        if (httpResponseCode > 0) {
            String response = http.getString();
            Serial.println("Server Response: " + response);
        } else {
            Serial.print("Error on sending POST: ");
            Serial.println(httpResponseCode);
        }

        http.end();
    } else {
        Serial.println("Error in WiFi connection");
    }
}

void handleFingerprintLogin() {
    Serial.println("Ready to authenticate with a fingerprint!");
    
    int p = -1;

    uint8_t templateCount = finger.getTemplateCount();
    Serial.print("Total templates stored before login: ");
    Serial.println(templateCount);
    
    if (templateCount == 0) {
        Serial.println("No templates stored in memory, cannot proceed with login.");
        return;
    }
    
    // Langkah 1: Menunggu gambar sidik jari yang baik seperti pada proses register
    while (p != FINGERPRINT_OK) {
        p = finger.getImage();
        switch (p) {
            case FINGERPRINT_OK:
                Serial.println("Image taken for login");
                break;
            case FINGERPRINT_NOFINGER:
                Serial.println(".");
                break;
            case FINGERPRINT_PACKETRECIEVEERR:
                Serial.println("Communication error during login image capture");
                break;
            case FINGERPRINT_IMAGEFAIL:
                Serial.println("Imaging error during login image capture");
                break;
            default:
                Serial.println("Unknown error during login image capture");
                break;
        }
        yield();
    }

    // Langkah 2: Konversi gambar menjadi template (hanya sekali)
    p = finger.image2Tz(1); // Menggunakan buffer 1 untuk template
    if (p != FINGERPRINT_OK) {
        Serial.println("Failed to convert image to template during login.");
        return;
    }
    Serial.println("Image converted to template successfully for login");

    // Langkah 3: Melakukan pencarian sidik jari dengan template
    p = finger.fingerFastSearch();
    if (p == FINGERPRINT_OK) {
        Serial.print("Found ID #");
        Serial.print(finger.fingerID);
        Serial.print(" with confidence ");
        Serial.println(finger.confidence);
        
        sendLoginDataToServer(finger.fingerID);  // Kirim hanya fingerprint_id ke server PHP untuk login
    } else {
        Serial.println("No match found during login.");
    }
}