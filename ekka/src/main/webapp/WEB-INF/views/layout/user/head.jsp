<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Home.</title>

    <!-- site Favicon -->
    <link rel="icon" href="/user/assets/images/favicon/favicon.png" sizes="32x32" />
    <link rel="apple-touch-icon" href="/user/assets/images/favicon/favicon.png" />
    <meta name="msapplication-TileImage" content="/user/assets/images/favicon/favicon.png" />

    <!-- css Icon Font -->
    <link rel="stylesheet" href="/user/assets/css/vendor/ecicons.min.css" />

    <!-- css All Plugins Files -->
    <link rel="stylesheet" href="/user/assets/css/plugins/animate.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/jquery-ui.min.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/countdownTimer.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/slick.min.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/nouislider.css" />
    <link rel="stylesheet" href="/user/assets/css/plugins/bootstrap.css" />

    <!-- Main Style -->
    <link rel="stylesheet" href="/user/assets/css/demo1.css" />
    <link rel="stylesheet" href="/user/assets/css/style.css" />
    <link rel="stylesheet" href="/user/assets/css/responsive.css" />

    <!-- Background css -->
    <link rel="stylesheet" id="bg-switcher-css" href="/user/assets/css/backgrounds/bg-4.css">
</head>
<body>
<div id="ec-overlay"><span class="loader_img"></span></div>

