<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.Db.DBConnect" %>
	<%@page import="java.sql.Connection" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> EDUMENTOR</title>

<%@include file="../components/allcss.jsp"%>
<!-- Include Bootstrap CSS -->

<style>
.box {
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
	flex: 1;
}

.container {
	display: flex;
	justify-content: space-around;
	margin-top: 40px;
}

.achievements {
	margin: 40px 0;
}

.certificate {
	border: 2px solid #007bff;
	border-radius: 5px;
	padding: 20px;
	margin: 20px;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.certificate h4 {
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/img0.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container">
		<div class="box">
			<h5>Select Your Course</h5>
			<p>Explore a variety of subjects available for you to learn.</p>
		</div>
		<div class="box">
			<h5>Choose Your Mentor</h5>
			<p>Find a qualified mentor who specializes in your area of
				interest.</p>
		</div>
		<div class="box">
			<h5>Book Your Session</h5>
			<p>Make a payment, reserve your spot, and enjoy your mentoring
				sessions!</p>
		</div>
	</div>

	<div class="achievements text-center">
		<h3>Recent Achievements</h3>
		<ul class="list-unstyled">
			<li>Approved by the Ministry of Education for offering
				accredited courses.</li>
			<li>Recognized by the National Skill Development Corporation for
				excellence in mentoring.</li>
			<li>Over 10,000 successful student-mentor connections made in
				the past year.</li>
		</ul>
	</div>

	<div class="container">
		<div class="certificate">
			<h4>
				<i class="fa-solid fa-book"></i>Certificate of Excellence
			</h4>
			<p>
				This certifies that <strong>madhavi latha</strong> has successfully
				completed the <strong>Hotel management</strong>.
			</p>
			<p>
				Year <strong>2024</strong>
			</p>
			<p>
				Authorized by: <strong>EDUMENTOR</strong>
			</p>
		</div>
		<div class="certificate">
			<h4>
				<i class="fa-solid fa-book"></i>Certificate of Achievement
			</h4>
			<p>
				This certifies that <strong>Bhanuprasad</strong> has demonstrated
				outstanding skills in <strong>Business devolpoment</strong>.
			</p>
			<p>
				Year: <strong>2024</strong>
			</p>
			<p>
				Authorized by: <strong>EDUMENTOR</strong>
			</p>
		</div>
	</div>

</body>
<%@ include file="components/Footer.jsp"%>
</html>
