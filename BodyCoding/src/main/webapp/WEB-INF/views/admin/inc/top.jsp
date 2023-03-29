<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
    <!-- 줄바꿈 처리용 -->
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  background: #e0e5ec;
}
h1 {
  position: relative;
  /* text-align: center; */
  color: #353535;
  font-size: 50px;
  font-family: "Cormorant Garamond", serif;
}

p {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  text-align: center;
  font-size: 18px;
  color: #676767;
}
.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 20px;
  outline: none;
}
.custom-btn {
  width: 130px;
  height: 40px;
  border: 2px solid #212529;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
}

/* 1 */
.btn-1 {
  transition: all 0.3s ease;
}
.btn-1:hover {
   box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
}

/* 2 */
.btn-2 {
  
}
.btn-2:after {
  position: absolute;
  content: "";
  top: 5px;
  left: 6px;
  width: 90%;
  height: 70%;
  border: 1px solid #000;
  opacity: 0;
  transition: all 0.3s ease;
}
.btn-2:hover:after {
  opacity: 1;
}


/* 7 */
.btn-7 {
  background: #212529;
  color: #fff;
  line-height: 42px;
  padding: 0;
  border: none;
  z-index: 1;
   -webkit-transition: all 0.3s linear;
  transition: all 0.3s linear;
}
.btn-7:hover {
  background: transparent;
  color: #000;
}
.btn-7:before,
.btn-7:after {
  position: absolute;
  content: "";
  left: 0;
  width: 100%;
  height: 50%;
  right: 0;
  z-index: -1;
  background: #000;
  transition: all 0.3s ease;
}
.btn-7:before {
  top: 0;
}
.btn-7:after {
  bottom: 0;
}
.btn-7:hover:before,
.btn-7:hover:after {
  height: 0;
  background-color: #000;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/static/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/main/admin">BodyCoding - Admin</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group" style="color: white;">
            	<s:authentication property="name"/>님 환영합니다.
            </div>
        </form>
        
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <c:if test="${not loginResult }">
	                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                	<li><a class="dropdown-item" href="#!"><s:authentication property="name"/>님</a></li>
	                    <li><a class="dropdown-item" href="/admin/auth/updatePwd">Settings</a></li>
	                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
	                    <li><hr class="dropdown-divider" /></li>
	                    <li><a class="dropdown-item" href="/adminLogout.do">Logout</a></li>
	                </ul>
				</c:if>	
            </li>
        </ul>
    </nav>
</body>
</html>