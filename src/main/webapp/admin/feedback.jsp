<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback System</title>
    <%@include file="../components/allcss.jsp"%>

    <!-- Bootstrap and FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            background-color: #f1f1f1;
            font-family: 'Arial', sans-serif;
        }

        .feedback-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .feedback-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .feedback-header h2 {
            font-size: 28px;
            color: #333;
        }

        .student-info {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border-left: 4px solid #007bff;
        }

        .student-info h4, .student-info p {
            margin: 0;
            color: #555;
        }

        .feedback-section {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f9f9f9;
            border-left: 4px solid #28a745;
            border-radius: 5px;
        }

        .feedback-section h5 {
            color: #28a745;
            font-weight: bold;
        }

        .feedback-section p {
            font-size: 16px;
            color: #333;
        }

        .response-section {
            margin-top: 30px;
        }

        .response-section h5 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .response-section textarea {
            width: 100%;
            height: 150px;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .submit-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="container feedback-container">
        <div class="feedback-header">
            <h2>Feedback from Students</h2>
        </div>

        <!-- Student Info -->
        <div class="student-info">
            <h4>Student: Sarah Johnson</h4>
            <p>ID: S98765</p>
        </div>

        <!-- Feedback Section -->
        <div class="feedback-section">
            <h5>Feedback:</h5>
            <p>
                The mentorship sessions have been incredibly helpful, but the platform needs improvement in terms of usability.
                There are occasional bugs that hinder the experience.
            </p>
        </div>

        <!-- Admin Response Form -->
        <div class="response-section">
            <h5>Respond as Admin:</h5>
            <form action="submitFeedbackResponse" method="post">
                <textarea name="adminResponse" placeholder="Write your response here..." required></textarea>
                <input type="hidden" name="studentId" value="S98765">
                <input type="hidden" name="studentName" value="Sarah Johnson">
                <button type="submit" class="submit-btn">Submit Response</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</body>
</html>
