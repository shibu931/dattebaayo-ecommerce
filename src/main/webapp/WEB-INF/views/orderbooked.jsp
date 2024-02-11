<%@page import="org.hibernate.hql.internal.ast.tree.SessionFactoryAwareNode"%>
<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%session.removeAttribute("m1"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
<%@include file="header.jsp"%>
<style type="text/css">
td {
	margin: 25px;
}
</style>
</head>
<body>
	<%@include file="topbar.jsp"%>
	<%@include file="collapsed-navbar.jsp"%>

	<div class="container">
		<div class="jumbotron jumbotron-fluid">
			<div class="container align-items-center">
				 <%Message m = (Message)request.getAttribute("msg");
	                   	if(m!=null){ %>
                         <div class="alert alert-<%=m.getCssClass() %>" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%}else{
                        	response.sendRedirect("cart");
                        }%>
                        
                        
				<ul class="list-group">
					<li class="list-group-item"><strong>Order Id:</strong> <span>${order.orderId }</span>
					</li>
					<li class="list-group-item"><strong>Order Time:</strong> <span>${order.createdTime }</span>
					<li class="list-group-item"><strong>Payment Mode:</strong> <span>${order.paymentMode }</span>
					</li>
				</ul>
				<a class="btn "></a>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<%@include file="scripts.jsp"%>
</body>
</html>