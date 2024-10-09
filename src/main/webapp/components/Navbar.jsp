<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDUMENTOR</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1SAeYTMAR3wC6BB"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa-solid fa-chalkboard"></i> EDUMENTOR</a>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Trending.jsp">Trending</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Question.jsp">Question</a></li>
				</c:if>

			</ul>

			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:if test="${empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="adminlogin.jsp"><i
							class="fa-solid fa-right-to-bracket"></i> Admin Login</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="userlogin.jsp"><i
							class="fa-solid fa-right-to-bracket"></i> User Login</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="teacherlogin.jsp"><i
							class="fa-solid fa-right-to-bracket"></i> Teacher Login</a></li>
				</c:if>

				<c:if test="${not empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="registercourse.jsp"><i class="fa-solid fa-book"></i>
							Course Registration</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="selectedcoursesview.jsp"> Selected Courses</a></li>
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-regular fa-user"></i> ${userObj.username}
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>

	<!-- Include Bootstrap JS (Optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kkmN6eDF6FwsiM7K2FNxyg7Db6rtF+0sjIRjKOtbz4mc9t6EGUFSAwQ20I9B6Aiy"
		crossorigin="anonymous"></script>
</body>
</html>
