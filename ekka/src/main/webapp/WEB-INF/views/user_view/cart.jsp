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
    <title>Ekka | Cart.</title>

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
                        <h2 class="ec-breadcrumb-title">Cart</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="ec-breadcrumb-item active">Cart</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Ec cart page -->
<section class="ec-page-content section-space-p p-0">
    <div class="container">
        <div class="row">
            <c:if test="${listCartUserId == []}">
                <div class="ec-wish-rightside col-lg-12 col-md-12">
                    <p class="emp-wishlist-msg">Your cart is empty!</p>
                </div>
                <div class="ec-wish-rightside col-lg-12 col-md-12 pt-0">
                    <p class="emp-wishlist-msg pt-0 text-decoration-underline"><a href="/ekka/product">Shoping now!</a></p>
                </div>
            </c:if>
            <c:if test="${listCartUserId != []}">

            <f:form cssClass="row" method="post" action="/ekka/order/save"
                    modelAttribute="orderDto">

                <div class="ec-cart-leftside col-md-12 col-lg-12 col-xl-8">
                    <!-- cart content Start -->
                    <div class="ec-cart-content">
                        <div class="ec-cart-inner">
                            <div class="row">
                                    <div class="table-content cart-table-content">
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Color</th>
                                                <th>Size</th>
                                                <th>Price($)</th>
                                                <th>Discount(%)</th>
                                                <th style="text-align: center;">Quantity</th>
                                                <th>Total($)</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${listCartUserId}" var="cartUserId">
                                                <f:input cssClass="d-none" path="product" value="${cartUserId.product.id}"></f:input>
                                                <f:input cssClass="d-none" path="cart" value="${cartUserId.id}"></f:input>

                                                <tr>
                                                    <td data-label="Product" class="ec-cart-pro-name"><a
                                                            class="cart-product-name"
                                                            title="${cartUserId.product.productName}"
                                                            href="/ekka/product-details/${cartUserId.product.id}"><img
                                                            class="ec-cart-pro-img mr-4"
                                                            src="${cartUserId.product.productImage}"
                                                            alt=""/><span>${cartUserId.product.productName}</span></a>
                                                    </td>
                                                    <td data-label="Color">
                                                        <div class="btn-group">
                                                            <button class="showColor" type="button"
                                                                    style="background-color: ${cartUserId.color_product};border: 2px solid;width: 40px;height: 40px;"></button>

                                                            <button type="button"
                                                                    class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split"
                                                                    style="width: 40px;height: 40px;" data-toggle="dropdown"
                                                                    aria-expanded="false">
                                                                <span class="sr-only">Toggle Dropdown</span>
                                                            </button>
                                                            <div class="dropdown-menu px-4" style="min-width: auto;">
                                                                <c:forEach items="${listProductColor}" var="productColor">
                                                                    <c:if test="${cartUserId.product.id == productColor.product.id}">
                                                                        <button class="changeColor" type="button"
                                                                                style="background-color: ${productColor.colorName};border: 2px solid;width: 40px;height: 40px;"></button>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </div>
                                                            <f:input cssClass="color d-none" path="color" value="${cartUserId.color_product}"></f:input>

                                                        </div>

                                                    </td>
                                                    <td data-label="Size">
                                                        <div class="btn-group">
                                                            <button class="showSize" type="button"
                                                                    style="border: 2px solid;width: 40px;height: 40px;">${cartUserId.size_product}</button>

                                                            <button type="button"
                                                                    class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split"
                                                                    style="width: 40px;height: 40px;" data-toggle="dropdown"
                                                                    aria-expanded="false">
                                                                <span class="sr-only">Toggle Dropdown</span>
                                                            </button>
                                                            <div class="dropdown-menu px-4" style="min-width: auto;">
                                                                <c:forEach items="${listProductSize}" var="productSize">
                                                                    <c:if test="${cartUserId.product.id == productSize.product.id}">
                                                                        <button class="changeSize" type="button"
                                                                                style="border: 2px solid;width: 40px;height: 40px;">${productSize.sizeName}</button>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </div>
                                                            <f:input cssClass="size d-none" path="size" value="${cartUserId.size_product}"></f:input>

                                                        </div>

                                                    </td>
                                                    <td class="price text-right"
                                                        data-label="Price">${cartUserId.product.priceProduct}</td>
                                                    <td class="discount text-right"
                                                        data-label="Discount">${cartUserId.product.discount}</td>
                                                    <td data-label="Quantity"
                                                        style="text-align: center;">
                                                        <div class="form-group">
                                                            <input class="form-control px-3 py-0 item"
                                                                   style="height: 40px!important;min-height: 40px!important; width: 75px;"
                                                                   type="number" min="1"
                                                                   max="${cartUserId.product.totalProduct}"
                                                                   value="${cartUserId.product.totalProduct == 0 ? 0 : cartUserId.item}"/>

                                                        </div>
                                                        <f:input cssClass="itemProduct d-none" path="itemProduct" value="${cartUserId.item}"></f:input>
                                                        <f:input cssClass="totalPrice d-none" path="totalPrice" value="${cartUserId.price}"></f:input>

                                                    </td>
                                                    <td class="total text-right" data-label="Total">$<fmt:formatNumber
                                                            maxFractionDigits="2"
                                                            value="${cartUserId.product.totalProduct == 0 ? 0 : cartUserId.price}"></fmt:formatNumber></td>

                                                    <td data-label="Remove">
                                                        <f:form method="post" action="/ekka/cart/delete/${cartUserId.id}"
                                                                modelAttribute="urlDto">
                                                            <f:input type="text" path="url"
                                                                     value="${urlDto.url}"
                                                                     cssClass="d-none" id="one"/>
                                                            <button formmethod="post" formaction="/ekka/cart/delete/${cartUserId.id}"><i class="ecicon eci-trash-o"></i>
                                                            </button>
                                                        </f:form>
                                                    </td>
                                                </tr>



                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>


                            </div>
                        </div>
                    </div>
                    <!--cart content End -->
                </div>
                <!-- Sidebar Area Start -->
                <div class="ec-cart-rightside col-md-12 col-lg-12 col-xl-4">
                    <div class="ec-sidebar-wrap">
                        <!-- Sidebar Summary Block -->
                        <div class="ec-sidebar-block">
                            <div class="ec-sb-title">
                                <h3 class="ec-sidebar-title">Summary</h3>
                            </div>
                            <div class="ec-sb-block-content">
                                <h4 class="ec-ship-title">Estimate Shipping</h4>
                                <div class="ec-cart-form">
                                    <p>Enter your destination to get a shipping estimate</p>
                                    <span class="ec-cart-wrap">
                                        <label>Delivery address (<span class="text-danger">*</span>)</label>
                                        <f:input type="text" cssClass="DeliveryAddress mb-0" path="delivery_address"
                                                 placeholder="Delivery address"
                                                 aria-label="Delivery address"/>
                                        <p class="show-delivery-address text-danger">Can't be left blank!</p>
                                        </span>
                                    <span class="ec-cart-wrap">
                                            <label>Name of consignee (<span class="text-danger">*</span>)</label>
                                        <f:input cssClass="NameConsignee mb-0" type="text" path="name_consignee"
                                                 placeholder="Name of consignee"
                                                 aria-label="Name of consignee"/>
                                        <p class="show-name-consignee text-danger">Can't be left blank!</p>

                                        </span>
                                    <span class="ec-cart-wrap">
                                            <label>Delivery phone number (<span class="text-danger">*</span>)</label>
                                        <f:input cssClass="DeliveryPhone mb-0" type="tel" path="delivery_phone"
                                                 placeholder="Delivery phone number" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                                 aria-label="Delivery phone number"/>
                                        <p class="show-delivery-phone text-danger">Can't be left blank!</p>
                                        </span>
                                </div>
                            </div>

                            <div class="ec-sb-block-content">
                                <div class="ec-cart-summary-bottom">
                                    <div class="ec-cart-summary">
                                        <div class="show-sub-total">
                                            <span class="text-left">Sub-Total</span>
                                            <span class="text-right sub-total">$${totaltotal}</span>
                                        </div>
                                        <div class="ec-cart-summary-total">
                                            <span class="text-left">Total Amount</span>
                                            <span class="text-right all-total">$${totaltotal}</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ec-cart-update-bottom d-flex flex-column">
                                        <a class="mb-2" href="/ekka/product">Continue Shopping</a>
                                        <button type="submit" class="btn btn-primary">Order Now</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sidebar Summary Block -->
                    </div>
                </div>
            </f:form>
            </c:if>

        </div>
    </div>
