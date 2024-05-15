<%@page import="java.util.List"%>
<%@page import="in.ecom.main.entity.UserDetails"%>
<%@page import="in.ecom.main.entity.CartItems"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<style>
@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
}

.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}

.bg-grey {
	background-color: #eae8e8;
}

#deleteicon {
	display: inline;
}

@media ( min-width : 992px) {
	.card-registration-2 .bg-grey {
		border-top-right-radius: 16px;
		border-bottom-right-radius: 16px;
	}
}

@media ( max-width : 991px) {
	.card-registration-2 .bg-grey {
		border-bottom-left-radius: 16px;
		border-bottom-right-radius: 16px;
	}
}
</style>
<meta charset="ISO-8859-1">
<title>User Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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
	<%
	UserDetails user = (UserDetails) session.getAttribute("session_name");
	List<CartItems> list = user.getCart().getCartItems();
	int total_price = 0;
	for (int i = 0; i < list.size(); i++) {
		CartItems cartitems = list.get(i);
		total_price += cartitems.getTotalPrice();
	}
	%>

	<section class="h-100 h-custom" style="background-color: #d2c9ff;">

		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">
						<div class="card-body p-0">
							<div class="row g-0">
								<div class="col-lg-8">
									<div class="p-5">
										<div
											class="d-flex justify-content-between align-items-center mb-5">
											<h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
											<h6 class="mb-0 text-muted"><%=list.size()%>
												items
											</h6>
										</div>
										<hr class="my-4">
										<c:forEach var="cartItem" items="${cartItems}"
											varStatus="loop">
											<div
												class="row mb-4 d-flex justify-content-between align-items-center">
												<div class="col-md-2 col-lg-2 col-xl-2">
													<img
														src="uploads/${cartItem.getSeller().get(0).getProductimage()}"
														class="img-fluid rounded-3"
														alt="${cartItem.getSeller().get(0).getProductname()}">
												</div>
												<div class="col-md-3 col-lg-3 col-xl-3">
													<h6 class="text-muted">${cartItem.getSeller().get(0).getProductname()}</h6>
													<h6 class="text-black mb-0">${cartItem.getSeller().get(0).getDetails()}</h6>
												</div>
												<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
													<div>
														<input type="hidden" name="cart_id"
															value="${cartItem.getId()}">
														<div class="input-group">
															<button type="submit" class="btn btn-link px-2"
																onclick="updateQuantity(${cartItem.getId()},'decrement')">
																<i class="fas fa-minus"></i>
															</button>

															<input type="text" name="quantity"
																value="${cartItem.getQuantity()}" type="number"
																class="form-control form-control-sm" readonly="readonly" />

															<button type="submit" class="btn btn-link px-2"
																onclick="updateQuantity(${cartItem.getId()},'increment')">
																<i class="fas fa-plus"></i>
															</button>
														</div>
													</div>
												</div>
												<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1"
													style="display: flex; align-items: center;">
													<h6 class="mb-0" id="${cartItem.getId()}"
														style="margin-right: 20px;">${cartItem.getTotalPrice()}</h6>
													<div>
														<form action="deleteCartItems" method="post">
															<input type="hidden" name="cartItemId"
																value="${cartItem.getId() }" />
															<button type="submit" class="btn btn-danger"
																onclick="remove(event)">
																<i class="fa-solid fa-trash-can fa-xl"
																	style="color: #ffffff;"></i>
															</button>

														</form>
													</div>
												</div>
											</div>
											<hr class="my-4">
										</c:forEach>
										<div class="pt-5">
											<h6 class="mb-0">
												<a href="back_to_shop" class="text-body"><i
													class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
											</h6>
										</div>
									</div>
								</div>
								<div class="col-lg-4 bg-grey">
									<div class="p-5">
										<h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
										<hr class="my-4">

										<div class="d-flex justify-content-between mb-4">
											<h5 class="text-uppercase">items 3</h5>
										</div>

										<h5 class="text-uppercase mb-3">Shipping</h5>

										<div class="mb-4 pb-2">
											<select class="select">
												<option value="1">Standard-Delivery- 5.00</option>
												<option value="2">Two</option>
												<option value="3">Three</option>
												<option value="4">Four</option>
											</select>
										</div>

										<h5 class="text-uppercase mb-3">Give code</h5>

										<div class="mb-5">
											<div class="form-outline">
												<input type="text" id="form3Examplea2"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea2">Enter your
													code</label>
											</div>
										</div>

										<hr class="my-4">

										<div class="d-flex justify-content-between mb-5">
											<h5 class="text-uppercase">Total price</h5>
											<h5>Rs</h5>
											<h5 id="payment_field"><%=total_price%></h5>
										</div>

										<button type="button" class="btn btn-dark btn-block btn-lg"
											data-mdb-ripple-color="dark" onclick="paymentStart()">Proceed
											to Payment</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
