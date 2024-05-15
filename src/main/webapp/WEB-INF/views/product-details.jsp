<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>

        <div class="container mt-3 bg-light course_details_div">
            <h4>Product Details</h4>
            <div class="row">
            	<div class="col-4">
            	
            		<img  src="uploads/${model_product.getProductimage()}" alt="" height="100" />
            	</div>
            	<div class="col-8">
            	
            		<p><strong> Product Name : <span class="text-primary"> ${model_product.getProductname()} </span> </strong> </p>
            		<p><strong> Product Price : <del style="color: red">Rs. ${model_product.getOriginalprice()}</del> &nbsp;&nbsp; <span class="text-primary"> Rs. ${model_product.getDiscountprice()} </span> </strong> </p>
            	</div>
            </div>
        </div>
        <br/> <br/>
        <div class="container mt-3 course_details_div">
            <h4>Other Details</h4>
            <div class="row">
            	<div class="col-8">
            		<p class="text-danger"><strong> ${model_product.getOtherdetails()} </strong> </p>
            	</div>
            </div>      
        </div>

    </body>
</html>
