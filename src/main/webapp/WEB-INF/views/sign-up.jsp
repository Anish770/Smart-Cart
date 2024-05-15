<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign-up</title>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css"
	rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<script>
$(document).ready(function(){
	  $("button").click(function(){
	    $("#success_div").remove();
	  });
	});
$(document).ready(function(){
	  $("button").click(function(){
	    $("#error_div").remove();
	  });
	});
$(document).ready(function(){
	  $("button").click(function(){
	    $("#error_existing_user_div").remove();
	  });
	});
</script>
<body>
	<!-- Section: Design Block -->
	<section class="text-center text-lg-start">
<style>
.cascading-right {
	margin-right: -50px;
}

@media ( max-width : 991.98px) {
	.cascading-right {
		margin-right: 0;
	}
}
</style>

		<div class="container-fluid">
			<c:if test="${not empty model_success }">
				<div class="row">
					<div class="alert alert-success alert-dismissible fade show"
							id=success_div role="alert">
							${model_success}
							<button type="button" class="btn-close" onclick="close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
				</div>
			</c:if>
			<c:if test="${not empty model_error}">
					<div class="row">
						<div class="alert alert-danger alert-dismissible fade show"
							id=error_div role="alert">
							${model_error}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty model_existing_user_error}">
					<div class="row">
						<div class="alert alert-danger alert-dismissible fade show"
							id=error_existing_user_div role="alert">
							${model_existing_user_error}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</div>
				</c:if>
		</div>
		<!-- Jumbotron -->
		<div class="container py-4">
			<div class="row g-0 align-items-center">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="card cascading-right"
						style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
						<div class="card-body p-5 shadow-5 text-center">
							<h2 class="fw-bold mb-5">Sign up now</h2>
							<form:form action="signUpForm" method="post" modelAttribute="modelUserAttribute">
								<!-- 2 column grid layout with text inputs for the first and last names -->
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<form:input path="name" id="form3Example1"  cssClass="form-control"/>
											<form:errors path="name" id="form3Example1"  cssClass="form-control"/>
											<label class="form-label" for="form3Example1">Name</label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<form:input path="email" id="form3Example2" cssClass="form-control" />
											<form:errors path="email" id="form3Example2" cssClass="error_message_design" />
											<label class="form-label" for="form3Example2">Email</label>
										</div>
									</div>
								</div>

								<!-- Email input -->
								<div class="form-outline mb-4">
									<form:input path="password" id="form3Example2" cssClass="form-control" />
									<form:errors path="password" id="form3Example2" cssClass="error_message_design" />
									<label class="form-label" for="form3Example3">Password</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<form:input path="phoneno" id="form3Example2" cssClass="form-control" />
									<form:errors path="phoneno" id="form3Example2" cssClass="error_message_design" />
									<label class="form-label" for="form3Example4">Phone No.</label>
								</div>

								<!-- Checkbox -->
								<!-- <div class="form-check d-flex justify-content-center mb-4">
                  <input class="form-check-input me-2" type="checkbox" value="" id="form2Example33" checked />
                  <label class="form-check-label" for="form2Example33">
                    Subscribe to our newsletter
                  </label>
                </div>
   -->
								<!-- Submit button -->
								<input type="submit" value="Sign up" class="btn btn-primary btn-block mb-4"/>

								<!-- Register buttons -->
								<div class="text-center">
									<p>or sign up with:</p>
									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-google"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-twitter"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-github"></i>
									</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0">
					<img
						src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg"
						class="w-100 rounded-4 shadow-4" alt="" />
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->
</body>
</html>