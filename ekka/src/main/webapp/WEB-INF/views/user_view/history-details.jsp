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
    <title>Ekka | Invoice.</title>

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
                        <h2 class="ec-breadcrumb-title">User History</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="ec-breadcrumb-item active">History</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- User invoice section -->
<section class="ec-page-content ec-vendor-uploads ec-user-account section-space-p">
    <div class="container">
        <div class="row">
            <!-- Sidebar Area Start -->
            <div class="ec-shop-leftside ec-vendor-sidebar col-lg-3 col-md-12">
                <div class="ec-sidebar-wrap">
                    <!-- Sidebar Category Block -->
                    <div class="ec-sidebar-block">
                        <div class="ec-vendor-block">
                            <div class="ec-vendor-block-items">
                                <ul>
                                    <li><a href="/ekka/profile">User Profile</a></li>
                                    <li><a href="/ekka/history">History</a></li>
                                    <li><a href="/ekka/wish-list">Wishlist</a></li>
                                    <li><a href="/ekka/cart">Cart</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ec-shop-rightside col-lg-9 col-md-12">
                <div class="ec-vendor-dashboard-card">
                    <div class="ec-vendor-card-header">
                        <h5>Invoice</h5>
<%--                        <div class="ec-header-btn">--%>
<%--                            <a class="btn btn-lg btn-secondary" href="#">Print</a>--%>
<%--                            <a class="btn btn-lg btn-primary" href="#">Export</a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="ec-vendor-card-body padding-b-0">
                        <div class="page-content">
                            <div class="page-header text-blue-d2">
                                <img src="/user/assets/images/logo/logo.png" alt="Site Logo">
                            </div>

                            <div class="container px-0">
                                <div class="row mt-4">
                                    <div class="col-lg-12">
                                        <hr class="row brc-default-l1 mx-n1 mb-4" />

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="my-2">
                                                    <span class="text-sm text-grey-m2 align-middle">To : </span>
                                                    <span class="text-600 text-110 text-blue align-middle">${name_consignee}</span>
                                                </div>
                                                <div class="text-grey-m2">
                                                    <div class="my-2">
                                                        ${delivery_address}
                                                    </div>
                                                    <div class="my-2"><b class="text-600">Phone : </b>${delivery_phone}
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col -->

                                            <div
                                                    class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                                <hr class="d-sm-none" />
                                                <div class="text-grey-m2">

                                                    <div class="my-2"><span class="text-600 text-90">ID : </span>
                                                        #${order_code}</div>

                                                    <div class="my-2"><span class="text-600 text-90">Issue Date :
                                                            </span> <fmt:formatDate pattern = "kk/MM/yyyy hh:mm:ss"
                                                                                    value = "${created_at}"/></div>

                                                    <div class="my-2"><span class="text-600 text-90">Invoice No :
                                                            </span><c:if test="${state == 0}"><span style="color: #fe5461!important">Order Cancellation</span></c:if>
                                                        <c:if test="${state == 1}"><span style="color: #8a909d!important">PENDING</span></c:if>
                                                        <c:if test="${state == 2}"><span style="color: #fec400!important">READY TO SHIP</span></c:if>
                                                        <c:if test="${state == 3}"><span style="color: #13cae1!important">ON THE WAY</span></c:if>
                                                        <c:if test="${state == 4}"><span style="color: #29cc97!important">DELIVERED</span></c:if></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>

                                        <div class="mt-4">

                                            <div class="text-95 text-secondary-d3">
                                                <div class="ec-vendor-card-table">
                                                    <table class="table ec-table">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Discount</th>
                                                            <th scope="col">Amount</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${listOrder}" var="order">
                                                            <tr>
                                                                <td><span>${order.order_code}</span></td>
                                                                <td><span><a href="/ekka/product/${order.product.id}">${order.product.productName}</a></span></td>
                                                                <td><span>${order.item}</span></td>
                                                                <td><span>$${order.product.priceProduct}</span></td>
                                                                <td><span>$${order.product.discount}</span></td>
                                                                <td><span>$${order.price}</span></td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                        <tfoot>
                                                        <tr>
                                                            <td class="border-none" colspan="4">
                                                                <span></span></td>
                                                            <td class="border-color" colspan="1">
                                                                <span><strong>Sub Total</strong></span></td>
                                                            <td class="border-color">
                                                                <span>$${orderDto.total_price}</span></td>
                                                        </tr>
