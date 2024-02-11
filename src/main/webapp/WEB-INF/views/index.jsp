<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-WHC7P57');
</script>
<!-- End Google Tag Manager -->
<meta name="keywords"
	content="anime merchandise india, anime merch, anime oversized t shirt, dattebayo, dattebayo meaning, anime merch in india, anime merch india, attack on titan merch india, dragon ball tshirt, dragon ball z t-shirts, anime cosplay, dattebaayo, dattebayo, dattebayo meaning, anime clothes, anime clothing, naruto tshirt, anime, anime tshirt india, anime tshirt, naruto jacket, naruto clothes, anime print tshirt, demon slayer t-shirt, naruto t-shirt, naruto hoodies, one piece t-shirt, attack on titan, zoro, jujutshu kaisen t-shirt,anime clothes store, best anime online store in india, anime merchandise store near me, otaku store india, anime accessories store, anime clothes store, anime clothes for girls, best anime merchandise india, anime merchandise online, anime merchandise india online, best anime online store in india, anime store, anime apparel reddit, anime clothes stores near me, one piece anime clothes, bleach anime clothes, anime clothes reddit, black clover anime t-shirt, anime gym clothes, anime tanks, one piece anime merchandise india, best site for anime merchandise india, where can i buy anime merch in india, where can i buy anime merchandise in india, what is anime merchandise" />
<meta name="description"
	content="Anime Merchandise India! We offer a wide range of anime merchandise products including anime clothes, figures, and more, all from your favorite anime series. With our commitment to quality, and hassle-free shopping experience, Dattebaayo is the premier destination for all things anime in India. Shop now!" />
<meta property="og:title"
	content="Buy Anime Merchandise Online - Best Deals & Free Shipping | dattebaayo.com">
<meta property="og:description"
	content="Get the best deals on anime merchandise at dattebaayo.com. We offer a wide range of products including cosplay costumes, figurines, posters, t-shirts, and more. Shop now and enjoy free shipping on all orders.">
<meta property="og:image"
	content='<c:url value="/resources/images/Dattebaayologo.jpg" />' />
