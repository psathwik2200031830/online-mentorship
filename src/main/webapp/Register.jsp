<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<!-- Include Bootstrap CSS -->
<%@include file="components/allcss.jsp"%>
<style>
.container {
    max-width: 400px; /* Set a maximum width for the form */
    margin: auto; /* Center the form */
    padding: 20px; /* Add some padding */
    background-color: #ffffff; /* Background color for the form */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Shadow effect */
}

.form-label {
    margin-bottom: 5px; /* Reduce the bottom margin of labels */
}

.form-control {
    margin-bottom: 15px; /* Reduce the bottom margin of input fields */
}

.btn {
    width: 100%; /* Make button full width */
}
</style>
</head>

<body>
    <%@include file="components/Navbar.jsp"%>

    <div class="container">
        <h2 class="text-center">Register</h2>
        <c:if test="${not empty sucMsg}">
            <p class="text-center text-success fs-3">${sucMsg}</p>
            <c:remove var="sucMsg" scope="session" />
        </c:if>

        <c:if test="${not empty errorMsg}">
            <p class="text-center text-danger fs-3">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>
        <form action="user_register" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
</body>
</html>
