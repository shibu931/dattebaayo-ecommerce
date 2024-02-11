<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="header.jsp" %>
</head>
<body>
<%@include file="topbar.jsp" %>
<%@include file="collapsed-navbar.jsp" %>
<div class="container text-center">
	<%String msg = (String)request.getAttribute("error");
	if(msg!=null){%>
		<h1 class="text-danger m-2">Something Went Wrong!</h1>
		<p><%=msg %></p>
	<%}else{ %>
		<h1 class="text-danger">404</h1>
		<p>Page not found Check if correctly spelled the url.</p>
	<%} %>
</div>
<%@include file="footer.jsp" %>
<%@include file="scripts.jsp" %>
</body>
</html>