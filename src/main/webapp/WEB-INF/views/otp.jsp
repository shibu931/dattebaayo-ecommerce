<%@page import="com.Entities.User"%>
<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
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
                    <h2>Verify OTP</h2>
                    <form action="/resetPass" method="POST">
                        <div class="form-group">
                            <input type="number" id="number-input" class="form-control py-4" placeholder="Enter OTP" required="required" name="otp" />
                        </div>
                         <%
                        Message m = (Message)request.getAttribute("msg");
                        if(m!=null){ %>
                         <div class="alert alert-danger" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%} %>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit">Verify</button>
                        </div>
                    </form>
                </div>
			</div>
        </div>
    </div>

	<%@include file="footer.jsp" %>

    <!-- JavaScript Libraries -->
	<%@include file="scripts.jsp" %>
</body>

</html>