<%@page import="com.Entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WHC7P57');</script>
<!-- End Google Tag Manager -->
 <meta content="anime merchandise, cosplay costumes, anime figures, posters, t-shirts, naruto t-shirts, t-shirt, oversized t-shirt, demon slayer, one piece, attack on titan" name="keywords">
   <meta name="description" content="Look no further than Dattebaayo.com! We offer a wide range of anime merchandise products including anime clothes, collectibles, figures, and more, all from your favorite anime series. With our commitment to quality, exceptional service, and hassle-free shopping experience, Dattebaayo is the premier destination for all things anime in India. Shop now and show your love for anime in style!">
    <meta property="og:title" content="Buy Anime Merchandise Online - Best Deals & Free Shipping | dattebaayo.com">
	<meta property="og:description" content="Get the best deals on anime merchandise at dattebaayo.com. We offer a wide range of products including cosplay costumes, figurines, posters, t-shirts, and more. Shop now and enjoy free shipping on all orders.">
	<%@include file="header.jsp"%>
<%String keyword=(String)request.getAttribute("keyword"); %>

</head>

<body>

	<%@include file="topbar.jsp"%>

	<!-- Navbar Start -->
	<%@include file="collapsed-navbar.jsp"%>

	<!-- Shop Start -->
	<div class="container-fluid pt-3">
		<!-- Shop Product Start -->
		<div class="col-lg-12 col-md-12">
			<div class="row pb-3">

				<div class="col-12 pb-1">
					<div class="d-flex align-items-center justify-content-between mb-0">
						<div class="dropdown ml-4">
							<button class="btn border dropdown-toggle" type="button"
								id="triggerId" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Sort by</button>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="triggerId">
								<a class="dropdown-item" href="/${link }sortBy=popularity">Popularity</a> <a
									class="dropdown-item" href="/${link }sortBy=price">Price Low to High</a>
							</div>
						</div>
					</div>
				</div>
				<%
                        Message m = (Message)request.getAttribute("msg");
                        if(m!=null){ %>
                         <div class="alert alert-<%=m.getCssClass() %> text-c
                         enter" id="login-alert" role="alert">
                            <%=m.getContent() %>
                        </div>
                        <%} %>
				<!-- Product Card -->
				<section id="product1" class="section-p1">
					<div class="pro-container">
						<c:forEach var="pro" items="${products }">
							<div class="pro">
								<img
									src='<c:url value="/resources/images/products/${pro.images.image }" />'
									alt="${pro.images.image }">
								<div class="des">
									<span></span>
									<h5>${pro.p_name }</h5>
									<div class="star">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<h4 class="text-primary ">
										&#8377;${pro.p_dis_price }
										<del class="text-dark">${pro.p_price }</del>
									</h4>
								</div>
								<a href="<%=request.getContextPath() %>/details/${pro.p_id}/${pro.p_name}"><span
									class="cart">View</span> </a>
							</div>
						</c:forEach>

					</div>
				</section>
				<!-- product card end -->

				<div class="col-12 pb-1">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center mb-3">
						<c:forEach var="count" items="${totalPage }">	
							<li class="page-item "><a class="page-link" href="/${link }page=${count}" >${count}</a></li>
						</c:forEach>
						</ul>
					</nav>
				</div>

			</div>
		</div>
		<!-- Shop Product End -->

	</div>
	<!-- Shop End -->

	<%@include file="footer.jsp"%>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>

	
	<!-- JavaScript Libraries -->
	<%@include file="scripts.jsp"%>
	<script>
	function goToPage(pageNumber) {
		  // get the pagination links
		  var links = document.getElementsByClassName("page-link");
		  for (var i = 0; i < links.length; i++) {
		    if (links[i].innerHTML == pageNumber) {
		      links[i].parentElement.classList.add("active");
		    } else {
		      links[i].parentElement.classList.remove("active");
		    }
		  }
		  window.history.pushState(null, null, "?page=" + pageNumber);
		  window.location.reload();
		 }

	</script>
</body>

</html>