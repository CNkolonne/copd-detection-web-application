<?php
// JSON response එකක් ලබා දෙන බව තහවුරු කරයි
header('Content-Type: application/json');

// Database connection එක ඇතුළත් කිරීම
include 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['audio'])) {
    
    // දත්ත ලබා ගැනීම
    $patient_id = $_POST['patient_id'] ?? 'Unknown';
    $test_id = $_POST['test_id'] ?? 'T-' . time();
    $sample_no = $_POST['sample_no'];
    
    // Upload folder එක නැත්නම් එය සාදන්න
    $dir = "uploads/";
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }

    // File එකට අලුත් නමක් සෑදීම
    $file_name = $patient_id . "_" . $test_id . "_Sample" . $sample_no . "_" . time() . ".webm";
    $upload_path = $dir . $file_name;

    // File එක uploads folder එකට move කිරීම
    if (move_uploaded_file($_FILES['audio']['tmp_name'], $upload_path)) {
        
        $sample_id = "S-" . uniqid();
        $audio_url = $upload_path;
        $sample_date = date("Y-m-d");
        $sample_time = date("H:i:s");

        try {
            // Database insert query එක PDO වලට අනුව (Named Placeholders භාවිතා කර)
            $sql = "INSERT INTO samples (Test_id, Sample_ID, Audio_URL, Sample_date, Sample_time, Patient_ID) 
                    VALUES (:test_id, :sample_id, :audio_url, :sample_date, :sample_time, :patient_id)";
            
            $stmt = $conn->prepare($sql);
            
            // PDO execute එකට අදාළ අගයන් array එකක් ලෙස ලබා දීම
            $result = $stmt->execute([
                ':test_id' => $test_id,
                ':sample_id' => $sample_id,
                ':audio_url' => $audio_url,
                ':sample_date' => $sample_date,
                ':sample_time' => $sample_time,
                ':patient_id' => $patient_id
            ]);

            if ($result) {
                echo json_encode(["status" => "success", "message" => "Sample $sample_no saved and database updated"]);
            } else {
                echo json_encode(["status" => "error", "message" => "Database execution failed"]);
            }

        } catch (PDOException $e) {
            // Database එකේ ඇති වන වැරදි මෙහිදී පෙන්වයි
            echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }

    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed. Check folder permissions."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid Request"]);
}
?>