<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="com.dao.RegistercourseDao"%>
<%@page import="com.Entity.Teacher"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.Entity.Registercourse"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Details</title>
    <%@include file="../components/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <c:if test="${empty teachObj }">
        <c:redirect url="../teacherlogin.jsp"></c:redirect>
    </c:if>
    <%@include file="Navbar.jsp"%>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>

                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mob No</th>
                                    <th scope="col">Joining Date</th>
                                    <th scope="col">Duration</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Teacher T = (Teacher) session.getAttribute("teachObj");
                                    RegistercourseDao dao = new RegistercourseDao(DBConnect.getConn());
                                    List<Registercourse> list = dao.getallregisteredbyTeacher(T.getId());
                                    for (Registercourse rc : list) {
                                %>
                                <tr>
                                    <td><%=rc.getUsername()%></td>
                                    <td><%=rc.getGender()%></td>
                                    <td><%=rc.getEmail()%></td>
                                    <td><%=rc.getPhoneno()%></td>
                                    <td><%=rc.getJoiningdate()%></td>
                                    <td><%=rc.getDuration()%></td>
                                    <td><%=rc.getStatus()%></td>
                                    <td>
                                        <%
                                        if ("pending".equals(rc.getStatus())) { %>
                                            <a href="comment.jsp?id=<%=rc.getId()%>"
                                               class="btn btn-success btn-sm">Comment</a>
                                        <% } else { %>
                                            <a href="#" class="btn btn-secondary btn-sm disabled">Comment</a>
                                        <% } %>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
