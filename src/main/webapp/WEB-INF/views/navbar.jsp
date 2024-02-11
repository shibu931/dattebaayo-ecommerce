<%@page import="com.Entities.User"%>
<% User px1 = (User)session.getAttribute("user"); %>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Shop by Anime<i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="/shop/1" class="dropdown-item">Naruto</a>
                                <a href="/shop/2" class="dropdown-item">One Piece</a>
                                <a href="/shop/7" class="dropdown-item">Dragon Ball</a>
                                <a href="/shop/17" class="dropdown-item">Attack on Titan</a>
                                <a href="/shop/6" class="dropdown-item">Demon Slayer</a>
                                <a href="/shop/4" class="dropdown-item">Jujutsu Kaisen</a>
                                <a href="/shop/3" class="dropdown-item">Hunter x Hunter</a>
                                <a href="/shop/5" class="dropdown-item">Tokyo Revengers</a>
                                <a href="/shop/8" class="dropdown-item">Death Note</a>
                            </div>
                        </div>
                       			<a href="/shop/102" class="dropdown-item">Round Neck T-Shirts</a>
                                <a href="/shop/103" class="dropdown-item">Polo T-Shirts</a>
                                <a href="/shop/104" class="dropdown-item">Oversized T-Shirts</a>
                                <a href="/shop/101" class="dropdown-item">Hoodies</a>
                                <a href="/shop/105" class="dropdown-item">Sweatshirt</a>
                                <a href="/shop/106" class="dropdown-item">Joggers</a>
                                <a href="/shop/107" class="dropdown-item">Crop Tops</a>
                                <a href="/shop/108" class="dropdown-item">Crop Hoodie</a>
                                <a href="/shop/109" class="dropdown-item">Tanks</a>
                    </div>
                </nav>
            </div>

            <!-- Mobile Nav Bar -->
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="/index" class="text-decoration-none d-block d-lg-none">
                        <img class="ml-2" src='<c:url value="resources/images/logo.png"/>' width="200px" alt="logo">
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="/" class="nav-item nav-link active">Home</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Shop by anime</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                <a href="/shop/1" class="dropdown-item">Naruto</a>
                                <a href="/shop/2" class="dropdown-item">One Piece</a>
                                <a href="/shop/7" class="dropdown-item">Dragon Ball</a>
                                <a href="/shop/17" class="dropdown-item">Attack on Titan</a>
                                <a href="/shop/6" class="dropdown-item">Demon Slayer</a>
                                <a href="/shop/4" class="dropdown-item">Jujutsu Kaisen</a>
                                <a href="/shop/3" class="dropdown-item">Hunter x Hunter</a>
                                <a href="/shop/5" class="dropdown-item">Tokyo Revengers</a>
                                <a href="/shop/8" class="dropdown-item">Death Note</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Products</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                <a href="shop/102" class="dropdown-item">Round Neck T-Shirts</a>
                                <a href="/shop/103" class="dropdown-item">Polo T-Shirts</a>
                                <a href="/shop/104" class="dropdown-item">Oversized T-Shirts</a>
                                <a href="/shop/101" class="dropdown-item">Hoodies</a>
                                <a href="/shop/105" class="dropdown-item">Sweatshirt</a>
                                <a href="/shop/106" class="dropdown-item">Joggers</a>
                                <a href="/shop/107" class="dropdown-item">Crop Tops</a>
                                <a href="/shop/108" class="dropdown-item">Crop Hoodie</a>
                                <a href="/shop/109" class="dropdown-item">Tanks</a>
                    </div>
                            </div>
                            <a href="/contact" class="nav-item nav-link">Contact</a>
                            <a href="/privacy-policy" class="nav-item nav-link">Privacy Policy</a>
                            <a href="/about" class="nav-item nav-link">About Us</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                        <%if(px1==null){ %>	
                            <a href="/login" class="nav-item nav-link">Login</a>
                            <a href="/register" class="nav-item nav-link">Register</a>
                        <%}else{ %>
                        	<a href="/logout" class="nav-item nav-link">Logout</a>
                        <%} %>
                        </div>
                    </div>
                </nav>