<!-- Header start  -->
<header class="ec-header">
    <!--Ec Header Top Start -->
    <div class="header-top">
        <div class="container">
            <div class="row align-items-center">
                <!-- Header Top social Start -->
                <div class="col text-left header-top-left d-none d-lg-block">
                    <div class="header-top-social">
                        <span class="social-text text-upper">Follow us on:</span>
                        <ul class="mb-0">
                            <li class="list-inline-item"><a class="hdr-facebook" href="#"><i class="ecicon eci-facebook"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-twitter" href="#"><i class="ecicon eci-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-instagram" href="#"><i class="ecicon eci-instagram"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i class="ecicon eci-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Header Top social End -->
                <!-- Header Top Message Start -->
                <div class="col text-center header-top-center">
                    <div class="header-top-message text-upper">
                        <span>Free Shipping</span>This Week Order Over - $75
                    </div>
                </div>
                <!-- Header Top Message End -->
                <!-- Header Top Language Currency -->
                <div class="col header-top-right d-none d-lg-block">
                    <div class="header-top-lan-curr d-flex justify-content-end">
                        <!-- Currency Start -->
                        <div class="header-top-curr dropdown">
                            <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Currency <i
                                    class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                            <ul class="dropdown-menu">
                                <li class="active"><a class="dropdown-item" href="#">USD $</a></li>
                                <li><a class="dropdown-item" href="#">EUR €</a></li>
                            </ul>
                        </div>
                        <!-- Currency End -->
                        <!-- Language Start -->
                        <div class="header-top-lan dropdown">
                            <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Language <i
                                    class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                            <ul class="dropdown-menu">
                                <li class="active"><a class="dropdown-item" href="#">English</a></li>
                                <li><a class="dropdown-item" href="#">Italiano</a></li>
                            </ul>
                        </div>
                        <!-- Language End -->

                    </div>
                </div>
                <!-- Header Top Language Currency -->
                <!-- Header Top responsive Action -->
                <div class="col d-lg-none ">
                    <div class="ec-header-bottons">
                        <!-- Header User Start -->
                        <sec:authorize access="hasAnyRole('ROLE_USER')">
                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                        src="<sec:authentication property="principal.avatar"></sec:authentication>" style="border-radius: 50%; border: 1px solid black; object-fit: cover" class="svg_img header_svg" alt="" /></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="#"><sec:authentication property="principal.fullName"></sec:authentication></a></li>
                                    <li><a class="dropdown-item" href="/ekka/profile"><sec:authentication property="principal.fullName"></sec:authentication></a></li>
                                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                </ul>
                            </div>

                        <!-- Header User End -->
                        <!-- Header Cart Start -->
                        <a href="wishlist.html" class="ec-header-btn ec-header-wishlist">
                            <div class="header-icon"><img src="/user/assets/images/icons/wishlist.svg"
                                                          class="svg_img header_svg" alt="" /></div>
                            <span class="ec-header-count">4</span>
                        </a>
                        <!-- Header Cart End -->
                        <!-- Header Cart Start -->
                        <a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
                            <div class="header-icon"><img src="/user/assets/images/icons/cart.svg"
                                                          class="svg_img header_svg" alt="" /></div>
                            <span class="ec-header-count cart-count-lable">3</span>
                        </a>
                        </sec:authorize>
                        <sec:authorize access="!hasAnyRole('ROLE_USER')">
                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                        src="/user/assets/images/icons/user.svg" class="svg_img header_svg" alt="" /></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="/ekka/register">Register</a></li>
                                    <li><a class="dropdown-item" href="/ekka/login">Login</a></li>
                                </ul>
                            </div>
                        </sec:authorize>
                        <!-- Header Cart End -->
                        <a href="javascript:void(0)" class="ec-header-btn ec-sidebar-toggle">
                            <img src="/user/assets/images/icons/category-icon.svg" class="svg_img header_svg" alt="icon" />
                        </a>
                        <!-- Header menu Start -->
                        <a href="#ec-mobile-menu" class="ec-header-btn ec-side-toggle d-lg-none">
                            <img src="/user/assets/images/icons/menu.svg" class="svg_img header_svg" alt="icon" />
                        </a>
                        <!-- Header menu End -->
                    </div>
                </div>
                <!-- Header Top responsive Action -->
            </div>
        </div>
    </div>
    <!-- Ec Header Top  End -->
    <!-- Ec Header Bottom  Start -->
    <div class="ec-header-bottom d-none d-lg-block">
        <div class="container position-relative">
            <div class="row">
                <div class="ec-flex">
                    <!-- Ec Header Logo Start -->
                    <div class="align-self-center">
                        <div class="header-logo">
                            <a href="index.html"><img src="/user/assets/images/logo/logo.png" alt="Site Logo" /><img
                                    class="dark-logo" src="/user/assets/images/logo/dark-logo.png" alt="Site Logo"
                                    style="display: none;" /></a>
                        </div>
                    </div>
                    <!-- Ec Header Logo End -->

                    <!-- Ec Header Search Start -->
                    <div class="align-self-center">
                        <div class="header-search">
                            <form class="ec-btn-group-form" action="#">
                                <input class="form-control ec-search-bar" placeholder="Search products..." type="text">
                                <button class="submit" type="submit"><img src="/user/assets/images/icons/search.svg"
                                                                          class="svg_img header_svg" alt="" /></button>
                            </form>
                        </div>
                    </div>
                    <!-- Ec Header Search End -->

                    <!-- Ec Header Button Start -->
                    <div class="align-self-center">
                        <div class="ec-header-bottons">

                            <!-- Header User Start -->
                            <sec:authorize access="hasAnyRole('ROLE_USER')">
                                <div class="ec-header-user dropdown">
                                    <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                            src="<sec:authentication property="principal.avatar"></sec:authentication>" style="border-radius: 50%; border: 1px solid black; object-fit: cover" class="svg_img header_svg" alt="" /></button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a class="dropdown-item" href="#"><sec:authentication property="principal.fullName"></sec:authentication></a></li>
                                        <li><a class="dropdown-item" href="/ekka/profile">Profile</a></li>
                                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                    </ul>
                                </div>
                                <!-- Header wishlist Start -->
                                <a href="wishlist.html" class="ec-header-btn ec-header-wishlist">
                                    <div class="header-icon"><img src="/user/assets/images/icons/wishlist.svg"
                                                                  class="svg_img header_svg" alt="" /></div>
                                    <span class="ec-header-count">4</span>
                                </a>
                                <!-- Header wishlist End -->
                                <!-- Header Cart Start -->
                                <a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
                                    <div class="header-icon"><img src="/user/assets/images/icons/cart.svg"
                                                                  class="svg_img header_svg" alt="" /></div>
                                    <span class="ec-header-count cart-count-lable">3</span>
                                </a>
                                <!-- Header Cart End -->
                            </sec:authorize>
                            <sec:authorize access="!hasAnyRole('ROLE_USER')">

                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><img
                                        src="/user/assets/images/icons/user.svg" class="svg_img header_svg" alt="" /></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="/ekka/register">Register</a></li>
                                    <li><a class="dropdown-item" href="/ekka/login">Login</a></li>
                                </ul>
                            </div>
                            </sec:authorize>

                            <!-- Header User End -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec Header Button End -->
    <!-- Header responsive Bottom  Start -->
    <div class="ec-header-bottom d-lg-none">
        <div class="container position-relative">
            <div class="row ">

                <!-- Ec Header Logo Start -->
                <div class="col">
                    <div class="header-logo">
                        <a href="index.html"><img src="/user/assets/images/logo/logo.png" alt="Site Logo" /><img
                                class="dark-logo" src="/user/assets/images/logo/dark-logo.png" alt="Site Logo"
                                style="display: none;" /></a>
                    </div>
                </div>
                <!-- Ec Header Logo End -->
                <!-- Ec Header Search Start -->
                <div class="col">
                    <div class="header-search">
                        <form class="ec-btn-group-form" action="#">
                            <input class="form-control ec-search-bar" placeholder="Search products..." type="text">
                            <button class="submit" type="submit"><img src="/user/assets/images/icons/search.svg"
                                                                      class="svg_img header_svg" alt="icon" /></button>
                        </form>
                    </div>
                </div>
                <!-- Ec Header Search End -->
            </div>
        </div>
    </div>
    <!-- Header responsive Bottom  End -->
    <!-- EC Main Menu Start -->
    <div id="ec-main-menu-desk" class="d-none d-lg-block sticky-nav">
        <div class="container position-relative">
            <div class="row">
                <div class="col-md-12 align-self-center">
                    <div class="ec-main-menu">
                        <a href="javascript:void(0)" class="ec-header-btn ec-sidebar-toggle">
                            <img src="/user/assets/images/icons/category-icon.svg" class="svg_img header_svg" alt="icon" />
                        </a>
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="product.html">Product</a></li>
                            <li><a href="./offer.html">Hot Offers</a></li>
                            <li><a href="./about-us.html">About Us</a></li>
                            <li><a href="./contact-us.html">Contact Us</a></li>
                            <li><a href="./faq.html">FAQ</a></li>
                            <li><a href="blog.html">Blog</a></li>

                            <li class="dropdown scroll-to"><a href="javascript:void(0)"><img
                                    src="/user/assets/images/icons/scroll.svg" class="svg_img header_svg scroll" alt="" /></a>
                                <ul class="sub-menu">
                                    <li class="menu_title">Scroll To Section</li>
                                    <li><a href="javascript:void(0)" data-scroll="collection" class="nav-scroll">Top Collection</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="categories" class="nav-scroll">Categories</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="offers" class="nav-scroll">Offers</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="vendors" class="nav-scroll">Top Vendors</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="services" class="nav-scroll">Services</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="arrivals" class="nav-scroll">New Arrivals</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="reviews" class="nav-scroll">Client Review</a></li>
                                    <li><a href="javascript:void(0)" data-scroll="insta" class="nav-scroll">Instagram Feed</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec Main Menu End -->
    <!-- ekka Mobile Menu Start -->
    <div id="ec-mobile-menu" class="ec-side-cart ec-mobile-menu">
        <div class="ec-menu-title">
            <span class="menu_title">My Menu</span>
            <button class="ec-close">×</button>
        </div>
        <div class="ec-menu-inner">
            <div class="ec-menu-content">
                <ul>
                    <li><a href="./index.html">Home</a></li>
                    <li><a href="product.html">Product</a></li>
                    <li><a href="./offer.html">Hot Offers</a></li>
                    <li><a href="./about-us.html">About Us</a></li>
                    <li><a href="./contact-us.html">Contact Us</a></li>
                    <li><a href="./faq.html">FAQ</a></li>
                    <li><a href="blog.html">Blog</a></li>
                </ul>
            </div>
            <div class="header-res-lan-curr">
                <div class="header-top-lan-curr">
                    <!-- Language Start -->
                    <div class="header-top-lan dropdown">
                        <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Language <i
                                class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                        <ul class="dropdown-menu">
                            <li class="active"><a class="dropdown-item" href="#">English</a></li>
                            <li><a class="dropdown-item" href="#">Italiano</a></li>
                        </ul>
                    </div>
                    <!-- Language End -->
                    <!-- Currency Start -->
                    <div class="header-top-curr dropdown">
                        <button class="dropdown-toggle text-upper" data-bs-toggle="dropdown">Currency <i
                                class="ecicon eci-caret-down" aria-hidden="true"></i></button>
                        <ul class="dropdown-menu">
                            <li class="active"><a class="dropdown-item" href="#">USD $</a></li>
                            <li><a class="dropdown-item" href="#">EUR €</a></li>
                        </ul>
                    </div>
                    <!-- Currency End -->
                </div>
                <!-- Social Start -->
                <div class="header-res-social">
                    <div class="header-top-social">
                        <ul class="mb-0">
                            <li class="list-inline-item"><a class="hdr-facebook" href="#"><i class="ecicon eci-facebook"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-twitter" href="#"><i class="ecicon eci-twitter"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-instagram" href="#"><i class="ecicon eci-instagram"></i></a></li>
                            <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i class="ecicon eci-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Social End -->
            </div>
        </div>
    </div>
    <!-- ekka mobile Menu End -->
