<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom"
	style="color: black;">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> <i
			class="navbar-toggler" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span>
		</i>
		</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="navbar-brand" href="index.jsp"
					style="color: black;"><i class="fa-solid fa-user-tie"></i>
						ADMINDASHBOARD </a></li>
				<li class="nav-item"><a class="nav-link" href="student.jsp"
					style="color: black;">STUDENT DATA</a></li>
				<li class="nav-item"><a class="nav-link" href="teacher.jsp"
					style="color: black;">TEACHER MANAGE</a></li>
					<li class="nav-item"><a class="nav-link" href="viewteacher.jsp"
					style="color: black;">VIEW TEACHER</a></li>
				<li class="nav-item"><a class="nav-link" href="course.jsp"
					style="color: black;">COURSE MANAGEMENT</a></li>


			</ul>


			<form class="d-flex">
				<div class="dropdown" style="margin-left: -150px;">
					<!-- Adjust margin here -->
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogut">Logout</a></li>

					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
