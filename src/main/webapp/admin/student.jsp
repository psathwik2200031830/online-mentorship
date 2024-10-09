<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.RegistercourseDao"%>
<%@page import="com.Entity.Teacher" %>
<%@page import="com.Entity.Registercourse" %>
<%@page import="java.util.List" %>
<%@page import="com.dao.TeacherDao" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student data</title>
    <%@include file="../components/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@include file="Navbar.jsp"%>

    <div class="col-md-12">
        <div class="card paint-card">
            <div class="card-body">
                <p class="fs-3 text-center">Student Details</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Student name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mob No</th>
                            <th scope="col">Teachername (COURSE)</th>
                            <th scope="col">Teacher id</th>
                            <th scope="col">Joining Date</th>
                            <th scope="col">Duration</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        RegistercourseDao dao = new RegistercourseDao(DBConnect.getConn());
                        TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
                        List<Registercourse> list = dao.getallregistered();
                        for (Registercourse rc : list) {
                            Teacher T = dao2.getTeacherById(rc.getTeachername());
                        %>
                            <tr>
                                <td><%= rc.getUsername() %></td>
                                <td><%= rc.getGender() %></td>
                                <td><%= rc.getEmail() %></td>
                                <td><%= rc.getPhoneno() %></td>
                                <td><%= T.getFullname() %></td>
                                <td><%= rc.getTeachername() %></td>
                                <td><%= rc.getJoiningdate() %></td>
                                <td><%= rc.getDuration() %></td>
                                <td><%= rc.getStatus() %></td>
                            </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
