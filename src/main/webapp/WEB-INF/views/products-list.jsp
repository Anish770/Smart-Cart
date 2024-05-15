<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product's List</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script>
        	function productDetails(productName)
        	{
        		window.location.href="/productDetails?productName="+encodeURIComponent(productName);
        	}
        </script>
        
    </head>
    <body>
        <c:if test="${not empty model_success}">
			<div class="row">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					${model_success}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</div>
		</c:if>

		<c:if test="${not empty model_error}">
			<div class="row">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					${model_error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</div>
		</c:if>
        
        <div class="container mt-3">
            <h2>Product's List</h2>
            <p> Below table displays only 5 course list </p>            
            <table class="table table-light table-bordered table-striped">
                <thead>
                    <tr>
                    	<th>Product Image</th>
                        <th>Product Name</th>
                        <th>Product Price</th>
                        <th style="text-align: center;">Full Details</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${model_list_products}">
                    	<tr>
                    		<td> <img src="uploads/${product.getProductimage()}" alt="" height="100" /> </td>
                    		<td> ${product.getProductname()} </td>
                    		<td> <del style="color: red">Rs. ${product.getOriginalprice()}</del> <b> &nbsp;&nbsp; Rs. ${product.getDiscountprice()} </b> </td>  		
                    		<td style="text-align: center;"> 
                    			<button class="btn btn-secondary" onclick="productDetails('${product.getProductname()}')"><i class="bi bi-arrow-right-square-fill"></i></button>
                    		</td>
                    	</tr>
                    </c:forEach>
                </tbody>
            </table>
             <ul class="pagination">
             	<c:choose>
             		<c:when test="${model_current_page > 1}">
		            	<li class="page-item">
		            		<a class="page-link" href="/productlist?page=${model_current_page-1}">Previous</a>
		            	</li>
		            </c:when>
		            <c:when test="${model_current_page == 1}">
		            	<li class="page-item disabled">
		            		<a class="page-link" href="/productlist?page=${model_current_page-1}">Previous</a>
		            	</li>
		            </c:when>
             	</c:choose>
             	
	            <c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
	            	<c:choose>
	            		<c:when test="${model_current_page == pageNumber}">
	            			<li class="page-item active">
			            		<a class="page-link" href="/productlist?page=${pageNumber}">${pageNumber}</a>
			            	</li>
	            		</c:when>
	            		<c:when test="${model_current_page != pageNumber}">
	            			<li class="page-item">
			            		<a class="page-link" href="/productlist?page=${pageNumber}">${pageNumber}</a>
			            	</li>
	            		</c:when>
	            	</c:choose>
	            </c:forEach>
	            
	            <c:choose>
	            	<c:when test="${model_current_page < model_total_pages}">
		            	<li class="page-item">
		            		<a class="page-link" href="/productlist?page=${model_current_page+1}">Next</a>
		            	</li>
		            </c:when>
		            <c:when test="${model_current_page == model_total_pages}">
		            	<li class="page-item disabled">
		            		<a class="page-link" href="/productlist?page=${model_current_page+1}">Next</a>
		            	</li>
		            </c:when>
	            </c:choose>
			</ul> 
        </div>
    </body>
</html>
