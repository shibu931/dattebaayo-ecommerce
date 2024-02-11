<%@page import="com.Entities.User"%>
<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="header.jsp" %>
</head>
<body>
<%@include file="topbar.jsp" %>
<%@include file="collapsed-navbar.jsp" %>
<div class="container ">

      <h1 class="my-4 text-center">Privacy Policy</h1>
      <p class="text-center">We respect your privacy and are committed to protecting it.</p>
      <h4 class="my-4">Personal Information</h4>
      <p>We may collect personal information such as your name, email address, and phone number when you sign up for our services. This information will only be used for the purpose for which it was collected.</p>
      <h4 class="my-4">Cookies</h4>
      <p>We may use cookies to enhance your experience on our website. These cookies do not contain any personally identifiable information.</p>
      <h4 class="my-4">Third-party Services</h4>
      <p>We may use third-party services such as Google Analytics to collect information about your usage of our website. This information will only be used to improve our services.</p>
      <h4 class="my-4">Changes to this Policy</h4>
      <p>We reserve the right to change this privacy policy at any time. Any changes will be posted on our website.</p>
    </div>

    <hr>
    <div class="container">
     <h1 class="my-4">Return Policy</h1>
    <p  >We accept returns within 7 days of purchase.</p>
    <h2 class="my-4">Conditions for Returns</h2>
    <ul>
      <li>The item must be in its original condition.</li>
      <li>The item must be returned with all accessories and packaging.</li>
      <li>The customer is responsible for the cost of return shipping.</li>
    </ul>
    <h2 class="my-4">Refunds</h2>
    <p>We will issue a refund to the original payment method within 7 business days of receiving the returned item.</p>
    <h2 class="my-4">Exchanges</h2>
    <p>We do not offer exchanges at this time. If you would like a different item, please return the original item and place a new order.</p>
 	</div>
    
<%@include file="footer.jsp" %>
<%@include file="scripts.jsp" %>
</body>
</html>