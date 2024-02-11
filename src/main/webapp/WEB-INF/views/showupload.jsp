<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%int i =(Integer)request.getAttribute("flag"); %>
	<h1>File Uploaded</h1>
	
	<img src="/api/images/${images}" width="25%"/>
	
</body>
</html>
