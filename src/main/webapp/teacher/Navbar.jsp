<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg" style="background-color: transparent;">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp" style="color: black;">
                        <i class="fa-solid fa-chalkboard-user"></i> TEACHER DASHBOARD
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Student.jsp" style="color: black;">Student</a>
                </li>
            </ul>
            <form class="d-flex">
                <div class="dropdown" style="margin-left: -150px;">
                    <button class="btn btn-light dropdown-toggle" type="button"
                        id="dropdownMenuButton1" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        ${teachObj.fullname}
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="../doctorlogout">Logout</a></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</nav>
