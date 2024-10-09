<%@page import="com.dao.TeacherDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Specialization"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.Entity.Teacher"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Teacher</title>
    <%@include file="../components/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@include file="Navbar.jsp"%>

    <div class="container-fluid p-3">
        <div class="row">
            <!-- Form for editing a teacher -->
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Edit Teacher</p>
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>  

                        <%
                        // Get the ID parameter from the request
                        String idParam = request.getParameter("id");
                        int id = Integer.parseInt(idParam); // Parse the ID
                        TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
                        Teacher T = dao2.getTeacherById(id); // Call the correct method from TeacherDao
                        %>

                        <form action="../updateTeacher" method="post"> <!-- Change the action to the correct endpoint -->
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" value="<%= T.getFullname() %>" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" required name="dob" value="<%= T.getDob() %>" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input type="text" required name="qualification" value="<%= T.getQualification() %>" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialization</label>
                                <select name="specialization" required class="form-control">
                                    <option><%=T.getSpecialization() %></option>
                                    <%
                                        SpecialistDao specialistDao = new SpecialistDao(DBConnect.getConn());
                                        List<Specialization> list = specialistDao.getAllSpecialist();
                                        for (Specialization s : list) {
                                    %>
                                        <option <%= s.getTeacherspecialization().equals(T.getSpecialization()) ? "selected" : "" %>> <%= s.getTeacherspecialization() %> </option>
                                    <%
                                        }
                                    %>
                                    <option>demo</option> <!-- For testing purposes -->
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile No</label>
                                <input type="text" required name="mobileno" value="<%= T.getMobno() %>" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" required name="email" value="<%= T.getEmail() %>" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="text" required name="password" class="form-control" />
                            </div>
                            <input type="hidden" name="id" value="<%=T.getId() %>">
                            <button type="submit" class="btn btn-primary col-md-12">UPDATE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
