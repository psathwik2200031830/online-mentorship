<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<%@include file="../components/allcss.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
    <style>
        body {
            background-color: #f8f9fa; /* Light background */
        }

        .container {
            margin-top: 20px;
        }

        .paint-card {
            border: none; /* Remove border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Shadow effect */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Transition for hover effect */
        }

        .paint-card:hover {
            transform: translateY(-5px); /* Slightly lift the card on hover */
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3); /* Deeper shadow on hover */
        }

        .card-body {
            padding: 30px; /* Increase padding */
        }

        .card-body i {
            color: #28a745; /* Green color for icons */
        }

        .fs-4 {
            font-size: 1.5rem; /* Adjust font size for better visibility */
            font-weight: bold; /* Bold font for emphasis */
        }

        .text-success {
            color: #28a745; /* Green text color */
        }

        .text-center {
            text-align: center; /* Center text */
        }
    </style>
</head>
<body>

<c:if test="${empty teachObj }">
    <c:redirect url="../teacherlogin.jsp"></c:redirect>
</c:if>
<%@include file="Navbar.jsp" %>
<p class="text-center fs-3">Teacher Dashboard</p>

<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-2">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Total Teachers <br> 12
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Total Cources<br> 12
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
