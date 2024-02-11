<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.Entities.ProductSize"%>
<%@page import="com.Entities.ProductColor"%>
<%@page import="com.Entities.ProductImage"%>
<%@page import="java.util.List"%>
<%@page import="com.Entities.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
int i = 0;
int j = 0;
%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WHC7P57');</script>
<!-- End Google Tag Manager -->
<script type="application/ld+json">{
  "@context": "http://schema.org/",
  "@type": "Product",
  "name": "${product.getP_name() }",
  "image": "https://www.dattebaayo.com/api/images/${images.image }",
  "description": "High Quality 100% Cotton Products, Fast Delivery, Cash On Delivery, Return in 7 Days",
  "brand": "Dattebaayo",
  "offers": {
    "@type": "AggregateOffer",
    "priceCurrency": "INR",
    "lowPrice": "${product.p_dis_price }",
    "highPrice": "${product.p_price }",
    "offerCount": "-2"
  }
}</script>
<meta name="keywords" content="${product.getP_name() }" />
<meta name="description" content="${product.getP_name() } best quality product free shipping on orders above 1299 pan india shipping" />
<meta property="og:type" content="article" />
<meta property="og:title" content="${product.getP_name() }" />
<meta property="og:description" content="${product.getP_name() } best quality product free shipping on orders above 1299" />
<meta property="og:url"
	content="https://www.dattebaayo.com/details/${product.p_id }/${product.getP_name() }" />
<meta property="og:image"
	content='<c:url value="/resources/images/products/${product.images.image }" />' />
<%@include file="header.jsp"%>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	font-family: Arial, sans-serif;
	font-size: 14px;
}

th, td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f5f5f5;
}

td:first-child {
	font-weight: bold;
}

@media ( max-width : 480px) {
	th, td {
		font-size: 12px;
		padding: 8px;
	}
}
</style>
</head>