</header>
<!-- Header End  -->

<!-- ekka Cart Start -->
<div class="ec-side-cart-overlay"></div>
<div id="ec-side-cart" class="ec-side-cart">
    <div class="ec-cart-inner">
        <div class="ec-cart-top">
            <div class="ec-cart-title">
                <span class="cart_title">My Cart</span>
                <button class="ec-close">×</button>
            </div>
            <ul class="eccart-pro-items">
                <li>
                    <a href="product-detail.html" class="sidekka_pro_img"><img
                            src="/user/assets/images/product-image/6_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">T-shirt For Women</a>
                        <span class="cart-price"><span>$76.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                        </div>
                        <a href="javascript:void(0)" class="remove">×</a>
                    </div>
                </li>
                <li>
                    <a href="product-detail.html" class="sidekka_pro_img"><img
                            src="/user/assets/images/product-image/12_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">Women Leather Shoes</a>
                        <span class="cart-price"><span>$64.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                        </div>
                        <a href="javascript:void(0)" class="remove">×</a>
                    </div>
                </li>
                <li>
                    <a href="product-detail.html" class="sidekka_pro_img"><img
                            src="/user/assets/images/product-image/3_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">Girls Nylon Purse</a>
                        <span class="cart-price"><span>$59.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                        </div>
                        <a href="javascript:void(0)" class="remove">×</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="ec-cart-bottom">
            <div class="cart-sub-total">
                <table class="table cart-table">
                    <tbody>
                    <tr>
                        <td class="text-left">Sub-Total :</td>
                        <td class="text-right">$300.00</td>
                    </tr>
                    <tr>
                        <td class="text-left">VAT (20%) :</td>
                        <td class="text-right">$60.00</td>
                    </tr>
                    <tr>
                        <td class="text-left">Total :</td>
                        <td class="text-right primary-color">$360.00</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="cart_btn">
                <a href="cart.html" class="btn btn-primary">View Cart</a>
                <a href="checkout.html" class="btn btn-secondary">Checkout</a>
            </div>
        </div>
    </div>
