<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

    #card-img{
    height: 300px;
    width:25%;
    margin-top: 1rem;
    margin-bottom: 1rem;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div  class="container mt-3">
	<h2>user+ index</h2>
	<div class="row">
    <c:forEach var="seller" items="${model_card_products}" varStatus="loop">
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="bg-image hover-overlay" data-mdb-ripple-init data-mdb-ripple-color="light">
                    <img src="uploads/${seller.productimage}" class="img-fluid" />
                    <a href="#!">
                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                    </a>
                </div>
                <div class="card-body">
                    <h5 class="card-title">${seller.productname}</h5>
                     <del style="color: red">Rs. ${seller.originalprice}</del> <b> &nbsp;&nbsp; Rs. ${seller.discountprice} </b>
                    <p class="card-text">${seller.details}</p>
                    <a href="#!" class="btn btn-primary" data-mdb-ripple-init>Add To Cart</a>
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
</body>
</html>
</body>
</html>