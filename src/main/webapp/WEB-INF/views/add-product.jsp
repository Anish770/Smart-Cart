<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Product</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container-fluid">
			<div class="container">
	
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
				
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 d-flex justify-content-center">
					<div class="addemp_div_design bg-light">
						<h3>Add Product Details</h3>
						<br />
						<form:form id="seller" action="/addProductForm" method="post" modelAttribute="seller" enctype="multipart/form-data">
							<div class="mb-3">
								<label class="form-label">Product Name</label>
								<form:input id="productename" path="productname"  class="form-control" type="text" value=""  required="required"/>
								
							</div>
							<div class="mb-3">
								<label class="form-label">Product Details</label>
								<form:textarea id="details" path="details" class="form-control"  required="required"/>
								
							</div>
							<div class="mb-3">
								<label class="form-label">Product Original Price</label>
								<form:input id="originalprice" path="originalprice" class="form-control" type="text" value=""  required="required"/>
								
							</div>
							<div class="mb-3">
								<label class="form-label">Product Discounted Price</label>
								<form:input id="discountedprice" path="discountprice" class="form-control" type="text" value=""  required="required"/>
								
							</div>
							<div class="mb-3">
								<label class="form-label">Product Image</label>
								<input name="file" class="form-control" type="file" value=""  required="required"/>		
							</div>
							<div class="mb-3">
								<label class="form-label">Other Details</label>
								<form:textarea id="otherdetails" path="otherdetails" class="form-control" />
                                
							</div>
							<input type="submit" value="Add Product" class="btn btn-primary" />
						</form:form>
					</div>
				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>

</body>
</html>