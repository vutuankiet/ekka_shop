<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Ekka | Profile.</title>

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
                        <h2 class="ec-breadcrumb-title">User Profile</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="ec-breadcrumb-item active">Profile</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- User profile section -->
<section class="ec-page-content ec-vendor-uploads ec-user-account section-space-p">
    <div class="container">
        <div class="row">
            <!-- Sidebar Area Start -->
            <div class="ec-shop-leftside ec-vendor-sidebar col-lg-3 col-md-12">
                <div class="ec-sidebar-wrap">
                    <!-- Sidebar Category Block -->
                    <div class="ec-sidebar-block">
                        <div class="ec-vendor-block">
                            <!-- <div class="ec-vendor-block-bg"></div>
                            <div class="ec-vendor-block-detail">
                                <img class="v-img" src="/user/assets/images/user/1.jpg" alt="vendor image">
                                <h5>Mariana Johns</h5>
                            </div> -->
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
                <div class="ec-vendor-dashboard-card ec-vendor-setting-card">
                    <div class="ec-vendor-card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="ec-vendor-block-profile">
                                    <div class="ec-vendor-block-img space-bottom-30">
                                        <div class="ec-vendor-block-bg" style="--image-url:url(<sec:authentication property="principal.background_profile"></sec:authentication>)!important;">
                                            <a href="#" class="btn btn-lg btn-primary"
                                               data-link-action="editmodal" title="Edit Detail"
                                               data-bs-toggle="modal" data-bs-target="#edit_modal">Edit Detail</a>
                                        </div>
                                        <div class="ec-vendor-block-detail">
                                            <img class="v-img" style="object-fit: cover;" src="<sec:authentication property="principal.avatar"></sec:authentication>" alt="vendor image">
                                            <h5 class="name"><sec:authentication
                                                    property="principal.fullName"></sec:authentication></h5>
                                            <p>( Business )</p>
                                        </div>
                                        <p>Hello <span><sec:authentication
                                                property="principal.fullName"></sec:authentication>!</span></p>
                                        <p>From your account you can easily view and track orders. You can manage and
                                            change your account information like address, contact information and
                                            history of orders.</p>
                                    </div>
                                    <h5>Account Information</h5>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-email space-bottom-30">
                                                <h6>E-mail address <a href="javasript:void(0)"
                                                                      data-link-action="editmodal" title="Edit Detail"
                                                                      data-bs-toggle="modal"
                                                                      data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul>
                                                    <li><strong>Email: <sec:authentication
                                                            property="principal.email"></sec:authentication></strong>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-contact space-bottom-30">
                                                <h6>Contact nubmer<a href="javasript:void(0)"
                                                                     data-link-action="editmodal" title="Edit Detail"
                                                                     data-bs-toggle="modal"
                                                                     data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul><strong>Phone Nubmer: </strong>
                                                    <%--                                                        <sec:authentication var="principal" property="principal"/>--%>
                                                    <%--                                                            <%=principal.getUsername() == null ? "": principal.getUsername()%></li>--%>
                                                    <sec:authentication
                                                            property="principal.phone"></sec:authentication>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="ec-vendor-detail-block ec-vendor-block-address mar-b-30">
                                                <h6>Address<a href="javasript:void(0)" data-link-action="editmodal"
                                                              title="Edit Detail" data-bs-toggle="modal"
                                                              data-bs-target="#edit_modal"><img
                                                        src="/user/assets/images/icons/edit.svg"
                                                        class="svg_img pro_svg" alt="edit"/></a></h6>
                                                <ul>
                                                    <li><strong>Home: </strong><sec:authentication
                                                            property="principal.address"></sec:authentication>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <%--                                        <div class="col-md-6 col-sm-12">--%>
                                        <%--                                            <div class="ec-vendor-detail-block ec-vendor-block-address">--%>
                                        <%--                                                <h6>Shipping Address<a href="javasript:void(0)"--%>
                                        <%--                                                                       data-link-action="editmodal" title="Edit Detail"--%>
                                        <%--                                                                       data-bs-toggle="modal"--%>
                                        <%--                                                                       data-bs-target="#edit_modal"><img--%>
                                        <%--                                                        src="/user/assets/images/icons/edit.svg"--%>
                                        <%--                                                        class="svg_img pro_svg" alt="edit"/></a></h6>--%>
                                        <%--                                                <ul>--%>
                                        <%--                                                    <li><strong>Office : </strong>123, 2150 Sycamore Street, dummy text--%>
                                        <%--                                                        of--%>
                                        <%--                                                        the, San Jose, California - 95131.--%>
                                        <%--                                                    </li>--%>
                                        <%--                                                </ul>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End User profile section -->

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
                                    <form id="ec-newsletter-form" name="ec-newsletter-form" method="post"
                                          action="#">
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