</div>
<!-- ekka Cart End -->

<!-- Category Sidebar start -->
<div class="ec-side-cat-overlay"></div>
<div class="col-lg-3 category-sidebar" data-animation="fadeIn">
    <div class="cat-sidebar">
        <div class="cat-sidebar-box">
            <div class="ec-sidebar-wrap">
                <!-- Sidebar Category Block -->
                <div class="ec-sidebar-block">
                    <div class="ec-sb-title">
                        <h3 class="ec-sidebar-title">Category<button class="ec-close">×</button></h3>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/dress-8.svg" class="svg_img" alt="drink" />Cothes</div>
                                <ul style="display: block;">
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Shirt <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">shorts & jeans <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">jacket<span title="Available Stock">- 500</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">dress & frock  <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/shoes-8.svg" class="svg_img" alt="drink" />Footwear</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sports <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Formal <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Casual <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">safety shoes <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/jewelry-8.svg" class="svg_img" alt="drink" />jewelry</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Earrings <span title="Available Stock">- 50</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Couple Rings <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Necklace <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/perfume-8.svg" class="svg_img" alt="drink" />perfume</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Clothes perfume<span title="Available Stock">- 4 pcs</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">deodorant <span title="Available Stock">- 52 pcs</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Flower fragrance <span title="Available Stock">- 10 pack</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Air Freshener<span title="Available Stock">- 35 pack</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/cosmetics-8.svg" class="svg_img" alt="drink" />cosmetics</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">shampoo<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sunscreen<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">body wash<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">makeup kit<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/glasses-8.svg" class="svg_img" alt="drink" />glasses</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sunglasses <span title="Available Stock">- 20</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Lenses <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/bag-8.svg" class="svg_img" alt="drink" />bags</div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">shopping bag <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Gym backpack <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">purse <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">wallet <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Sidebar Category Block -->
            </div>
        </div>
        <div class="ec-sidebar-slider-cat">
            <div class="ec-sb-slider-title">Best Sellers</div>
            <div class="ec-sb-pro-sl">
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/1.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">baby fabric shoes</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$5.00</span>
                                        <span class="new-price">$4.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/2.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">Men's hoodies t-shirt</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$10.00</span>
                                        <span class="new-price">$7.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/3.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">Girls t-shirt</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                                <i class="ecicon eci-star"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$5.00</span>
                                        <span class="new-price">$3.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/4.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">woolen hat for men</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$15.00</span>
                                        <span class="new-price">$12.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/5.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">Womens purse</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$15.00</span>
                                        <span class="new-price">$12.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/6.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">Baby toy doctor kit</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                                <i class="ecicon eci-star"></i>
                                <i class="ecicon eci-star"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$50.00</span>
                                        <span class="new-price">$45.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/7.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">teddy bear baby toy</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$35.00</span>
                                        <span class="new-price">$25.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="ec-sb-pro-sl-item">
                        <a href="product-detail.html" class="sidekka_pro_img"><img
                                src="/user/assets/images/product-image/2.jpg" alt="product" /></a>
                        <div class="ec-pro-content">
                            <h5 class="ec-pro-title"><a href="product-detail.html">Mens hoodies blue</a></h5>
                            <div class="ec-pro-rating">
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star fill"></i>
                                <i class="ecicon eci-star"></i>
                                <i class="ecicon eci-star"></i>
                            </div>
                            <span class="ec-price">
                                        <span class="old-price">$15.00</span>
                                        <span class="new-price">$13.00</span>
                                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>