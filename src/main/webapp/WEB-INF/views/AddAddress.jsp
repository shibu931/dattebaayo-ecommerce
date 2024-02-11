<%@page import="com.Entities.User"%>
<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="header.jsp"%>
</head>

<body>

	<%
	User u = (User) request.getAttribute("user");
	%>



	<%@include file="topbar.jsp"%>

	<!-- Navbar Start -->
	<div class="container-fluid mb-5">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0 text-white">Categories</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<%@include file="navbar.jsp"%>
				<div class="container text-center col-md-6 mb-5">
					<h1>Add Address</h1>
					<div class="row">
						<form action="saveAddress" method="post">
							<div class="form-group">
								<label for="inputAddress">House No.</label> <input type="text"
									class="form-control" id="inputAddress" placeholder="A-123"
									name="house_no" required>
							</div>
							<div class="form-group">
								<label for="inputAddress2">Street No. Or Apartment</label> <input
									type="text" class="form-control" id="inputAddress2"
									placeholder="Abc Society, Or Street no.1" name="street_no"
									required>
							</div>
							<div class="form-group">
								<label for="inputAddress2">Locality</label> <input type="text"
									class="form-control" id="inputAddress2"
									placeholder="Abc Society, Or Street no.1" name="locality"
									required>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" name="city" required>
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">State</label> <select id="inputState"
										class="form-control" name="state" required>
										<option selected>Choose...</option>
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
								<div class="form-group col-md-2">
									<label for="inputZip">Pincode</label> <input type="text"
										class="form-control" name="pincode" id="inputZip" required>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Save</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>

	<!-- JavaScript Libraries -->
	<%@include file="scripts.jsp"%>
</body>

</html>