<!-- Modal -->
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <p style="color: red">${message}</p>
                    <f:form method="post" action="/ekka/update" cssClass="row g-3" modelAttribute="userDto" enctype="multipart/form-data">
                        <div class="ec-vendor-block-img space-bottom-30">
                            <div class="ec-vendor-block-bg cover-upload">
                                <div class="thumb-upload">
                                    <div class="thumb-edit">
                                        <f:input type="file" accept="image/*" id="thumbUpload01" cssClass="ec-image-upload" path="fileImageBackground" placeholder="Chọn file" aria-label="Ảnh đại diện"/>

                                    <%--                                        <input type='file' id="thumbUpload01" class="ec-image-upload"--%>
<%--                                               accept=".png, .jpg, .jpeg"/>--%>
                                        <label><img src="/user/assets/images/icons/edit.svg"
                                                    class="svg_img header_svg" alt="edit"/></label>
                                    </div>
                                    <div class="thumb-preview ec-preview">
                                        <div class="image-thumb-preview">
                                            <img class="image-thumb-preview ec-image-preview v-img"
                                                 src="<sec:authentication property="principal.background_profile"></sec:authentication>" alt="edit"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ec-vendor-block-detail">
                                <div class="thumb-upload">
                                    <div class="thumb-edit">
                                        <f:input type="file" accept="image/*" id="thumbUpload02" cssClass="ec-image-upload" path="fileImage" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
<%--                                        <input type='file' id="thumbUpload02" class="ec-image-upload"--%>
<%--                                               accept=".png, .jpg, .jpeg"/>--%>
                                        <label><img src="/user/assets/images/icons/edit.svg"
                                                    class="svg_img header_svg" alt="edit"/></label>
                                    </div>
                                    <div class="thumb-preview ec-preview">
                                        <div class="image-thumb-preview">
                                                <%--                                        <f:input type="text" path="avater" id="inputImage" class="form-control"--%>
                                                <%--                                                 placeholder="Enter your first name" aria-label="Enter your first name"--%>
                                                <%--                                                 required="required"/>--%>
                                            <img id="fileImage" style="object-fit: cover;" class="image-thumb-preview ec-image-preview v-img"
                                                 src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                                 alt="edit"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ec-vendor-upload-detail">
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">User Name*</label>
                                    <f:input type="text" path="fullName" class="form-control"
                                             placeholder="Enter your full name" aria-label="Enter your full name"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Email*</label>
                                    <f:input type="text" path="email" class="form-control"
                                             placeholder="Enter your email" aria-label="Enter your Email"
                                             required="required" readonly="true"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Phone</label>
                                    <f:input type="text" path="phone" class="form-control"
                                             placeholder="Enter your phone" aria-label="Enter your phone" maxlength="15" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <label class="form-label">Address*</label>
                                    <f:input type="text" path="address" class="form-control"
                                             placeholder="Enter your address" aria-label="Enter your address"
                                             required="required"/>
                                </div>
                                <div class="col-md-12 space-t-15">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    <a href="#" class="btn btn-lg btn-secondary qty_close" data-bs-dismiss="modal"
                                       aria-label="Close">Close</a>
                                </div>
                            </div>
                        </div>
                    </f:form>>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->

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

<%--script start--%>

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

<%--script end--%>

</body>
<%--body end--%>
</html>