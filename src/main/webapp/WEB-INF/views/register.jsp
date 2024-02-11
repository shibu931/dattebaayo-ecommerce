<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="header.jsp" %>
</head>

<body>

	<%@include file="topbar.jsp" %>

    <!-- Navbar Start -->
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0 text-white">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
				<%@include file="navbar.jsp" %>	
                <div class="container text-center col-md-4 mb-5">
                    <h1 class="mt-2">Signup Now</h1>
                    <form id="myForm" action="createuser" method="POST">
                        <div class="form-group">
                            <input type="text" class="form-control py-4" placeholder="Full Name" required="required" name="name"/>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control py-4" placeholder="Mobile Number" required="required" name="number"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control py-4" placeholder="Email" required="required" name="email"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control py-4" id="password" placeholder="Password" required="required" name="password"/>
                        </div>
                        <div class="form-group">
                            <input type="password" id="confirmPassword" class="form-control py-4" placeholder="Confirm Password" name="rPassowrd" required="required" />
                        	 <span id="confirmPasswordError" style="color:red;"></span>
                        </div>
                        
                        <%
                        Message m = (Message)request.getAttribute("msg");
                        if(m!=null){ %>
                         <div class="alert alert-danger" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%} %>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit" >Signup</button>
                        </div>
                    </form>
                    <small>Already Registered <a href="/login"><span class="text-primary">Login</span></a> now</small>
                </div>
			</div>
        </div>
    </div>
    <!-- Navbar End -->

	<%@include file="footer.jsp" %>

    <!-- JavaScript Libraries -->
	<%@include file="scripts.jsp" %>

</body>

</html>