<body>

	<%@include file="topbar.jsp"%>

	<!-- Navbar Start -->
	<%@include file="collapsed-navbar.jsp"%>
	<!-- Navbar End -->

	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 pb-5">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner border">
						<div class="carousel-item active">
							<img class="w-100 h-100"
								src='<c:url value="/resources/images/products/${product.images.image }" />'
								alt="Product Image">
						</div>
						<div class="carousel-item ">
							<img class="w-100 h-100"
								src='<c:url value="/resources/images/products/${product.images.image1 }" />'
								alt="Product Image">
						</div>
						<div class="carousel-item ">
							<img class="w-100 h-100"
								src='<c:url value="/resources/images/products/${product.images.image2 }" />'
								alt="Product Image">
						</div>
						<div class="carousel-item ">
							<img class="w-100 h-100"
								src='<c:url value="/resources/images/products/${product.images.image3 }" />'
								alt="banner">
						</div>
					</div>
					<a class="carousel-control-prev" href="#product-carousel"
						data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel"
						data-slide="next"> <i
						class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${product.getP_name() }</h3>
				<div class="d-flex mb-3">
					<div class="text-primary mr-2">
						<small class="fas fa-star"></small> <small class="fas fa-star"></small>
						<small class="fas fa-star"></small> <small class="fas fa-star"></small>
						<small class="far fa-star"></small>
					</div>
				</div>
				<h3 class="font-weight-semi-bold mb-4">
					&#8377;${product.p_dis_price }<sup><del class="text-primary">${product.p_price }</del></sup>
				</h3>
				<p class="mb-0">
					<strong>Product Details</strong>
				</p>
				<ul>
					<li><strong>Material Composition:</strong> 100% Cotton</li>
					<li><strong>Style:</strong> Regular</li>
					<li><strong>Pattern:</strong> Solid</li>
					<li><strong>Country of origin:</strong> India</li>
				</ul>
				<form action="/addtocart" method="post">
					<div class="d-flex mb-3">
						<p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
						<c:forEach var="size" items="${product.size }">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" required
									id="size-<%=++i %>" value="${size.size }" name="size">
								<label class="custom-control-label" for="size-<%=i%>">${size.size }</label>
							</div>
						</c:forEach>
					</div>
					<div class="d-flex mb-4">
						<p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
						<c:forEach var="colors" items="${product.color }">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" required
									id="color-<%=++j %>" value="${colors.color}" name="color">
								<label class="custom-control-label" for="color-<%=j%>">${colors.color}</label>
							</div>
						</c:forEach>
					</div>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="input-group quantity mr-3" style="width: 130px;">
							<div class="input-group-btn"></div>
							<p class="text-dark font-weight-medium mb-0 mr-3">Quantity:</p>
							<input type="text" class="form-control bg-secondary text-center"
								name="quantity" value="1">
							<div class="input-group-btn"></div>
						</div>
					</div>
					<input type="hidden" name="product_id" value="${product.p_id }">
					<button type="submit" class="btn btn-primary px-3 text-light">
						<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
					</button>
				</form>
				<div class="d-flex pt-2">
					<p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
					<div class="d-inline-flex">
						<a class="text-dark px-2"
							href="https://www.facebook.com/sharer/sharer.php?u=https://www.dattebaayo.com/details/${product.p_id }/${product.p_name}"
							target="_blank" rel="noopener noreferrer"> <i
							class="fab fa-facebook-f"></i>
						</a> <a class="text-dark px-2"
							href="https://twitter.com/intent/tweet?url=https://www.dattebaayo.com/details/${product.p_id }/${product.p_name}"
							target="_blank" rel="noopener noreferrer"> <i
							class="fab fa-twitter"></i>
						</a> <a class="text-dark px-2"
							href="https://api.whatsapp.com/send?text=Check%20out%20this%20link:%20https://www.dattebaayo.com/details/${product.p_id }/${product.p_name}"
							target="_blank" rel="noopener noreferrer"> <i
							class="fab fa-whatsapp"></i>
						</a>
					</div>
				</div>
				<p>View <a href="/privacy-policy">Return Policy</a></p>
			</div>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div
					class="nav nav-tabs justify-content-center border-secondary mb-4">
					<a class="nav-item nav-link active" data-toggle="tab"
						href="#tab-pane-1">Description</a> <a class="nav-item nav-link"
						data-toggle="tab" href="#tab-pane-2">Size</a>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-pane-1">
						<h4 class="mb-3 text-center">Product Description</h4>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><strong>Care
									Instructions:</strong> Machine Wash</li>
							<li class="list-group-item"><strong>Fit Type:</strong>
								Regular Fit</li>
							<li class="list-group-item">Made with soft and rich cotton
								blend fabric for all-day comfort. Stretchable and Quality fabric
								for softer hand feel; Classic, simple design with Round neck for
								added style.</li>
							<li class="list-group-item">Regular fit for a comfortable
								and relaxed feel, Lightweight and breathable for all-day
								comfort- Perfect for casual wear or sports activities, work
								attire, or a day on the golf course.</li>
							<li class="list-group-item"><strong>Care
									instructions:</strong> Machine washable for easy care and maintenance.
								To prevent shrinking, always wash your t-shirt in cold water and
								avoid using bleach.</li>
							<li class="list-group-item"><strong>Care
									instructions:</strong> This is a modern fit T-shirt. To ensure it fits
								properly please refer to our size chart provided in the image
								gallery. Available in various colors and sizes to fit all body
								types.</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="tab-pane-2">
						<h4 class="mb-3 text-center">Size chart in Inches</h4>
						<div class="container  mx-auto text-center">
							<div class="row">

								<c:choose>
									<c:when test="${productCategory == '102'}">
									<table>
									<thead>
										<tr>
											<th>Brand Size</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
											<th>XXXL</th>
											<th>XXXXL</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Standard Size</td>
											<td>S</td>
											<td>M</td>
											<td>L</td>
											<td>XL</td>
											<td>XXL</td>
											<td>XXXL</td>
											<td>XXXXL</td>
										</tr>
										<tr>
											<td>Chest</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
											<td>48</td>
											<td>50</td>
										</tr>
										<tr>
											<td>Shoulder</td>
											<td>17</td>
											<td>17.5</td>
											<td>18.5</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td>21.5</td>
										</tr>
										<tr>
											<td>Length</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
											<td>32</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '101'}">
										<table>
									<thead>
										<tr>
											<th>Hoddie</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
											<th>XXXL</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
										</tr>
										<tr>
											<td>Chest(Inch)</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
											<td>48</td>
											<td>50</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '103'}">
										<table>
									<thead>
										<tr>
											<th>POLO T-Shirt</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
										</tr>
										<tr>
											<td>Chest(Inch)</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '104'}">
										<table>
									<thead>
										<tr>
											<th>Oversized T-Shirt</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>28</td>
											<td>29</td>
											<td>31</td>
											<td>31</td>
											<td>32</td>
										</tr>
										<tr>
											<td>Chest(Inch)</td>
											<td>41</td>
											<td>43</td>
											<td>45</td>
											<td>47</td>
											<td>49</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '105'}">
										<table>
									<thead>
										<tr>
											<th>Sweatshirt</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
											<th>XXXL</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
										</tr>
										<tr>
											<td>Chest(Inch)</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
											<td>48</td>
											<td>50</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '106'}">
										<table>
									<thead>
										<tr>
											<th>Joggers</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>37</td>
											<td>38</td>
											<td>39</td>
											<td>40</td>
											<td>41</td>
										</tr>
										<tr>
											<td>Waist(Inch)</td>
											<td>28-30</td>
											<td>30-32</td>
											<td>32-34</td>
											<td>34-36</td>
											<td>36-38</td>
										</tr>
										
										<tr>
											<td>Hip(Inch)</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
											<td>46</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '107'}">
										<table>
									<thead>
										<tr>
											<th>Crop Top</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
										</tr>
										<tr>
											<td>Bust(Inch)</td>
											<td>34</td>
											<td>36</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
										</tr>
										
										<tr>
											<td>Sleeve(Inch)</td>
											<td>6</td>
											<td>6.5</td>
											<td>7</td>
											<td>7.5</td>
											<td>8</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '108'}">
										<table>
									<thead>
										<tr>
											<th>Crop Hoddie</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>18.5</td>
											<td>19.5</td>
											<td>20.5</td>
											<td>21.5</td>
											<td>22.5</td>
										</tr>
										<tr>
											<td>Bust(Inch)</td>
											<td>36</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
										</tr>
										
										<tr>
											<td>Sleeve(Inch)</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:when test="${productCategory== '109'}">
										<table>
									<thead>
										<tr>
											<th>Tanks</th>
											<th>S</th>
											<th>M</th>
											<th>L</th>
											<th>XL</th>
											<th>XXl</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Length(Inch)</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>28.5</td>
											<td>29.5</td>
										</tr>
										<tr>
											<td>Chest(Inch)</td>
											<td>36</td>
											<td>38</td>
											<td>40</td>
											<td>42</td>
											<td>44</td>
										</tr>
									</tbody>
								</table>
									</c:when>
									<c:otherwise>
										<h1>Something went wrong</h1>
									</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	<!-- Shop Detail End -->


	<!-- Products Start -->
	<div class="container-fluid py-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">You May Also Like</span>
			</h2>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel related-carousel">
					<c:forEach var="similarProducts" items="${similarProducts }">
						<div class="card product-item border-0">
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<img class="img-fluid w-100"
									src='<c:url value="/resources/images/products/${similarProducts.images.image }" />'
									alt="image">
							</div>
							<div
								class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${similarProducts.p_name }</h6>
								<div class="d-flex justify-content-center">
									<h6>&#8377;${similarProducts.p_dis_price }</h6>
									<h6 class="text-muted ml-2">
										<del>${similarProducts.p_price }</del>
									</h6>
								</div>
							</div>
							<div
								class="card-footer d-flex justify-content-between bg-light border text-center">
								<a href="/details/${similarProducts.p_id }/${similarProducts.p_name }"
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Products End -->

	<%@include file="footer.jsp"%>

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>

	<!-- JavaScript Libraries -->
	<%@include file="scripts.jsp"%>
</body>

</html>