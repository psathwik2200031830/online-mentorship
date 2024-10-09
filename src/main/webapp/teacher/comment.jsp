<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.RegistercourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Entity.Teacher" %>
<%@page import="com.Entity.Registercourse" %>
<%@page import="java.util.List" %>
	<%@page import="com.dao.TeacherDao" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
<style>
    .paint-card {
        border: 1px solid #ccc;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 20px;
        background-color: #fff;
    }
</style>
</head>
<body>
    <c:if test="${empty teachObj }">
        <c:redirect url="../teacherlogin.jsp"></c:redirect>
    </c:if>

    <%@include file="Navbar.jsp"%>
    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4">Student Feedback</p>

                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        RegistercourseDao dao = new RegistercourseDao(DBConnect.getConn());
                        Registercourse rc = dao.getregisterdbyid(id);
                        %>
                        <form class="row" action="../updateStatus" method="post">
                            <div class="col-md-6">
                                <label>Patient Name</label>
                                <input type="text" readonly value="<%= rc.getUsername() %>" class="form-control">
                            </div>
                           
                             <div class="col-md-6">
                                <label>gender</label>
                                <input type="text" value="<%= rc.getGender() %>" readonly class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <input type="text" value="<%= rc.getEmail() %>" readonly class="form-control">
                            </div>
                            <div class="col-md-6">
                                <br> 
                                <label>Mob No</label>
                                <input type="text" readonly value="<%= rc.getPhoneno() %>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <br> 
                                <label>Comment</label>
                                <textarea required name="comm" class="form-control" rows="3"></textarea>
                            </div>
                            <input type="hidden" name="id" value="<%= rc.getId() %>">
                            <input type="hidden" name="tid" value="<%= rc.getTeachername() %>">
                            <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
