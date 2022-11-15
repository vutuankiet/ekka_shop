<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Wish List.</title>

    <%@include file="/WEB-INF/views/layout/user/assets.jsp" %>
</head>
<body>
<div id="ec-overlay"><span class="loader_img"></span></div>

<!-- Header start  -->
<%@include file="/WEB-INF/views/layout/user/header.jsp" %>
<!-- Header End  -->


<!-- ekka Cart Start -->
<div class="ec-side-cart-overlay"></div>
<!-- ekka Cart End -->

<!-- Ec breadcrumb start -->
<div class="sticky-header-next-sec  ec-breadcrumb section-space-mb">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row ec_breadcrumb_inner">
                    <div class="col-md-6 col-sm-12">
                        <h2 class="ec-breadcrumb-title">Wishlist</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="/ekka">Home</a></li>
                            <li class="ec-breadcrumb-item active">Wishlist</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Ec Wishlist page -->
<section class="ec-page-content section-space-p" style="padding-top: 0!important;">
    <div class="container">
        <div class="row">
            <c:if test="${listWishListUserId == []}">
                <div class="ec-wish-rightside col-lg-12 col-md-12"><p class="emp-wishlist-msg">Your wishlist is
                    empty!</p></div>
            </c:if>
            <div class="ec-wish-rightside col-lg-12 col-md-12 empty-wish-list d-none"><p class="emp-wishlist-msg">Your wishlist is
                empty!</p></div>
            <!-- Compare Content Start -->
            <div class="ec-wish-rightside col-lg-12 col-md-12 ec-show-wish-list">
                <!-- Compare content Start -->
                <div class="ec-compare-content">
                    <div class="ec-compare-inner">
                        <div class="row margin-minus-b-30">
                            <c:forEach items="${listWishListUserId}" var="wishList">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 mb-6 pro-gl-content wish-list wish-list-${wishList.product.id}">
                                    <div class="ec-product-inner">
                                        <div class="ec-pro-image-outer">
                                            <div class="ec-pro-image">
                                                <a href="product-detail.html" class="image">
                                                    <img class="main-image"
                                                         src="${wishList.product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                                    <img class="hover-image"
                                                         src="${wishList.product.productImage}" alt="Product"
                                                         style="height: 335px; width: 100%; object-fit: cover;"/>
                                                </a>
                                                <span class="ec-com-remove">
                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${wishList.product.id == wishListUser.product.id}">
                                                                <button class="text-white remove-to-wish-list x-wish-list-${wishListUser.id}"/>
                                                                x</button>

                                                                <script>
                                                        $(document).ready(function () {

                                                            $("button.remove-to-wish-list.x-wish-list-${wishListUser.id}").click(function (event) {

                                                                var url = "${urlDto.url}";

                                                                $.post("/ekka/wish-list/delete/${wishListUser.id}", {
                                                                    url: url,
                                                                }, function (data) {
                                                                }).done(function () {
                                                                }).fail(function (xhr, textStatus, errorThrown) {
                                                                    toastr.error('Deleting wish list failed');
                                                                }).complete(function () {
                                                                    $("div.wish-list-${wishList.product.id}").remove();
                                                                    var el = $("div.wish-list").length;
                                                                    console.log(el);
                                                                    if(el == 0){
                                                                        console.log(el)
                                                                        $("div.empty-wish-list").removeClass("d-none");
                                                                        $("div.ec-show-wish-list").remove();
                                                                    }
                                                                    toastr.success('Delete wish list successfully');
                                                                });
                                                            });
                                                        });
                                                    </script>
                                                        </c:if>
                                                    </c:forEach>

                                                </span>
                                                <c:if test="${wishList.product.discount > 0}">
                                                    <span class="percentage">${wishList.product.discount}%</span>
                                                </c:if>
                                                <a href="/ekka/product-details/${wishList.product.id}" class="quickview"
                                                   data-link-action="quickview"
                                                   title="Quick view"><img
                                                        src="/user/assets/images/icons/quickview.svg"
                                                        class="svg_img pro_svg"
                                                        alt=""/></a>
                                                <div class="ec-pro-actions">
                                                    <c:if test="${wishList.product.totalProduct <= 0}">
                                                        <button disabled="disabled" style="background-color: #555555;"
                                                                type="button"
                                                                title="Add To Cart" class="out-to-cart">
                                                            <img style="fill: #FFFFFF;"
                                                                 src="/user/assets/images/icons/cart.svg"
                                                                 class="svg_img pro_svg"
                                                                 alt=""/> Add To Cart
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${wishList.product.totalProduct > 0}">

                                                        <button title="Add To Cart"
                                                                class="add-to-cart btn-save-${wishList.product.id}"><img
                                                                src="/user/assets/images/icons/cart.svg"
                                                                id="cart-active-${wishList.product.id}"
                                                                class="svg_img pro_svg"
                                                                alt=""/> Add To Cart
                                                        </button>
                                                        <c:forEach items="${listCartUserId}" var="cartUser">
                                                            <c:if test="${wishList.product.id == cartUser.product.id}">
                                                                <button disabled="disabled" title="Cart"
                                                                        style="background-color: #3575d4;"
                                                                        class="out-to-cart btn-remove-${cartUser.id}">
                                                                    <img style="fill: #FFFFFF;"
                                                                         src="/user/assets/images/icons/cart.svg"
                                                                         id="cart-active-${cartUser.id}"
                                                                         class="svg_img pro_svg"
                                                                         alt=""/> Remove To Cart
                                                                </button>
                                                            </c:if>
                                                        </c:forEach>
                                                        <script>
                                                            $(document).ready(function () {

                                                                $("button.btn-save-${wishList.product.id}").click(function (event) {

                                                                    var url = "${urlDto.url}";

                                                                    $.post("/ekka/cart/create/${wishList.product.id}", {
                                                                        url: url,
                                                                    }, function (data) {
                                                                    }).done(function () {
                                                                    }).fail(function (xhr, textStatus, errorThrown) {
                                                                        toastr.error('New cart creation failed');

                                                                    }).complete(function () {
                                                                        $("button.btn-save-${wishList.product.id}").css("background-color", "#3575d4");
                                                                        $("#cart-active-${wishList.product.id}").css("fill", "#ffffff");

                                                                        $("button.add-to-cart.btn-save-${wishList.product.id}").removeClass("add-to-cart btn-save-${wishList.product.id}").addClass("out-to-cart");
                                                                        $("button.out-to-cart").prop("disabled", true);

                                                                        toastr.success('Create new cart successfully');


                                                                    });

                                                                });
                                                            });
                                                        </script>

                                                    </c:if>

                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${wishList.product.id == wishListUser.product.id}">
                                                            <button class="ec-btn-group wishlist active remove-to-wish-list remove-wish-list-${wishListUser.id}"
                                                                    title="Wishlist" style="background-color: #3575d4;"><img
                                                                    src="/user/assets/images/icons/wishlist.svg"
                                                                    class="svg_img pro_svg" style="fill: #ffffff;" alt=""/></button>
                                                            <script>
                                                                $(document).ready(function () {

                                                                    $("button.remove-to-wish-list.remove-wish-list-${wishListUser.id}").click(function (event) {

                                                                        var url = "${urlDto.url}";

                                                                        $.post("/ekka/wish-list/delete/${wishListUser.id}", {
                                                                            url: url,
                                                                        }, function (data) {
                                                                        }).done(function () {
                                                                        }).fail(function (xhr, textStatus, errorThrown) {
                                                                            toastr.error('Deleting wish list failed');
                                                                        }).complete(function () {
                                                                            $("div.wish-list-${wishList.product.id}").remove();
                                                                            var el = $("div.wish-list").length;
                                                                            console.log(el);
                                                                            if(el == 0){
                                                                                console.log(el)
                                                                                $("div.empty-wish-list").removeClass("d-none");
                                                                                $("div.ec-show-wish-list").remove();
                                                                            }
                                                                            toastr.success('Delete wish list successfully');
                                                                        });
                                                                    });
                                                                });
                                                            </script>

                                                        </c:if>
                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="ec-pro-content">
                                            <h5 class="ec-pro-title"><a
                                                    href="/ekka/product-details/${wishList.product.id}">${wishList.product.productName}</a>
                                            </h5>
                                            <div class="ec-pro-rating">
                                                <c:if test="${wishList.product.rating <= 0}">
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 0 && wishList.product.rating < 1}">
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 1 && wishList.product.rating < 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 2 && wishList.product.rating < 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 3 && wishList.product.rating < 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating > 4 && wishList.product.rating < 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;"
                                                       class="ecicon eci-star-half-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 1}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${wishList.product.rating == 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating == 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${wishList.product.rating == 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                </c:if>
                                            </div>
                                            <div class="ec-pro-list-desc"
                                                 style="margin-left: 0!important;">${wishList.product.details}</div>
                                            <span class="ec-price">
                                            <c:if test="${wishList.product.discount > 0}">
                                                <span class="old-price">$${wishList.product.priceProduct}</span>
                                            </c:if>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${wishList.product.priceProduct * ((100 - wishList.product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                            <div class="ec-pro-option">
                                                <div class="ec-pro-color">
                                                    <span class="ec-pro-opt-label">Color</span>
                                                    <ul class="ec-opt-swatch ec-change-img">
                                                        <c:forEach items="${listProductColor}" var="productColor">
                                                            <c:if test="${productColor.product.id == wishList.product.id}">
                                                                <li style="border: 1px solid darkgray;"><a href="#"
                                                                                                           class="ec-opt-clr-img"
                                                                                                           data-src="${wishList.product.productImage}"
                                                                                                           data-src-hover="${wishList.product.productImage}"
                                                                                                           data-tooltip="Gray"><span
                                                                        style="background-color:${productColor.colorName};"></span></a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="ec-pro-size">
                                                    <span class="ec-pro-opt-label">Size</span>
                                                    <ul class="ec-opt-size">
                                                        <c:forEach items="${listProductSize}" var="productSize">
                                                            <c:if test="${productSize.product.id == wishList.product.id}">
                                                                <li><a href="#" class="ec-opt-sz"
                                                                       data-tooltip="Small">${productSize.sizeName}</a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!--compare content End -->
            </div>
            <!-- Compare Content end -->
        </div>
    </div>
</section>

<!-- Footer Start -->
<footer class="ec-footer section-space-mt">
    <div class="footer-container">
        <div class="footer-top section-space-footer-p">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-3 ec-footer-contact">
                        <div class="ec-footer-widget">
                            <div class="ec-footer-logo"><a href="#"><img src="assets/images/logo/footer-logo.png"
                                                                         alt=""><img class="dark-footer-logo"
                                                                                     src="assets/images/logo/dark-logo.png"
                                                                                     alt="Site Logo"
                                                                                     style="display: none;"/></a></div>
                            <h4 class="ec-footer-heading">Contact us</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link">71 Pilgrim Avenue Chevy Chase, east california.</li>
                                    <li class="ec-footer-link"><span>Call Us:</span><a href="#">0987654321</a></li>
                                    <li class="ec-footer-link"><span>Email:</span><a href="#"><span data-cfemail="#">example@gmail.com</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-info">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Information</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="about-us.html">About us</a></li>
                                    <li class="ec-footer-link"><a href="faq.html">FAQ</a></li>
                                    <li class="ec-footer-link"><a href="track-order.html">Delivery Information</a></li>
                                    <li class="ec-footer-link"><a href="contact-us.html">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-account">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Account</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="user-profile.html">My Account</a></li>
                                    <li class="ec-footer-link"><a href="track-order.html">Order History</a></li>
                                    <li class="ec-footer-link"><a href="wishlist.html">Wish List</a></li>
                                    <li class="ec-footer-link"><a href="offer.html">Specials</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-2 ec-footer-service">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Services</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link"><a href="track-order.html">Discount Returns</a></li>
                                    <li class="ec-footer-link"><a href="privacy-policy.html">Policy & policy </a></li>
                                    <li class="ec-footer-link"><a href="terms-condition.html">Customer Service</a></li>
                                    <li class="ec-footer-link"><a href="terms-condition.html">Term & condition</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-3 ec-footer-news">
                        <div class="ec-footer-widget">
                            <h4 class="ec-footer-heading">Newsletter</h4>
                            <div class="ec-footer-links">
                                <ul class="align-items-center">
                                    <li class="ec-footer-link">Get instant updates about our new products and
                                        special promos!
                                    </li>
                                </ul>
                                <div class="ec-subscribe-form">
                                    <form id="ec-newsletter-form" name="ec-newsletter-form" method="get"
                                          action="/ekka/contact-us">
                                        <div id="ec_news_signup" class="ec-form">
                                            <input class="ec-email" type="email" required=""
                                                   placeholder="Enter your email here..." name="ec-email" value=""/>
                                            <button id="ec-news-btn" class="button btn-primary" type="submit"
                                                    name="subscribe" value=""><i class="ecicon eci-paper-plane-o"
                                                                                 aria-hidden="true"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Footer social Start -->
                    <div class="col text-left footer-bottom-left">
                        <div class="footer-bottom-social">
                            <span class="social-text text-upper">Follow us on:</span>
                            <ul class="mb-0">
                                <li class="list-inline-item"><a class="hdr-facebook" href="#"><i
                                        class="ecicon eci-facebook"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-twitter" href="#"><i
                                        class="ecicon eci-twitter"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-instagram" href="#"><i
                                        class="ecicon eci-instagram"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i
                                        class="ecicon eci-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Footer social End -->
                    <!-- Footer Copyright Start -->
                    <div class="col text-center footer-copy">
                        <div class="footer-bottom-copy ">
                            <div class="ec-copy">Copyright © 2021-2022 <a class="site-name text-upper"
                                                                          href="#">ekka<span>.</span></a>. All Rights
                                Reserved
                            </div>
                        </div>
                    </div>
                    <!-- Footer Copyright End -->
                    <!-- Footer payment -->
                    <div class="col footer-bottom-right">
                        <div class="footer-bottom-payment d-flex justify-content-end">
                            <div class="payment-link">
                                <img src="assets/images/icons/payment.png" alt="">
                            </div>

                        </div>
                    </div>
                    <!-- Footer payment -->
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Footer Area End -->

<!-- Footer navigation panel for responsive display -->
<div class="ec-nav-toolbar">
    <div class="container">
        <div class="ec-nav-panel">
            <div class="ec-nav-panel-icons">
                <a href="#ec-mobile-menu" class="navbar-toggler-btn ec-header-btn ec-side-toggle"><img
                        src="/user/assets/images/icons/menu.svg" class="svg_img header_svg" alt=""/></a>
            </div>
            <div class="ec-nav-panel-icons">
                <a href="#ec-side-cart" class="toggle-cart ec-header-btn ec-side-toggle"><img
                        src="/user/assets/images/icons/cart.svg" class="svg_img header_svg" alt=""/><span
                        class="ec-cart-noti ec-header-count cart-count-lable">3</span></a>
            </div>
            <div class="ec-nav-panel-icons">
                <a href="index.html" class="ec-header-btn"><img src="/user/assets/images/icons/home.svg"
                                                                class="svg_img header_svg" alt="icon"/></a>
            </div>
            <div class="ec-nav-panel-icons">
                <a href="wishlist.html" class="ec-header-btn"><img src="/user/assets/images/icons/wishlist.svg"
                                                                   class="svg_img header_svg" alt="icon"/><span
                        class="ec-cart-noti">4</span></a>
            </div>
            <div class="ec-nav-panel-icons">
                <a href="login.html" class="ec-header-btn"><img src="/user/assets/images/icons/user.svg"
                                                                class="svg_img header_svg" alt="icon"/></a>
            </div>

        </div>
    </div>
</div>
<!-- Footer navigation panel for responsive display end -->


<!-- Vendor JS -->
<%@include file="/WEB-INF/views/layout/user/scripts.jsp" %>

<script>
    $(document).ready(function () {
        toastr.options = {
            'closeButton': true,
            'debug': false,
            'newestOnTop': false,
            'progressBar': false,
            'positionClass': 'toast-bottom-right',
            'preventDuplicates': false,
            'showDuration': '1000',
            'hideDuration': '1000',
            'timeOut': '5000',
            'extendedTimeOut': '1000',
            'showEasing': 'swing',
            'hideEasing': 'linear',
            'showMethod': 'fadeIn',
            'hideMethod': 'fadeOut',
        }
    });

    const success = setTimeout(Success, 1000);
    const error = setTimeout(Err, 1000);

    function Success() {
        <c:if test="${message_success != null}">
        toastr.success('${message_success}');
        </c:if>
    }

    function Err() {
        <c:if test="${message_err != null}">
        toastr.error('${message_err}');
        </c:if>
    }
</script>

</body>
</html>