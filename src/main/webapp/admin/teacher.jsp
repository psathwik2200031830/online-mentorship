<%@page import="com.dao.TeacherDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Specialization"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.Entity.Teacher"%>
<%@page import="com.dao.CourseDao"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Teacher</title>
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
			<!-- Form for adding a teacher -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Teacher</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addteacher" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Specialization</label> <select
									name="specialization" required class="form-control">
									<option>----select----</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialization> list = dao.getAllSpecialist();
									for (Specialization s : list) {
									%>
									<option><%=s.getTeacherspecialization()%></option>
									<%
									}
									%>
									<option>demo</option>
									<!-- For testing purposes -->
								</select>
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
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">Add
								Teacher</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Table to display teacher details -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Teacher Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialization</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								TeacherDao dao2 = new TeacherDao(DBConnect.getConn());
								List<Teacher> teacherList = dao2.getAllTeachers();

								if (teacherList != null && !teacherList.isEmpty()) {
									for (Teacher T : teacherList) {
								%>
								<tr>
									<td><%=T.getFullname()%></td>
									<td><%=T.getDob()%></td>
									<td><%=T.getQualification()%></td>
									<td><%=T.getSpecialization()%></td>
									<td><%=T.getEmail()%></td>
									<td><%=T.getMobno()%></td>
									<td><a href="edit_teacher.jsp?id=<%=T.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a href="#"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
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