<%--                                                        <tr>--%>
<%--                                                            <td class="border-none" colspan="3">--%>
<%--                                                                <span></span></td>--%>
<%--                                                            <td class="border-color" colspan="1">--%>
<%--                                                                <span><strong>Tax (10%)</strong></span></td>--%>
<%--                                                            <td class="border-color">--%>
<%--                                                                <span>$352</span></td>--%>
<%--                                                        </tr>--%>
                                                        <tr>
                                                            <td class="border-none m-m15"
                                                                colspan="4"><span class="note-text-color">Extra
                                                                            note such as company or payment
                                                                            information...</span></td>
                                                            <td class="border-color m-m15"
                                                                colspan="1"><span><strong>Total</strong></span>
                                                            </td>
                                                            <td class="border-color m-m15">
                                                                <span>$${orderDto.total_price}</span></td>
                                                        </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ec-vendor-card-body padding-b-0">
                        <div class="ec-trackorder-inner">
                            <div class="ec-trackorder-top">
                                <h2 class="ec-order-id">order #${order_code}</h2>
                                <div class="ec-order-detail">
                                    <div>Expected arrival <fmt:formatDate pattern = "dd/MM/yyyy"
                                                                          value = "${shippingEstimated}"/></div>
                                    <%--                        <div>Grasshoppers <span>v534hb</span></div>--%>
                                </div>
                            </div>
                            <div class="ec-trackorder-bottom">
                                <div class="ec-progress-track">
                                    <ul id="ec-progressbar">
                                        <c:if test="${state == 0}">
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                        <br>processed</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>designing</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>shipped</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order <br>enroute</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>arrived</span></li>
                                        </c:if>
                                        <c:if test="${state == 1}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                        <br>processed</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>designing</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>shipped</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order <br>enroute</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>arrived</span></li>
                                        </c:if>
                                        <c:if test="${state == 2}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                        <br>processed</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>designing</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>shipped</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order <br>enroute</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>arrived</span></li>
                                        </c:if>
                                        <c:if test="${state == 3}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                        <br>processed</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>designing</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>shipped</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order <br>enroute</span></li>
                                            <li class="step0"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>arrived</span></li>
                                        </c:if>
                                        <c:if test="${state == 4}">
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_1.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                        <br>processed</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_2.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>designing</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_3.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>shipped</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_4.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order <br>enroute</span></li>
                                            <li class="step0 active"><span class="ec-track-icon"> <img
                                                    src="/user/assets/images/icons/track_5.png" alt="track_order"></span><span
                                                    class="ec-progressbar-track"></span><span class="ec-track-title">order
                                            <br>arrived</span></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End User invoice section -->

<!-- Footer Start -->
<footer class="ec-footer section-space-mt">
    <div class="footer-container">
        <div class="footer-top section-space-footer-p">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-3 ec-footer-contact">
                        <div class="ec-footer-widget">
                            <div class="ec-footer-logo"><a href="#"><img src="/user/assets/images/logo/footer-logo.png"
                                                                         alt=""><img class="dark-footer-logo"
                                                                                     src="/user/assets/images/logo/dark-logo.png"
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
                            <div class="ec-copy">Copyright ?? 2021-2022 <a class="site-name text-upper"
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
                                <img src="/user/assets/images/icons/payment.png" alt="">
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
<!-- Cart Floating Button end -->

<%--script start--%>
<%@include file="/WEB-INF/views/layout/user/scripts.jsp" %>
</body>
<%--body end--%>
</html>