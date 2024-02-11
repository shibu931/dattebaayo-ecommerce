<%@page import="java.util.Map"%>
<%@page import="com.Entities.Orders"%>
<%@page import="com.Entities.Product"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.Entities.Message"%>
<%@page isELIgnored="false" %>
<%@page import="com.Entities.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int a =Integer.parseInt(request.getParameter("id"));
if(a==0){
	%>
	  
	<table class="mt-2">
		<tbody>
			<tr>
				<th>Name:</th>
				<td>${user.name }</td>
			</tr>
			<tr>
				<th>Email:</th>
				<td>${user.email }</td>
			</tr>
			<tr>
				<th>Number:</th>
				<td>${user.number }</td>
			</tr>
		</tbody>
	</table>
<%}else if(a==1){
%>
	
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 " >
            <div class="col-lg-12 table-responsive mb-5">
            	 <%
                	Message m = (Message)request.getAttribute("msg");
                	if(m!=null){ %>
                	<div class="alert alert-danger" id="login-alert" role="alert">
                	<%=m.getContent() %>
                	</div>
                	<%}else{ %>
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                        	<th>Order Id</th>
                            <th>Products</th>
                            <th>Quantity</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Status</th>
                            <th>Return</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                   		<% HashMap<Orders,Product> map = (HashMap<Orders,Product>)session.getAttribute("orders");
                    	for (Map.Entry<Orders,Product> entery : map.entrySet()){
                   		 %>	 
                        	<tr>
                        	<td id="orderId"><%=entery.getKey().getOrderId() %></td>
                        	<td class="align-middle"><%=entery.getValue().getP_name() %></td>
                            <td class="align-middle"><%=entery.getKey().getQuantity() %></td>
                            <td class="align-middle"><%=entery.getKey().getColor() %></td>
                            <td class="align-middle"><%=entery.getKey().getSize() %></td>
                            <td class="align-middle"><%=entery.getKey().getStatus() %></td>
                            <td class="align-middle"><button class="btn btn-sm btn-primary " onclick="returnOrder()">Return</button></td>
                        </tr>
                  		<%} %>
                    </tbody>
                </table>
            	<%} %>
            </div>
        </div>
    </div>
    <!-- Cart End -->
	
<%}else if(a==2){
%>
<div class="row">
	<form action="updateAddress" method="post">
							<div class="form-group">
								<label for="inputAddress">House No.</label> <input type="text"
									class="form-control" id="inputAddress" placeholder="A-123" value="${address.house_no }" name="house_no">
							</div>
							<div class="form-group">
								<label for="inputAddress2">Street No. Or Apartment</label> <input
									type="text" class="form-control" id="inputAddress2"
									placeholder="Abc Society, Or Street no.1" name="street_no" value="${address.street_no }">
							</div>
							<div class="form-group">
								<label for="inputAddress2">Locality</label> <input
									type="text" class="form-control" id="inputAddress2"
									placeholder="Abc Society, Or Street no.1" name="locality" value="${address.locality }">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" name="city" value="${address.city }">
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">State</label> <select id="inputState"
										class="form-control" name="state">
										<option selected>${address.state }</option>
										<option value="delhi">Delhi</option>
									</select>
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Pincode</label> <input type="text"
										class="form-control" name="pincode" value="${address.pincode }" id="inputZip">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
</div>
<%}else if(a==3){%>
<form action="changePassword" method="post">
  <div class="form-group">
    <label for="formGroupExampleInput">Old Password</label>
    <input type="text" class="form-control" id="formGroupExampleInput" name="oldpassword" placeholder="Old Password">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">New Password</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" name="newpassword" placeholder="New Password">
  </div>

  <button type="submit" class="btn btn-primary">Save</button>
</form>
<%}%>