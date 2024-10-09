<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../components/allcss.jsp"%>

<!-- Include Bootstrap CSS for styling -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1SAeYTMAR3wC6BB"
	crossorigin="anonymous">
<!-- Include FontAwesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
/* Basic styling for the dashboard */
body {
	background-color: #f7f7f7;
}

.dashboard-title {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;
	font-size: 36px;
	color: #333;
}

.dashboard-grid {
	display: flex;
	justify-content: space-around;
	margin: 0 auto;
	padding: 20px;
	max-width: 1200px;
	flex-wrap: wrap;
}

.dashboard-card {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 22%;
	padding: 20px;
	text-align: center;
	transition: transform 0.3s ease-in-out;
	margin-bottom: 20px;
}

.dashboard-card:hover {
	transform: translateY(-5px);
}

.dashboard-card i {
	font-size: 50px;
	color: #333;
	margin-bottom: 20px;
}

.dashboard-card h3 {
	font-size: 20px;
	color: #333;
	margin-bottom: 10px;
}

.dashboard-card p {
	font-size: 16px;
	color: #777;
}
</style>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	<h1 class="dashboard-title">Admin Dashboard</h1>
	<c:if test="${not empty errorMsg}">
			<p class="text-center text-danger fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<c:if test="${not empty succMsg}">
			<p class="text-center text-success fs-3">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

	<div class="dashboard-grid">

		<!-- Students Card -->
		<div class="dashboard-card">
			<i class="fas fa-user-graduate"></i>
			<h3>Students</h3>
			<p>Manage students and their profiles</p>
		</div>

		<!-- Teachers Card -->
		<div class="dashboard-card">
			<i class="fas fa-chalkboard-teacher"></i>
			<h3>Teachers</h3>
			<p>View and manage teacher profiles</p>
		</div>

		<!-- Specialists Card -->
		<div class="dashboard-card" data-bs-toggle="modal"
			data-bs-target="#exampleModal">
			<i class="fas fa-user-md"></i>
			<h3>Specialists</h3>
			<p>Manage specialist services</p>
		</div>

		<!-- Certificate Issue Card -->
		<div class="dashboard-card">
			<i class="fa-solid fa-stamp"></i>
			<h3>Certificate Issue</h3>
			<p>Send certified students their certificates</p>
		</div>

		<!-- Feedback Card -->
		<div class="dashboard-card">
			<a href="feedback.jsp" style="text-decoration: none; color: inherit;">
				<i class="fa-solid fa-comments"></i>
				<h3>Feedback</h3>
				<p>View and manage feedback from students and teachers</p>
			</a>
		</div>

	</div>

	<!-- Include Bootstrap JS (Optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kkmN6eDF6FwsiM7K2FNxyg7Db6rtF+0sjIRjKOtbz4mc9t6EGUFSAwQ20I9B6Aiy"
		crossorigin="anonymous"></script>

	<!-- Modal for Specialists Card -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Specialist
						Services</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label>Enter specialist name</label> <input type="text"
								name="specialization_name" class="form-control">
						</div>
						<div class="text-center mt-3">
                              <button type="submit" class="btn btn-primary">ADD</button>
                        </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
