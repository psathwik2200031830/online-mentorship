<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technology News - Updates & Trends</title>
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
        .section-title {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #4285f4;
            padding-bottom: 5px;
        }
        .news-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .news-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 300px;
            transition: transform 0.3s ease-in-out;
            text-decoration: none; /* Ensures links look like normal boxes */
            color: inherit; /* Ensures text color doesn't change */
        }
        .news-card:hover {
            transform: scale(1.05);
        }
        .news-image {
            height: 180px;
            width: 300px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            object-fit: cover; /* Ensures the image fills the box without distortion */
        }
        .news-content {
            padding: 15px;
        }
        .news-title {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }
        .news-description {
            color: #777;
            font-size: 14px;
        }
        .footer {
            background-color: #4285f4;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>

<body>

    <!-- Navbar inclusion -->
    <%@include file="components/Navbar.jsp"%>

    <!-- Main content -->
    <div class="content">
        <div class="section-title">Technology News & Updates</div>

        <div class="news-container">
            <%
                // Simulate fetching data from a backend (can be replaced with a servlet or database connection)
                List<Map<String, String>> techNews = new ArrayList<>();

                Map<String, String> news1 = new HashMap<>();
                news1.put("title", "AI in Healthcare");
                news1.put("description", "Artificial Intelligence is transforming healthcare, providing smarter diagnostic tools and personalized treatments.");
                news1.put("image", "img/aihealth.png");  // Make sure the path is correct
                news1.put("url", "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6616181/");

                Map<String, String> news2 = new HashMap<>();
                news2.put("title", "Blockchain Revolution");
                news2.put("description", "Blockchain technology is revolutionizing industries by ensuring transparent and secure transactions.");
                news2.put("image", "img/blockchain.jpg");
                news2.put("url", "https://blockchain-revolution.com/");

                Map<String, String> news3 = new HashMap<>();
                news3.put("title", "5G Networks");
                news3.put("description", "5G networks are set to bring faster and more reliable connectivity, paving the way for IoT and smart cities.");
                news3.put("image", "img/5g technologies.jpg");
                news3.put("url", "https://telecom.economictimes.indiatimes.com/tag/5g");

                // Add more news articles here
                techNews.add(news1);
                techNews.add(news2);
                techNews.add(news3);

                // Loop through and display news items
                for (Map<String, String> news : techNews) {
            %>
            <a href="<%= news.get("url") != null ? news.get("url") : "#" %>" target="_blank" class="news-card">
                <img class="news-image" style="height: 180px; width: 300px; object-fit: cover;" src="<%= news.get("image") %>" alt="News Image">
                <div class="news-content">
                    <div class="news-title"><%= news.get("title") %></div>
                    <div class="news-description"><%= news.get("description") %></div>
                </div>
            </a>
            <%
                }
            %>
        </div>

        <div class="section-title">Future of Technology</div>
        <div class="news-container">
            <%
                // Simulate future tech fields with URLs
                List<Map<String, String>> futureFields = new ArrayList<>();

                Map<String, String> quantumComputing = new HashMap<>();
                quantumComputing.put("field", "Quantum Computing");
                quantumComputing.put("url", "https://quantumcomputinginc.com/");
                quantumComputing.put("image", "img/Quantum.jpg");

                Map<String, String> augmentedReality = new HashMap<>();
                augmentedReality.put("field", "Augmented Reality");
                augmentedReality.put("url", "https://www.sap.com/india/products/scm/industry-4-0/what-is-augmented-reality.html");
                augmentedReality.put("image", "img/Augumentedreality.jpg");

                Map<String, String> edgeAI = new HashMap<>();
                edgeAI.put("field", "Edge AI");
                edgeAI.put("url", "https://blogs.nvidia.com/blog/what-is-edge-ai/");
                edgeAI.put("image", "img/edgeai.png");

                Map<String, String> sustainableTech = new HashMap<>();
                sustainableTech.put("field", "Sustainable Technology");
                sustainableTech.put("url", "https://www.rubicon.com/sustainability-hub/articles/what-is-sustainable-technology/");
                sustainableTech.put("image", "img/sustainable.jpg");

                Map<String, String> spaceTech = new HashMap<>();
                spaceTech.put("field", "Space Tech");
                spaceTech.put("url", "https://spacetech-i.com/");
                spaceTech.put("image", "img/space.jpg");

                // Add future tech fields to the list
                futureFields.add(quantumComputing);
                futureFields.add(augmentedReality);
                futureFields.add(edgeAI);
                futureFields.add(sustainableTech);
                futureFields.add(spaceTech);

                for (Map<String, String> field : futureFields) {
            %>
            <a href="<%= field.get("url") %>" target="_blank" class="news-card">
                <img class="news-image" style="height: 180px; width: 300px; object-fit: cover;" src="<%= field.get("image") %>" alt="<%= field.get("field") %> Image">
                <div class="news-content">
                    <div class="news-title"><%= field.get("field") %></div>
                    <div class="news-description">Explore the possibilities of <%= field.get("field") %> and its potential to shape the future of technology.</div>
                </div>
            </a>
            <%
                }
            %>
        </div>
    </div>

    <div class="footer">
        &copy; 2024 - Tech News | Powered by Online Mentoring Platform
    </div>

</body>
</html>
