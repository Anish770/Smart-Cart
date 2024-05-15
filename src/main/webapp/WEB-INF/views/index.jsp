<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Home Page</title>
<link rel="icon" href="favicon.png" type="image/png" sizes="16x16" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link rel="stylesheet" href="css/style.css" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #efefef;
	font-family: "Montserrat", sans-serif;
}

/* Navbar
  .mobile-menu,
  .mob-menu-container,
  .mob-menu-wrap {
    display: none;
  } */
/* //General Config */
#navbar {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: center;
	padding: 16px 56px;
	background-color: #ffffff;
	box-shadow: 0 2px 10px 2px rgba(33, 33, 33, 0.015);
}

/* Logo */
.logo {img { width:150px;
	
}

}
.menu-sec{
	padding-top:10px
}
/* // Menu */
.menu-sec ul .nav-menu {
    display:flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
}
.nav-menu{
	display:inline-flex;
	justify-content: space-evenly
}

ul li {
	list-style: none;
	margin: 0 24px;
	font-size: 15px;
	letter-spacing: 0.6px;
	text-transform: uppercase; a { text-decoration : none;
	color: #000000;
	&.
	active
	{
	color
	:
	#ff6656
	!important;
}

&
:hover {
	color: #ff6656 !important;
}

}
}
}
.a {
	text-decoration: none;
	color: #000000;
	&.
	active
	{
	color
	:
	#ff6656
	!important;
}

&
:hover {
	color: #ff6656 !important;
}

}
.header_login-signup {a { text-decoration:none;
	color: #000000;
	&.
	active
	{
	color
	:
	#ff6656
	!important;
}

&
:hover {
	color: #ff6656 !important;
}

}
}



/* // Body Content */
.body-content {
	height: 88vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* // Footer */
.footer {
	width: 100%;
	position: fixed;
	bottom: 0;
	background-color: #ffffff; p { text-align : center;
	font-size: 13px;
	letter-spacing: 0.65px; a { text-decoration : none;
	color: #ff6656;
}

}
}
#card-img {
	height: 300px;
	width: 25%;
	margin-top: 1rem;
	margin-bottom: 1rem;
}
</style>
</head>
<body>
	<!-- Vertically centered modal -->
	<div class="modal-dialog modal-dialog-centered"></div>
	<div id="navbar" class="container-fluid">
		<div class="pb-3" style="height:38px">
			<a href="home"><img src="images/smart_cart_logo.png" alt="my-logo" class="img-fluid rounded-circle" style="width:60px"/></a>
		</div>
		<div id="menuSection" class="menu-sec">
			<ul class="nav-menu">
				<li><a class="active" href="home">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="seller">Seller Login</a></li>

			</ul>
		</div>

		<div class="header_login-signup">
			<a href="login" data-et-name="intro_tap_login" class="tc--m">Log
				in</a> <span class="header_login-signup_vertical-bar">|</span> <a
				href="signup" data-et-name="intro_tap_signup" class="tc--m">
				Sign up </a>
		</div>
	</div>

	<div class="container mt-3">
		<h2>Guest Index</h2>
		<div class="row">
			<c:forEach var="seller" items="${model_card_products}"
				varStatus="loop">
				<div class="col-md-3">
					<div class="card mb-4">
						<div class="bg-image hover-overlay" data-mdb-ripple-init
							data-mdb-ripple-color="light">
							<img src="uploads/${seller.productimage}" class="img-fluid" /> <a
								href="#!">
								<div class="mask"
									style="background-color: rgba(251, 251, 251, 0.15);"></div>
							</a>
						</div>
						<div class="card-body">
							<h5 class="card-title">${seller.productname}</h5>
							<del style="color: red">Rs. ${seller.originalprice}</del>
							<b> &nbsp;&nbsp; Rs. ${seller.discountprice} </b>
							<p class="card-text">${seller.details}</p>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">Add
								To Cart</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">Login required</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Looks like you didn't login</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<a href="login"><button type="button" class="btn btn-primary">Login</button></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Add a clearfix after every 4th card -->
				<c:if test="${loop.index % 4 == 3}">
					<div class="clearfix visible-md-block visible-lg-block"></div>
				</c:if>
			</c:forEach>
		</div>

		<div class="footer">
			<p>
				Copyright © 2021 | Developed by <a href="#" target="_blank">Sidhant
					and it's team</a>
			</p>
		</div>
		<script type="text/javascript" src="src/script.js"></script>
</body>
</html>