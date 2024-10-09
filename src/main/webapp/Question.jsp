<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Tech Bot</title>
    <%@include file="../components/allcss.jsp"%> <!-- Ensure this CSS file path is correct -->

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f3f4;
            margin: 0;
            padding: 0;
        }
        .content {
            margin: 20px;
        }
        .question-box {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .input-field {
            flex: 1;
            padding: 10px;
            border: 2px solid #4285f4;
            border-radius: 4px;
            font-size: 16px;
        }
        .search-icon {
            background-color: #4285f4;
            border: none;
            color: white;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            margin-left: 5px;
            font-size: 16px;
        }
        .response {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-top: 20px;
        }
        .faq-section {
            margin-top: 40px;
        }
        .faq-title {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #4285f4;
            padding-bottom: 5px;
        }
        .faq-item {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <!-- Navbar inclusion -->
    <%@include file="components/Navbar.jsp"%>

    <!-- Main content -->
    <div class="content">
        <h1>Ask the AI Tech Bot</h1>
        <div class="question-box">
            <input type="text" id="userQuestion" class="input-field" placeholder="Type your tech question here...">
            <button class="search-icon" onclick="getAnswer()">🔍</button>
        </div>
        <div id="response" class="response" style="display:none;"></div>

        <div class="faq-section">
            <div class="faq-title">Frequently Asked Questions</div>
            <div class="faq-item" onclick="displayAnswer('What is AI?')">
                What is AI?
            </div>
            <div class="faq-item" onclick="displayAnswer('What is Machine Learning?')">
                What is Machine Learning?
            </div>
            <div class="faq-item" onclick="displayAnswer('What is the Internet of Things?')">
                What is the Internet of Things?
            </div>
            <div class="faq-item" onclick="displayAnswer('What are the applications of Blockchain?')">
                What are the applications of Blockchain?
            </div>
            <div class="faq-item" onclick="displayAnswer('What is Cybersecurity?')">
                What is Cybersecurity?
            </div>
        </div>
    </div>

    <script>
        const faqAnswers = {
            "What is AI?": "Artificial Intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think and learn.",
            "What is Machine Learning?": "Machine Learning is a subset of AI that enables machines to learn from data without being explicitly programmed.",
            "What is the Internet of Things?": "The Internet of Things (IoT) is the interconnection of everyday objects to the internet, allowing them to send and receive data.",
            "What are the applications of Blockchain?": "Blockchain is used in various applications such as cryptocurrencies, supply chain management, and secure voting systems.",
            "What is Cybersecurity?": "Cybersecurity is the practice of protecting systems, networks, and programs from digital attacks."
        };

        function getAnswer() {
            const userQuestion = document.getElementById('userQuestion').value;
            const answer = faqAnswers[userQuestion] || "I'm sorry, I don't have an answer for that.";
            displayResponse(answer);
        }

        function displayAnswer(question) {
            const answer = faqAnswers[question];
            displayResponse(answer);
        }

        function displayResponse(answer) {
            const responseDiv = document.getElementById('response');
            responseDiv.style.display = 'block';
            responseDiv.innerText = answer;
        }
    </script>

</body>
</html>
