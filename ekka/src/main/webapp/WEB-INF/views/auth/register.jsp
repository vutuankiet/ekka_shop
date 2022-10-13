<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/layout/user/head.jsp" %>
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
                            src="assets/images/product-image/6_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">T-shirt For Women</a>
                        <span class="cart-price"><span>$76.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1"/>
                        </div>
                        <a href="javascript:void(0)" class="remove">×</a>
                    </div>
                </li>
                <li>
                    <a href="product-detail.html" class="sidekka_pro_img"><img
                            src="assets/images/product-image/12_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">Women Leather Shoes</a>
                        <span class="cart-price"><span>$64.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1"/>
                        </div>
                        <a href="javascript:void(0)" class="remove">×</a>
                    </div>
                </li>
                <li>
                    <a href="product-detail.html" class="sidekka_pro_img"><img
                            src="assets/images/product-image/3_1.jpg" alt="product"></a>
                    <div class="ec-pro-content">
                        <a href="product-detail.html" class="cart_pro_title">Girls Nylon Purse</a>
                        <span class="cart-price"><span>$59.00</span> x 1</span>
                        <div class="qty-plus-minus">
                            <input class="qty-input" type="text" name="ec_qtybtn" value="1"/>
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

<!-- Ec breadcrumb start -->
<div class="sticky-header-next-sec  ec-breadcrumb section-space-mb">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row ec_breadcrumb_inner">
                    <div class="col-md-6 col-sm-12">
                        <h2 class="ec-breadcrumb-title">Login</h2>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <!-- ec-breadcrumb-list start -->
                        <ul class="ec-breadcrumb-list">
                            <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="ec-breadcrumb-item active">Login</li>
                        </ul>
                        <!-- ec-breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ec breadcrumb end -->

<!-- Start Register -->
<section class="ec-page-content section-space-p">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Register</h2>
                    <h2 class="ec-title">Register</h2>
                    <p class="sub-title mb-3">Best place to buy and sell digital products</p>
                </div>
            </div>
            <div class="ec-register-wrapper">
                <div class="ec-register-container">
                    <div class="ec-register-form">
                        <p style="color: red">${message}</p>
                        <p style="color: red">${messageEmail}</p>
                        <f:form method="post" action="/ekka/save" modelAttribute="userDto"
                                enctype="multipart/form-data">
                            <span class="ec-register-wrap ec-register-half">
                                <label>User Name*</label>
                                <f:input type="text" path="fullName" class="form-control"
                                         placeholder="Enter your first name" aria-label="Enter your first name"
                                         required="required"/>
                            </span>
                                <span class="ec-register-wrap ec-register-half">
                                <label>Email*</label>
                                <f:input type="email" class="form-control" path="email" placeholder="Email"
                                         aria-label="Email" required="required"/>
                                <f:errors path="email" cssClass="error"></f:errors>
                            </span>
                                <span class="ec-register-wrap ec-register-half">
                                <label>Password*</label>
                                    <f:input type="password" class="form-control" path="password" placeholder="Mật khẩu"
                                             aria-label="Mật khẩu"/>
                                    <f:errors path="password" cssClass="error"></f:errors>
                            </span>
                                <span class="ec-register-wrap ec-register-half">
                                <label>Confirm Password*</label>
                                    <f:input type="password" path="rePassword" class="form-control"
                                             placeholder="Nhập lại mật khẩu" aria-label="Nhập lại mật khẩu"/>
                                    <f:errors path="rePassword" cssClass="error"></f:errors>
                            </span>

                                    <%--                                <span class="ec-register-wrap ec-recaptcha">--%>
                                    <%--                                    <span class="g-recaptcha" data-sitekey="6LfKURIUAAAAAO50vlwWZkyK_G2ywqE52NU7YO0S"--%>
                                    <%--                                          data-callback="verifyRecaptchaCallback"--%>
                                    <%--                                          data-expired-callback="expiredRecaptchaCallback"></span>--%>
                                    <%--                                    <input class="form-control d-none" data-recaptcha="true" required--%>
                                    <%--                                           data-error="Please complete the Captcha">--%>
                                    <%--                                    <span class="help-block with-errors"></span>--%>
                                    <%--                                </span>--%>
                                <span class="ec-register-wrap ec-register-btn">
                                    <button class="btn btn-primary" type="submit">Register</button>
                                </span>
                        </f:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Register -->
<%@include file="/WEB-INF/views/layout/user/foot.jsp" %>