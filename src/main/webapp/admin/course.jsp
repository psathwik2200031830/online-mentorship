<%@page import="com.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Courses"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.Entity.Specialization"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.Entity.Teacher"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Course</title>
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
			<!-- Form for adding a course -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Course</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addcourses" method="post">

							<!-- Course Name Dropdown -->
							<div class="mb-3">
								<label class="form-label">Course Name</label> <select
									name="coursename" required class="form-control">
									<option value="" disabled selected>----select----</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialization> list = dao.getAllSpecialist(); // Fetch all course names (specializations)

									for (Specialization s : list) {
									%>
									<option value="<%=s.getTeacherspecialization()%>"><%=s.getTeacherspecialization()%></option>
									<%
									}
									%>
									<option value="demo">Demo</option>
									<!-- For testing purposes -->
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Course Mentor</label> <input
									type="text" required name="coursementor" class="form-control" />
							</div>
						
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input type="text"
									required name="mobileno" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Price</label> <input type="number"
									required name="price" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">Add Course</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Table to display course details -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Course Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Course Name</th>
									<th scope="col">Course Mentor</th>
									
									<th scope="col">Price</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								CourseDao dao2 = new CourseDao(DBConnect.getConn());
								List<Courses> courseList = dao2.getAllCourses(); // Fetch all courses

								if (courseList != null && !courseList.isEmpty()) {
									for (Courses c : courseList) {
								%>
								<tr>
									<td><%=c.getCourseName()%></td>
									<td><%=c.getCourseMentor()%></td>
									<td><%=c.getPrice()%></td>
									<td><%=c.getEmail()%></td>
									<td><%=c.getMobileNo()%></td>
									<td><a href="edit_course.jsp?id=<%=c.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a href="#"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="8" class="text-center">No courses found.</td>
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
