<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" href="favicon.png" type="image/png" sizes="16x16" />
<link rel="preconnect" href="https://fonts.gstatic.com" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link rel="stylesheet" href="css/style.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- Bootstrap JS and Popper.js (required for dropdowns) -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #efefef;
	font-family: "Montserrat", sans-serif;
}

#card-img {
	height: 300px;
	width: 25%;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

#navbar {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: center;
	padding: 16px 56px;
	background-color: #ffffff;
	box-shadow: 0 2px 10px 2px rgba(33, 33, 33, 0.015);
	font-family: 'Montserrat',sans-serif;
}

/* Logo */
.menu-sec{
padding-top: 10px
}
/* // Menu */
.menu-sec {ul .nav-menu {
    display:flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
}
}
.nav-menu{
	display:inline-flex;
	justify-content: space-evenly
}

.user-menu {ul .user {
    display:flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
}
}
ul li{
list-style: none;
	margin: 0 24px;
	font-size: 15px;
	letter-spacing: 0.6px;
	text-transform: uppercase; 
a {
	text-decoration: none;
	color: #000000;
	&.active
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
#header_login-signup {a { text-decoration:none;
	color: #000000;
	&.active
	{
	color
	:
	#ff6656
	!important;
}


</style>
<meta charset="ISO-8859-1">
<title>User page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="margin: 0;
	padding: 0;
	background-color: #efefef;
	font-family: 'Montserrat',sans-serif;
	">
	<div id="navbar" class="container-fluid">
		<div class="pb-3" style="height:38px">
			<a href="#"><img src="images/smart_cart_logo.png" alt="my-logo" class="img-fluid rounded-circle" style="width:60px"/></a>
		</div>
		<div id="menuSection" class="menu-sec">
			<ul class="nav-menu">
				<li><a class="active" href="userhome">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="seller">Seller Login</a></li>

			</ul>
		</div>
		
		<div class="header_login-signup" style="height: 48px">
			<div class="user-menu">
				<ul class="user" style="display: flex; justify-content: space-between;">
				<li style="list-style: none"><button type="button" class="btn btn-secondary mt-2"
			data-bs-toggle="tooltip" data-bs-placement="top"
			data-bs-title="Tooltip on top">${session_name.getName()}</button></li>
					<li style="list-style: none"><div class="pt-3 pb-2 px-2 py-2"><a href="cart"><i
							class="fa-solid fa-cart-shopping fa-lg"></i></a></div></li>
					<li style="list-style: none"><div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="images/user_profile_pic.png"
								class="rounded-circle" height="30" alt="Portrait of a Woman"
								loading="lazy">
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" id="logout" href="logout">Logout</a></li>
							</ul>
						</div></li>

				</ul>
			</div>
			
		</div>
	</div>
	<div class="container mt-3">
		<h2>User Index</h2>
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
							<p onclick = "add_to_cart(${seller.id})" class="btn btn-primary" data-mdb-ripple-init>Add
								To Cart</p>
						</div>
					</div>
				</div>
				<!-- Add a clearfix after every 4th card -->
				<c:if test="${loop.index % 4 == 3}">
					<div class="clearfix visible-md-block visible-lg-block"></div>
				</c:if>
			</c:forEach>
		</div>


	</div>
	
	<script type="text/javascript">
	
	function add_to_cart(sellerId) {
	    console.log(sellerId);
	    fetch('http://localhost:8081/add_to_cart', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({
	            productId: sellerId
	        })
	    })
	    .then(data => {
	        //window.location.href = "http://localhost:8081/cart";
	        return data.json();
	    })
	    .then(data => {
	        console.log(data);
	        window.location.href = "http://localhost:8081/cart"
	    })
	    .catch(error => console.error("Error : ", error));
	}

		
	</script>


</body>

</html>