<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@include file="components/allcss.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.Entity.Teacher" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport meta tag -->
    <title>Student Registration</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            border-radius: 10px; /* Add border radius for a nicer look */
            min-height: 100px; /* Set minimum height for the card */
            display: flex; /* Enable Flexbox */
            align-items: center; /* Center items vertically */
            justify-content: center; /* Center items horizontally */
            margin: auto; /* Center the card */
            max-width: 600px; /* Limit the card width */
            padding: 20px; /* Add padding */
        }
        .form-container {
            width: 100%;
        }
    </style>
</head>
<body>

<%@include file="components/Navbar.jsp"%>

<div class="container p-3">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card paint-card">
                <div class="card-body form-container"> <!-- Added form-container class -->
                    <p class="text-center fs-3">Course Register</p>
                    
                    <!-- Error Message -->
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <!-- Success Message -->
                    <c:if test="${not empty succMsg}">
                        <p class="fs-4 text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <!-- Appointment Form -->
                    <form class="row g-2" action="registercourse" method="post">
                        <input type="hidden" name="userid" value="${userObj.id}">
                        
                        <!-- Full Name -->
                        <div class="col-md-6">
                            <label for="inputFullName" class="form-label">Username</label>
                            <input required type="text" class="form-control" id="inputFullName" name="username">
                        </div>

                        <!-- Gender -->
                        <div class="col-md-6">
                            <label for="inputGender" class="form-label">Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input required type="email" class="form-control" id="inputEmail" name="email">
                        </div>

                        <!-- Phone Number -->
                        <div class="col-md-6">
                            <label for="inputPhone" class="form-label">Phone No</label>
                            <input  required type="text" class="form-control" id="inputPhone" name="phno">
                        </div>

                        <!-- Teacher Selection -->
                        <div class="col-md-6">
                            <label for="inputTeacher" class="form-label">Teacher (Specialization)</label>
                            <select required class="form-control" name="teachername">
                                <option value="">--select--</option>
                                <%TeacherDao dao = new TeacherDao(DBConnect.getConn());
                                List<Teacher> list = dao.getAllTeachers();
                                for (Teacher T : list) { %>
                                    <option value="<%=T.getId()%>"><%=T.getFullname()%> (<%=T.getSpecialization()%>)</option>
                                <% } %>
                            </select>
                        </div>

                        <!-- Joining Date -->
                        <div class="col-md-6">
                            <label for="inputJoinDate" class="form-label">Joining Date</label>
                            <input required type="date" class="form-control" id="inputJoinDate" name="joiningdate">
                        </div>

                        <!-- Duration Period -->
                        <div class="col-md-6">
                            <label for="inputDuration" class="form-label">Duration</label>
                            <select required class="form-control" name="duration">
                                <option value="">--select--</option>
                                <option value="1 Month">1 Month</option>
                                <option value="3 Months">3 Months</option>
                                <option value="6 Months">6 Months</option>
                                <option value="12 Months">12 Months</option>
                            </select>
                        </div>

                        <!-- Submit Button -->
                        <c:if test="${empty userObj}">
                            <a href="userlogin.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                        </c:if>
                        <c:if test="${not empty userObj}">
                            <button type="submit" class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