<meta property="og:url" content="https://www.dattebaayo.com/" />
<meta property="og:title" content="${title }" />
<%@include file="header.jsp"%>
<script type="application/ld+json">{
  "@context": "http://schema.org/",
  "@type": "WebSite",
  "name": "Dattebaayo",
  "url": "https://www.dattebaayo.com/",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://dattebaayo.com/shop?keyword={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}</script>
<script type="application/ld+json">
{
  "@context": "https://schema.org/", 
  "@type": "BreadcrumbList", 
  "itemListElement": [{
    "@type": "ListItem", 
    "position": 1, 
    "name": "Naruto Apparels",
    "item": "https://dattebaayo.com/shop/1"  
  },{
    "@type": "ListItem", 
    "position": 2, 
    "name": "One Piece Apparels",
    "item": "https://dattebaayo.com/shop/2"  
  },{
    "@type": "ListItem", 
    "position": 3, 
    "name": "Demon Slayer Apparels",
    "item": "https://dattebaayo.com/shop/6"  
  },{
    "@type": "ListItem", 
    "position": 4, 
    "name": "Jujutsu Kaisen Apparels",
    "item": "https://dattebaayo.com/shop/4"  
  }]
}
</script>
</head>

<body>

	<%@include file="topbar.jsp"%>

	<!-- Navbar Start -->
	<div class="container-fluid mb-5">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0 text-white">Categories</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<%@include file="navbar.jsp"%>
				<!-- Carousal -->
				<div id="header-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" style="height: 500px;">
							<img class="img-fluid"
								src='<c:url value="/resources/images/carousel-1.webp" />'
								alt="MyImageImage">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">Naruto
										Collection</h4>
									<a href="/shop/1" class="btn btn-light py-2 px-3">Explore</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 500px;">
							<img class="img-fluid"
								src='<c:url value="/resources/images/carousel-2.webp" />'
								alt="MyImageImage">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">One
										Piece Collection</h4>
									<a href="/shop/2" class="btn btn-light py-2 px-3">Explore</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 500px;">
							<img class="img-fluid"
								src='<c:url value="/resources/images/carousel-3.webp" />'
								alt="MyImageImage">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">Attack
										on Titan Collection</h4>
									<a href="/shop/17" class="btn btn-light py-2 px-3">Explore</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 500px;">
							<img class="img-fluid"
								src='<c:url value="/resources/images/carousel-4.webp" />'
								alt="MyImageImage">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">Demon
										Slayer Collection</h4>
									<a href="/shop/6" class="btn btn-light py-2 px-3">Explore</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 500px;">
							<img class="img-fluid"
								src='<c:url value="/resources/images/carousel-5.webp" />'
								alt="MyImageImage">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">Jujutsu
										Kaisen Collection</h4>
									<a href="/shop/4" class="btn btn-light py-2 px-3">Explore</a>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#header-carousel"
						data-slide="prev">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-prev-icon mb-n2"></span>
						</div>
					</a> <a class="carousel-control-next" href="#header-carousel"
						data-slide="next">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-next-icon mb-n2"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Anime Cards -->
	<div class="container-fluid ">
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel vendor-carousel">
					<div class="vendor-item border p-4">
						<a href="/shop/2"> <img
							src='<c:url value="/resources/images/vendor-1.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/18"> <img
							src='<c:url value="/resources/images/vendor-2.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/6"> <img
							src='<c:url value="/resources/images/vendor-3.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/7"> <img
							src='<c:url value="/resources/images/vendor-4.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/4"> <img
							src='<c:url value="/resources/images/vendor-5.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/8"> <img
							src='<c:url value="/resources/images/vendor-6.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/14"> <img
							src='<c:url value="/resources/images/vendor-7.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/17"> <img
							src='<c:url value="/resources/images/vendor-8.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/13"> <img
							src='<c:url value="/resources/images/vendor-9.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/20"> <img
							src='<c:url value="/resources/images/vendor-10.jpg" />'
							alt="MyImage">
						</a>
					</div>
					<div class="vendor-item border p-4">
						<a href="/shop/1"> <img
							src='<c:url value="/resources/images/vendor-11.jpg" />'
							alt="MyImage">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End -->

	<!-- Product Card -->
	<section id="product1" class="section-p1">
		<h2>Latest Arrivals</h2>
		<p>Summer Collection</p>
		<div class="pro-container">
			<c:forEach var="pro" items="${products }">
				<div class="pro">
					<img src='<c:url value="/resources/images/products/${pro.images.image }" />'
						alt="MyImage${pro.images.image }">
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
					<a href="<%=request.getContextPath() %>/details/${pro.p_id }/${pro.p_name}"><span
						class="cart">View</span> </a>
				</div>
			</c:forEach>

		</div>
	</section>
	<!-- product card end -->

	<!-- Offer Start -->
	<div class="container-fluid offer pt-5">
		<div class="row px-xl-5">
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
					<img src='<c:url value="/resources/images/offer-1.png"/>'
						alt="MyImage">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">20% off the all
							order</h5>
						<h1 class="mb-4 font-weight-semi-bold">Summer Collection</h1>
						<a href="/shop/102"
							class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
					<img src='<c:url value="/resources/images/offer-2.png"/>'
						alt="MyImage">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">20% off the all
							order</h5>
						<h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
						<a href="/shop/101"
							class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Offer End -->

	<!-- Products Start -->
	<section id="product1" class="section-p1">
		<h2>Featured Products</h2>
		<p>Summer Collection New Morden Desgin</p>
		<div class="pro-container">
			<c:forEach var="topSellingproducts" items="${topSellingProducts}">
				<div class="pro">
					<img src='<c:url value="/resources/images/products/${topSellingproducts.images.image }" />'
						alt="MyImage${topSellingproducts.images.image }">
					<div class="des">
						<span></span>
						<h5>${topSellingproducts.p_name }</h5>
						<div class="star">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<h4 class="text-primary ">
							&#8377;${topSellingproducts.p_dis_price }
							<del class="text-dark">${topSellingproducts.p_price }</del>
						</h4>
					</div>
					<a
						href="<%=request.getContextPath() %>/details/${topSellingproducts.p_id }/${topSellingproducts.p_name}"><span
						class="cart">View</span> </a>
				</div>
			</c:forEach>

		</div>
	</section>
	<!-- Products End -->

	<!-- New Feature -->
	<section id="feature" class="section-p1">
		<div class="fe-box ">
			<img src='<c:url value="/resources/images/features/f1.png" />'
				alt="MyImage">
			<h6>Free Shipping</h6>
			<br> <small>On Prepaid Orders.</small>
		</div>
		<div class="fe-box ">
			<img src='<c:url value="/resources/images/features/f3.png" />'
				alt="MyImage">
			<h6>Secure Payment</h6>
			<br> <small>Secure Payment</small>
		</div>
		<div class="fe-box ">
			<img src='<c:url value="/resources/images/features/f5.png" />'
				alt="MyImage">
			<h6>Festive Sale</h6>
			<br> <small>Heavy Discount's</small>
		</div>
		<div class="fe-box ">
			<img src='<c:url value="/resources/images/features/f6.png" />'
				alt="MyImage">
			<h6>24/7 Support</h6>
			<br> <small>Call, Email Whatsapp </small>

		</div>
	</section>
	<!-- New Feture End -->

	<%@include file="footer.jsp"%>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top text-white"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src='<c:url value="/resources/lib/easing/easing.min.js" />'></script>
	<script
		src='<c:url value="/resources/lib/owlcarousel/owl.carousel.min.js"/>'></script>

	<!-- Contact Javascript File -->
	<script
		src='<c:url value="/resources/mail/jqBootstrapValidation.min.js" />'>
		
	</script>
	<script src='<c:url value="/resources/mail/contact.js" />'></script>

	<!-- Template Javascript -->
	<script src='<c:url value="/resources/js/main.js" />'></script>

</body>

</html>