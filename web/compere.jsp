<%-- 
    Document   : compere
    Created on : 8 Mar, 2021, 6:17:45 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- include the header Link -->
        <jsp:include page="head_link.jsp" /> 

        <title>AP MART - Shop Grid</title>
        
    </head>
    <body>
        <!-- include the header File -->
        <jsp:include page="header.jsp" />
        
        <jsp:include page="searchScript.jsp"></jsp:include>

        <div class="wrapper">
            <div class="gambo-Breadcrumb">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Compere</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="all-product-grid">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-4">
                            <div class="product-top-dt">
                                <div class="product-left-title">
                                    <div class="search-by-catgory">
                                        <div class="ui search dropdown">
                                            <div class="ui left icon input swdh10">
                                                <input class="prompt srch10" id="Itemshop2" type="text" placeholder="Search by name...">
                                                <i class="uil uil-search-alt icon icon1"></i>
                                                <div class="dropdown-content dc1" id="showList2"></div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--<nav class="navbar navbar-light  justify-content-end">
                                        <form class="form-inline">
                                            <input class="form-control mr-sm-2 uil uil-search-alt icon icon1" type="search" placeholder="Search" aria-label="Search">
                                           
                                            <button class="filter-btn hover-btn my-2 my-sm-0" type="submit">Search</button>
                                        </form>
                                    </nav>-->
                                </div>
                                <a href="#" class="pull-bs-canvas-right"></a>
                                <div class="product-sort">
                                    <div class="ui selection dropdown vchrt-dropdown">
                                        <input name="gender" type="hidden" value="default">
                                        <i class="dropdown icon d-icon"></i>
                                        <div class="text">Popularity</div>
                                        <div class="menu">
                                            <div class="item" data-value="0">Popularity</div>
                                            <div class="item" data-value="1">Price - Low to High</div>
                                            <div class="item" data-value="2">Price - High to Low</div>
                                            <div class="item" data-value="3">Alphabetical</div>
                                            <div class="item" data-value="4">Saving - High to Low</div>
                                            <div class="item" data-value="5">Saving - Low to High</div>
                                            <div class="item" data-value="6">% Off - High to Low</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-list-view">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-1.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">6% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$12 <span>$15</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-2.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">2% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$10 <span>$13</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-3.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">5% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$5 <span>$8</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-4.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">3% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$15 <span>$20</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-5.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">2% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$9 <span>$10</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-6.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">2% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$7 <span>$8</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-7.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">1% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$6.95 <span>$7</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-11.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">6% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$12 <span>$15</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-12.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">2% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$10 <span>$13</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-13.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">5% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$5 <span>$8</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-14.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">1% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$6.95 <span>$7</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="product-item mb-30">
                                    <a href="single_product_view.jsp" class="product-img">
                                        <img src="images/product/img-8.jpg" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">3% off</span>
                                            <span class="like-icon" title="wishlist"></span>
                                        </div>
                                    </a>
                                    <div class="product-text-dt">
                                        <p>Available<span>(In Stock)</span></p>
                                        <h4>Product Title Here</h4>
                                        <div class="product-price">$8 <span>$10</span></div>
                                        <div class="qty-cart">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus minus-btn">
                                                <input type="number" step="1" name="quantity" value="1" class="input-text qty text">
                                                <input type="button" value="+" class="plus plus-btn">
                                            </div>
                                            <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mb-4">
                                <div class="more-product-btn">
                                    <button class="show-more-btn hover-btn" onclick="window.location.href = '#';">Show More</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- include the footer File -->
        <jsp:include page="footer.jsp" />

        <!-- include the footer link -->
        <jsp:include page="footer_link.jsp" />
        

    </body>
</html>