function remove(event){
	event.preventDefault();
	Swal.fire({
		title:"Are you sure?",
		text:"you want to remove this item?",
	    confirmButtonColor:"#3085d6",
	    cancelButton:"#d33",
	    confirmButtonText:"Yes,remove it",
	}).then((result)=>
	{
		if (result.isConfirmed) {
            // Get the form element associated with the button
            const form = event.target.closest('form');
            if (form) {
                form.submit(); // Submit the form
            } else {
                console.error('Form element not found');
            }
        }
	});
}
function updateQuantity(cart_item_id,status)
{
	var requestBody={
			cartItemId:cart_item_id,
			status:status,
	};
	fetch('http://localhost:8081/updateQuantity',{
	method: 'POST',
	headers:{
		'Content-Type':'application/json'
	},
	body:JSON.stringify(requestBody)
	}).then(data=>{
		console.log(data)
		console.log("Form submitted ");
		return data.json()
	}).then(data=>{
		localStorage.setItem("data",JSON.stringify(data));
		return data;
	}).then(data=>{
		location.reload()
	})
	.catch(error=>console.error('Error:',error));
}
const paymentStart=()=>
{ 
	console.log("payment started")
	let amount= $("#payment_field").text();
	console.log(amount)
	if(amount==0||amount==null)
		{
		alert("amount is required !!");
		return
		}
	$.ajax(
			{
				url:'/create_order',
				data:JSON.stringify({amount:amount}),
				contentType:'application/json',
				type:'POST',
				dataType:'json',
				success:function(response) {
					//success
					console.log(response)
					console.log("working0")
					if(response.status=="created"){
						console.log("working1")
						//open payment form
						let options={
							"key":'rzp_test_h8PvaIuTCG0NqV',
							"amount":response.amount,
							"currency":'INR',
							"name":'Smart Contact Managaer',
							"description":'Payment',
							"image":"images/smart_cart_logo.png",
							"order_id": response.id,
							handler:function(response){
								console.log(response.razorpay_payment_id) 
								console.log(response.razorpay_order_id)
								console.log(response.razorpay_signature)
								console.log('payment successful')
								alert("Congratulations! Payment Successful")
							},
							prefill: {
                            name: "",
                            email: "",
                            contact: "",
						    },
							notes: {
                             address: "Razorpay Corporate Office"
                            },
							theme: {
                             color: "#3399cc"
                            }
						};
						let rzp=new Razorpay(options);
						rzp.on('payment.failed', function (response){
                            console.log(response.error.code);
                            console.log(response.error.description);
                            console.log(response.error.source);
                            console.log(response.error.step);
                            console.log(response.error.reason);
                            console.log(response.error.metadata.order_id);
                            console.log(response.error.metadata.payment_id);
							alert("Oops ! Payment failed")
                        });
						console.log("working2")
						rzp.open();
					}
				},
				error:function(response)
				{
					//error
					alert("something went wrong!!")
				}
			})
}; 

</script>
	<!--    <c:forEach var = "cartItem" items = "${cartItems}">
       	<p>${cartItem.getSeller().get(0).getProductname()} </p>
       	<p>${cartItem.getSeller().get(0).getDiscountprice()}</p>
       </c:forEach> -->
</body>
</html>