</section>

<!-- Footer Start -->
<footer class="ec-footer section-space-mt">
    <div class="footer-container">
        <div class="footer-offer">
            <div class="container">
                <div class="row">
                    <div class="text-center footer-off-msg">
                        <span>Win a contest! Get this limited-editon</span><a href="#" target="_blank">View
                        Detail</a>
                    </div>
                </div>
            </div>
        </div>
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


<!-- Vendor JS -->
<%@include file="/WEB-INF/views/layout/user/scripts.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

<script>

    $("button.changeColor").click(function () {
        var el = $(this).css('background-color');
        console.log(el);
        $(this).parent().prevAll().last().css('background-color', el);
        $(this).parent().parent().children('input.color').val(el);
    });

    $("button.changeSize").click(function () {
        var el = $(this).text();
        console.log(el);
        $(this).parent().prevAll().last().text(el);
        $(this).parent().parent().children('input.size').val(el);
    });


    $("input.item").change(function (element) {
        var allTotal = 0;
        $("input.item").each(function (){
            var el = $(this).val();
            $(this).parent().parent().children('input.itemProduct').val(el)
            var price = $(this).parents("tr").children('td.price').text();
            var discount = $(this).parents("tr").children('td.discount').text();
            var total = (price * ((100 - discount) / 100)) * el;
            $(this).parent().parent().parent().children('td.total').text('$' + (+total.toFixed(2)));
            $(this).parent().children('input.totalPrice').val((+total.toFixed(2)))
            allTotal += total;
        })

        console.log(+allTotal.toFixed(2))
        $('.ec-cart-summary-total .all-total').text('$'+(+allTotal.toFixed(2)));
        $('.show-sub-total .sub-total').text('$'+(+allTotal.toFixed(2)));

    });

    $("input.DeliveryAddress").change(function (element) {
        var el = $(this).val();
        if (el == ""){
            $('p.show-delivery-address').text(`Can't be left blank!`);
        }else {
            $('p.show-delivery-address').text('');
        }
    });

    $("input.NameConsignee").change(function (element) {
        var el = $(this).val();
        if (el == ""){
            $('p.show-name-consignee').text(`Can't be left blank!`);
        }else {
            $('p.show-name-consignee').text('');
        }
    });

    $("input.DeliveryPhone").change(function (element) {
        var el = $(this).val();
        if (el == ""){
            $('p.show-delivery-phone').text(`Can't be left blank!`);
        }else {
            $('p.show-delivery-phone').text('');
        }
    });

</script>
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