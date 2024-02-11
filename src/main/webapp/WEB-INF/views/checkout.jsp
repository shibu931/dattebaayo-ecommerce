<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<%@include file="header.jsp"%>
<style>
#loader {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.5);
  z-index: 9999;
  display: flex;
  justify-content: center;
  align-items: center;
}

#loader img {
  width: 50px;
  height: 50px;
}
</style>
</head>
<body>
	<%int cartTotal = (Integer) request.getAttribute("cartTotal"); %>
	<%@include file="topbar.jsp"%>

	<!-- Navbar Start -->
	<%@include file="collapsed-navbar.jsp"%>
	<!-- Navbar End -->

	<!-- Checkout Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-8">
				<div class="mb-4">
					<h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
					<div class="row">
						<div class="col-md-6 form-group">
							<label>Full Name</label> <input class="form-control" type="text"
								value="${user.name }" name="name" required id="username">
						</div>
						<div class="col-md-6 form-group">
							<label>E-mail</label> <input class="form-control" type="email"
								value="${user.email }" name="email" required id="useremail">
						</div>
						<div class="col-md-6 form-group">
							<label>Mobile No</label> <input class="form-control"
								type="number" value="${user.number }" name="number" required
								id="usernumber">
						</div>
						<div class="col-md-6 form-group">
							<label>House, Flat no.</label> <input class="form-control"
								type="text" value="${address.house_no }" name="house" required
								id="userhouse">
						</div>
						<div class="col-md-6 form-group">
							<label>Street No, Apartment</label> <input class="form-control"
								type="text" value="${address.street_no }" name="street" required
								id="useraddress">
						</div>
						<div class="col-md-6 form-group">
							<label>Locality</label> <input class="form-control" type="text"
								value="${address.locality}" name="locality" required
								id="userlocality">
						</div>
						<div class="col-md-6 form-group">
							<label>Country</label> <select class="custom-select">
								<option selected>India</option>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label>City</label> <input class="form-control" type="text"
								value="${address.city }" name="city" required id="usercity">
						</div>
						<div class="col-md-6 form-group">
							<label>State</label> <select class="custom-select" name="state"
								required id="userstate">
								<option value="${address.state }" selected>${address.state }</option>
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Bihar">Bihar</option>
								<option value="Chandigarh">Chandigarh</option>
								<option value="Chhattisgarh">Chhattisgarh</option>
								<option value="Delhi">Delhi</option>
								<option value="Puducherry">Puducherry</option>
								<option value="Goa">Goa</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Haryana">Haryana</option>
								<option value="Himachal Pradesh">Himachal Pradesh</option>
								<option value="Jammu and Kashmir">Jammu and Kashmir</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Karnataka">Karnataka</option>
								<option value="Kerala">Kerala</option>
								<option value="Madhya Pradesh">Madhya Pradesh</option>
								<option value="Maharashtra">Maharashtra</option>
								<option value="Manipur">Manipur</option>
								<option value="Meghalaya">Meghalaya</option>
								<option value="Mizoram">Mizoram</option>
								<option value="Nagaland">Nagaland</option>
								<option value="Odisha">Odisha</option>
								<option value="Punjab">Punjab</option>
								<option value="Rajasthan">Rajasthan</option>
								<option value="Sikkim">Sikkim</option>
								<option value="Tamil Nadu">Tamil Nadu</option>
								<option value="Telangana">Telangana</option>
								<option value="Tripura">Tripura</option>
								<option value="Uttar Pradesh">Uttar Pradesh</option>
								<option value="Uttarakhand">Uttarakhand</option>
								<option value="West Bengal">West Bengal</option>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label>Pin Code</label> <input class="form-control" type="number"
								value="${address.pincode }" name="pincode" required
								id="userpincode">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="card border-secondary mb-5">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Payment</h4>
					</div>
					<div class="card-body">
						<div class="form-group">
							<div class="custom-control custom-radio">
								<input type="radio" value="cod" class="custom-control-input"
									name="payment" id="paypal"> <label
									class="custom-control-label" for="paypal">COD (Cash On
									Delivery)</label>
							</div>
						</div>
						<div class="form-group">
							<div class="custom-control custom-radio">
								<input type="radio" value="prepaid" class="custom-control-input"
									name="payment" id="directcheck" > <label
									class="custom-control-label" for="directcheck">Online
									Payment</label><br>
									<small class="text-danger">Currently our payment gateway is not working</small>
							</div>
						</div>
						<div class="text-danger text-center">
							<p class="mb-0" id="payment_method_warning"></p>
						</div>
					</div>
				</div>



				<div class="card border-secondary mb-5">
					<div class="card-header bg-secondary border-0">
						<h4 class="font-weight-semi-bold m-0">Order Total</h4>
					</div>
					<div class="card-body">

						<hr class="mt-0">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium">&#8377;${cartTotal }</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<%if(cartTotal<1299){
								cartTotal+=60;%>
							<h6 class="font-weight-medium">&#8377;60</h6>
							<%}else{ %>
							<h6 class="font-weight-medium">&#8377;0</h6>
							<%} %>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">Total</h5>
							<h5 class="font-weight-bold">
								&#8377;<%=cartTotal%></h5>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<input id="paymentAmount" hidden="true" value="<%=cartTotal%>">
						<button onclick="placeOrder()"
							class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place
							Order</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Checkout End -->


	<%@include file="footer.jsp"%>
	<!-- Loader -->
	<div id="loader" style="display: none;">
		<img src='<c:url value="/resources/images/spinner.gif" />' alt="Loader">
	</div>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>

	<!-- JavaScript Libraries -->
	<%@include file="scripts.jsp"%>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>


	<script>
	
	const loader = document.getElementById("loader");

	function showLoader() {
	  loader.style.display = "flex";
	}

	function hideLoader() {
	  loader.style.display = "none";
	}
	
	let payment_method= "";
	
	//Get Payment Method Mode
	const codRadio = document.querySelector('#paypal');
	const prepaidRadio = document.querySelector('#directcheck');

	const paymentOptions = document.querySelector('.card-body');
	paymentOptions.addEventListener('change', (event) => {
	  if (event.target === codRadio) {
		  payment_method = "cod";		
	  } else if (event.target === prepaidRadio) {
		  payment_method = "prepaid";
	  }
	});	
	
	
		function placeOrder(){
			if(payment_method === ""){
				let temp = document.querySelector('#payment_method_warning')
				temp.innerHTML = "Please select a payment mode!"
			}else if (payment_method==="cod"){
				saveDetails()
			}else if(payment_method==="prepaid"){
				paymentStart();
			}
			
		}
			
			//Save Details 
			async function saveDetails(){
				const userId = <%=(Integer) request.getAttribute("userId")%> 
				const name = document.getElementById('username').value;
				const email = document.getElementById('useremail').value;
				const number = document.getElementById('usernumber').value;
				const houseNo = document.getElementById('userhouse').value;
				const streetNo = document.getElementById('useraddress').value;
				const locality = document.getElementById('userlocality').value;
				const city = document.getElementById('usercity').value;
				const state = document.getElementById('userstate').value;
				const pincode = document.getElementById('userpincode').value;
				const coupon = '<%=request.getAttribute("coupon")%>';
				console.log(coupon)
				let formData = {'userId':userId,'name':name,'email':email,'number':number,'houseNo':houseNo,'streetNo':streetNo,'locality':locality,'city':city,'state':state,'pincode':pincode,'paymentMode':payment_method,'coupon':coupon}
				showLoader()
				const response = await fetch('api/save_order',{
					method:'POST',
					headers:{
						 'Content-type':'application/json'
					},
					body:JSON.stringify(formData)	
				})
				response.json().then(data=>{
					hideLoader()
					window.location.href ='/ordersuccessfull?status='+data.status;
				}).catch(error=>{
					hideLoader()
					console.log(error)
				})
			}
		
			//Payment Method
			async function paymentStart(){
			const amount = <%=cartTotal%>
			showLoader()
			const response = await fetch('api/initiatepy',{
				method:'POST',
				headers:{
					 'Content-type':'application/json'
				},
				body:JSON.stringify({'amount':amount})
			})
			response.json().then(data=>{
				console.log(data.redirect_Url)
				window.location.href =data.redirect_Url;
			}).catch(error=>{
				hideLoader()
				console.log(error)
			})
			
		}
	  
	</script>
</body>

</html>