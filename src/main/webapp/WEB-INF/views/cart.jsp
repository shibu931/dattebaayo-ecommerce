<%@page import="java.util.Map"%>
<%@page import="com.Entities.Product"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.Entities.Cart"%>
<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
   
	<%@include file="header.jsp" %>
</head>

<body>
	
	<% ProductService pservice = new ProductService(); %>
	<%@include file="topbar.jsp" %>
    <!-- Navbar Start -->
    	<%@include file="collapsed-navbar.jsp" %>
    <!-- Navbar End -->
    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
	
	                   <%Message m = (Message)request.getAttribute("msg");
	                   	Integer subTotal =0;
	                   	int coupondis=0;
	                   	if(m!=null){ %>
                         <div class="alert alert-<%=m.getCssClass() %>" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%}else{ %>
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <% HashMap<Cart,Product> map = (HashMap<Cart,Product>)request.getAttribute("cartitems");
                    	for (Map.Entry<Cart,Product> entery : map.entrySet()){
                    %>	
                        <tr>
                            <td class="align-middle"><%=entery.getValue().getP_name() %></td>
                            <td class="align-middle"><%=entery.getKey().getColor() %></td>
                            <td class="align-middle"><%=entery.getKey().getSize() %></td>
                            <td class="align-middle">&#8377;<%=entery.getValue().getP_dis_price() %></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 80px;">
                                    <input type="text" disabled class="form-control form-control-sm bg-secondary text-center" value="<%=entery.getKey().getQuantity()%>">
                                </div>
                            </td>
                            <%Integer totalPrice = entery.getKey().getQuantity()*entery.getValue().getP_dis_price(); %>
                            <td class="align-middle">&#8377;<%=totalPrice %></td>
                            <td class="align-middle"><a href="/removeProductFromCart/<%=entery.getKey().getCart_id() %>" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                        	<%subTotal = subTotal+totalPrice; %>
                        </tr>
                  <%} %>
                    </tbody>
                </table>
               <%} %>
            </div>
            <div class="col-lg-4">
                <form action="applycoupon" method="GET" class="mb-5" id="add-post-form">
                    	<div class="input-group">
                        <input type="text" class="form-control p-4" name="couponcode" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary">Apply Coupon</button>
                        </div>
                        </div>
                        <%Message m1 = (Message)session.getAttribute("m1");
                        if(m1!=null){%>
                        	<div class="alert alert-<%=m1.getCssClass() %> mt-1 mb-1 text-center " id="login-alert" role="alert">
                            <%=m1.getContent() %>
                            <br>
                            <small><a href="/removeCoupon">Remove Coupon</a></small>
                            </div>
                        <%}%>
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">&#8377;<%=subTotal %></h6>
                        </div>
                        <c:if test="${flag }">
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Coupon Discount</h6>
                            <%int discountPercentage = Integer.parseInt((String)session.getAttribute("discountPercentage")); %>
                            <%coupondis = (int)subTotal*discountPercentage/100;  %>
                            <h6 class="font-weight-medium">&#8377;<%=coupondis %></h6>
                        </div>
                        </c:if>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <%int totalPrice = subTotal-coupondis;%>
                            <h5 class="font-weight-bold">&#8377;<%=totalPrice %> </h5>
                        </div>
                    	<%session.setAttribute("cartTotal", totalPrice);
                    	if(totalPrice!=0){ %>    
                        <a style="text-decoration:none;"  href="/checkout" ><button type="submit" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button></a>
                    	<%}else{ %>
                    	<button type="submit" class="btn btn-block btn-primary my-3 py-3 disabled">Proceed To Checkout</button>
                    	<%} %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


	<%@include file="footer.jsp" %>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
	<%@include file="scripts.jsp" %>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>	

</body>

</html>