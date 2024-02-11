<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%@include file="header.jsp" %>
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
<%@include file="topbar.jsp" %>
<%@include file="collapsed-navbar.jsp" %>
	<div class="container">
	<div class="row mt-4">
		<!-- First Column -->
		<div class="col-md-4">
		<!-- Categories -->
		<div class="list-group">
  		<a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">My Account</a>
  		
  		<a href="#" onclick="getPosts(1,this)" class=" c-link list-group-item list-group-item-action">Order History</a>
  		<a href="#" onclick="getPosts(2,this)" class=" c-link list-group-item list-group-item-action">Address</a>
  		<a href="#" onclick="getPosts(3,this)" class=" c-link list-group-item list-group-item-action">Change Password</a>
  		<a href="/logout" class=" c-link list-group-item list-group-item-action">Logout</a>
  		</div>
		</div>
		
		<!-- Second Column -->
		<div class="col-md-8" >
		<%Message m = (Message)request.getAttribute("mx1");
                       if(m!=null){ %>
                         <div class="alert alert-danger" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%} %>
		<!-- Posts -->
			<div class="container text-center"  id="loader">
				<i class="fa fa-refresh fa-4x fa-spin"></i>
				<h3 class="mt-2">Loading...</h3>
			</div>
			
			<div class="container-fluid" id="post-container">
			
			</div>
			
		</div>
	</div>
	</div>

<%@include file="footer.jsp" %>
<div id="loader" style="display: none;">
		<img src='<c:url value="/resources/images/spinner.gif" />' alt="Processing">
	</div>
<%@include file="scripts.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

function getPosts(catId,temp){
	$('#loader').show();
	$('#post-container').hide();
	$(".c-link").removeClass('active')
	$.ajax({
		url:"profile-details",
		data:{id:catId},
		success: function(data,textStatus,jqXHR){
			$('#loader').hide();
			$('#post-container').show();
			$('#post-container').html(data)
			$(temp).addClass('active')
		}
	})
}

$(document).ready(function (e){
	let allPostRef = $('.c-link')[0]
	getPosts(0,allPostRef)
})
</script>
<script>
const loader = document.getElementById("loader");

function showLoader() {
  loader.style.display = "flex";
}

function hideLoader() {
  loader.style.display = "none";
}
 async function returnOrderCall(){
	let orderId = document.getElementById("orderId").innerHTML; 
	console.log(orderId)
	const response = await fetch("api/returnOrder",{
		method:'POST',
		headers:{
			 'Content-type':'application/json'
		},
		body:JSON.stringify({'orderId':orderId})
	})
	response.json().then(data=>{
		hideLoader()
		swal("We got your request we will send the details on registered mail.", {
		      icon: "success",
		    });
	}).catch(error=>{
		hideLoader()
		swal("Something went wrong on our server please contact us from contact page", {
		    });
	})
}

function returnOrder(){
	swal({
		  text: "Are you sure you want to return this order!",
		  buttons: ["No", "Yess"]
		})
		.then((willDelete) => {
		  if (willDelete) {
			returnOrderCall();
			showLoader()
			} else {
		    swal("Godd to know");
		  }
		});
}
</script>
</body>
</html>