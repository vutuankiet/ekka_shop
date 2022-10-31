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
    <title>Ekka | Home.</title>

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

<!-- Category Sidebar start -->
<div class="ec-side-cat-overlay"></div>
<!-- ekka Cart Start -->
<div class="ec-side-cart-overlay"></div>
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
                        <h3 class="ec-sidebar-title">Category
                            <button class="ec-close">×</button>
                        </h3>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/dress-8.svg"
                                                                        class="svg_img" alt="drink"/>Cothes
                                </div>
                                <ul style="display: block;">
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Shirt
                                            <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">shorts &
                                            jeans <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a
                                                href="shop-left-sidebar-col-3.html">jacket<span title="Available Stock">- 500</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">dress &
                                            frock <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/shoes-8.svg"
                                                                        class="svg_img" alt="drink"/>Footwear
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sports
                                            <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Formal
                                            <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Casual
                                            <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">safety
                                            shoes <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/jewelry-8.svg"
                                                                        class="svg_img" alt="drink"/>jewelry
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Earrings
                                            <span title="Available Stock">- 50</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Couple
                                            Rings <span title="Available Stock">- 35</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Necklace
                                            <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/perfume-8.svg"
                                                                        class="svg_img" alt="drink"/>perfume
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Clothes
                                            perfume<span title="Available Stock">- 4 pcs</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">deodorant
                                            <span title="Available Stock">- 52 pcs</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Flower
                                            fragrance <span title="Available Stock">- 10 pack</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Air
                                            Freshener<span title="Available Stock">- 35 pack</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/cosmetics-8.svg"
                                                                        class="svg_img" alt="drink"/>cosmetics
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a
                                                href="shop-left-sidebar-col-3.html">shampoo<span
                                                title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sunscreen<span
                                                title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">body
                                            wash<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">makeup
                                            kit<span title="Available Stock"></span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/glasses-8.svg"
                                                                        class="svg_img" alt="drink"/>glasses
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Sunglasses
                                            <span title="Available Stock">- 20</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Lenses
                                            <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="ec-sb-block-content">
                        <ul>
                            <li>
                                <div class="ec-sidebar-block-item"><img src="/user/assets/images/icons/bag-8.svg"
                                                                        class="svg_img" alt="drink"/>bags
                                </div>
                                <ul>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">shopping
                                            bag <span title="Available Stock">- 25</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">Gym
                                            backpack <span title="Available Stock">- 52</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">purse
                                            <span title="Available Stock">- 40</span></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="ec-sidebar-sub-item"><a href="shop-left-sidebar-col-3.html">wallet
                                            <span title="Available Stock">- 35</span></a>
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
                                src="/user/assets/images/product-image/1.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/2.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/3.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/4.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/5.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/6.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/7.jpg" alt="product"/></a>
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
                                src="/user/assets/images/product-image/2.jpg" alt="product"/></a>
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

<!-- Main Slider Start -->
<div class="sticky-header-next-sec ec-main-slider section section-space-pb">
    <div class="ec-slider swiper-container main-slider-nav main-slider-dot">
        <!-- Main slider -->
        <div class="swiper-wrapper">
            <div class="ec-slide-item swiper-slide d-flex ec-slide-1">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center">
                            <div class="ec-slide-content slider-animation">
                                <h1 class="ec-slide-title">New Fashion Collection</h1>
                                <h2 class="ec-slide-stitle">Sale Offer</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do</p>
                                <a href="#" class="btn btn-lg btn-secondary">Order Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ec-slide-item swiper-slide d-flex ec-slide-2">
                <div class="container align-self-center">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center">
                            <div class="ec-slide-content slider-animation">
                                <h1 class="ec-slide-title">Boat Headphone Sets</h1>
                                <h2 class="ec-slide-stitle">Sale Offer</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do</p>
                                <a href="#" class="btn btn-lg btn-secondary">Order Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-pagination swiper-pagination-white"></div>
        <div class="swiper-buttons">
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
</div>
<!-- Main Slider End -->

<!-- Product tab Area Start -->
<section class="section ec-product-tab section-space-p" id="collection">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Our Top Collection</h2>
                    <h2 class="ec-title">Our Top Collection</h2>
                    <p class="sub-title">Browse The Collection of Top Products</p>
                </div>
            </div>

            <!-- Tab Start -->
            <div class="col-md-12 text-center">
                <ul class="ec-pro-tab-nav nav justify-content-center">
                    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#tab-pro-for-all">For
                        All</a></li>
                    <c:forEach items="${listGenderCategory}" var="genderCategory">
                        <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                                                href="#tab-pro-for-${genderCategory.id}">For
                                ${genderCategory.genderCategoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <!-- Tab End -->
        </div>
        <div class="row">
            <div class="col">
                <div class="tab-content">
                    <!-- 1st Product tab start -->
                    <div class="tab-pane fade show active" id="tab-pro-for-all">
                        <div class="row">
                            <!-- Product Content -->
                            <c:forEach items="${list.data}" var="product">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6  ec-product-content"
                                     data-animation="fadeIn">
                                    <div class="ec-product-inner">
                                        <div class="ec-pro-image-outer">
                                            <div class="ec-pro-image">
                                                <a href="product-detail.html" class="image">
                                                    <img class="main-image"
                                                         src="${product.productImage}" style="height: 355px;"
                                                         alt="Product"/>
                                                    <img class="hover-image"
                                                         src="${product.productImage}" style="height: 355px;"
                                                         alt="Product"/>
                                                </a>
                                                <c:if test="${product.discount > 0}">
                                                    <span class="percentage">${product.discount}%</span>
                                                </c:if>
                                                <a href="/ekka/product-details/${product.id}" class="quickview"
                                                   data-link-action="quickview"
                                                   title="Quick view"><img
                                                        src="/user/assets/images/icons/quickview.svg"
                                                        class="svg_img pro_svg"
                                                        alt=""/></a>
                                                <div class="ec-pro-actions">
                                                    <c:if test="${product.totalProduct <= 0}">
                                                        <button style="background-color: #555555;" type="button" title="Add To Cart" class="add-to-cart">
                                                            <img style="fill: #FFFFFF;"
                                                                    src="/user/assets/images/icons/cart.svg"
                                                                    class="svg_img pro_svg"
                                                                    alt=""/> Add To Cart
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${product.totalProduct > 0}">
                                                    <f:form method="post"
                                                            action="/ekka/cart/create/${product.id}"
                                                            modelAttribute="urlDto">
                                                        <f:input type="text" path="url" value="${urlDto.url}"
                                                                 cssClass="d-none"/>
                                                        <button type="submit" title="Add To Cart" class="add-to-cart">
                                                            <img
                                                                    src="/user/assets/images/icons/cart.svg"
                                                                    class="svg_img pro_svg"
                                                                    alt=""/> Add To Cart
                                                        </button>
                                                    </f:form>
                                                    <c:forEach items="${listCartUserId}" var="cartUser">
                                                        <c:if test="${product.id == cartUser.product.id}">
                                                            <f:form method="post"
                                                                    action="/ekka/cart/delete/${cartUser.id}"
                                                                    modelAttribute="urlDto">
                                                                <f:input type="text" path="url" value="${urlDto.url}"
                                                                         cssClass="d-none"/>

                                                                <button type="submit" style="background-color: #3575d4;"
                                                                        class="add-to-cart active"
                                                                        title="Cart"><img style="fill: white;"
                                                                                          src="/user/assets/images/icons/cart.svg"
                                                                                          class="svg_img pro_svg"
                                                                                          alt=""/></button>
                                                            </f:form>
                                                        </c:if>
                                                    </c:forEach>
                                                    </c:if>
                                                    <f:form method="post" action="/ekka/wish-list/create/${product.id}"
                                                            modelAttribute="urlDto">
                                                        <f:input type="text" path="url" value="${urlDto.url}"
                                                                 cssClass="d-none"/>
                                                        <button type="submit"
                                                                class="ec-btn-group wishlist"
                                                                title="Wishlist"><img
                                                                src="/user/assets/images/icons/wishlist.svg"
                                                                class="svg_img pro_svg" alt=""/></button>
                                                    </f:form>
                                                    <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                        <c:if test="${product.id == wishListUser.product.id}">
                                                            <f:form method="post"
                                                                    action="/ekka/wish-list/delete/${wishListUser.id}"
                                                                    modelAttribute="urlDto">
                                                                <f:input type="text" path="url" value="${urlDto.url}"
                                                                         cssClass="d-none"/>

                                                                <button type="submit"
                                                                        class="ec-btn-group wishlist active"
                                                                        title="Wishlist"><img
                                                                        src="/user/assets/images/icons/wishlist.svg"
                                                                        class="svg_img pro_svg" alt=""/></button>
                                                            </f:form>
                                                        </c:if>
                                                    </c:forEach>


                                                </div>
                                            </div>
                                        </div>
                                        <div class="ec-pro-content">
                                            <h5 class="ec-pro-title"><a
                                                    href="/ekka/product-details/${product.id}">${product.productName}</a>
                                            </h5>
                                            <div class="ec-pro-rating">
                                                <c:if test="${product.rating <= 0}">
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                    <i class="ecicon eci-star"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 0 && product.rating < 1}">
                                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 1 && product.rating < 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 2 && product.rating < 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 3 && product.rating < 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating > 4 && product.rating < 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                </c:if>

                                                <c:if test="${product.rating == 1}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${product.rating == 2}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>

                                                <c:if test="${product.rating == 3}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating == 4}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star-o"></i>
                                                </c:if>
                                                <c:if test="${product.rating == 5}">
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                    <i class="ecicon eci-star fill"></i>
                                                </c:if>
                                            </div>
                                            <span class="ec-price">
                                                <c:if test="${product.discount > 0}">
                                                    <span class="old-price">$${product.priceProduct}</span>
                                                </c:if>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${product.priceProduct * ((100 - product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                            <div class="ec-pro-option">
                                                <div class="ec-pro-color">
                                                    <span class="ec-pro-opt-label">Color</span>
                                                    <ul class="ec-opt-swatch ec-change-img">
                                                        <c:forEach items="${listProductColor}" var="productColor">
                                                            <c:if test="${productColor.product.id == product.id}">
                                                                <li style="border: 1px solid darkgray;"><a href="#" class="ec-opt-clr-img"
                                                                       data-src="${product.productImage}"
                                                                       data-src-hover="${product.productImage}"
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
                                                            <c:if test="${productSize.product.id == product.id}">
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
                            <%@include file="/WEB-INF/views/layout/user/paging.jsp" %>
                            <div class="col-sm-12 shop-all-btn"><a href="shop-left-sidebar-col-3.html">Shop All
                                Collection</a></div>
                        </div>
                    </div>
                    <!-- ec 1st Product tab end -->
                    <!-- ec 2nd Product tab start -->
                    <c:forEach items="${listGenderCategory}" var="genderCategory">
                        <div class="tab-pane fade" id="tab-pro-for-${genderCategory.id}">
                            <div class="row">
                                <!-- Product Content -->
                                <c:forEach items="${list.data}" var="product">
                                    <c:if test="${genderCategory.id == product.category.genderCategory.id}">
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 mb-6 ec-product-content"
                                             data-animation="fadeIn">
                                            <div class="ec-product-inner">
                                                <div class="ec-pro-image-outer">
                                                    <div class="ec-pro-image">
                                                        <a href="product-detail.html" class="image">
                                                            <img class="main-image"
                                                                 src="${product.productImage}" style="height: 355px;"
                                                                 alt="Product"/>
                                                            <img class="hover-image"
                                                                 src="${product.productImage}" style="height: 355px;"
                                                                 alt="Product"/>
                                                        </a>
                                                        <c:if test="${product.discount > 0}">
                                                            <span class="percentage">${product.discount}%</span>
                                                        </c:if>
                                                        <a href="/ekka/product-details/${product.id}" class="quickview"
                                                           data-link-action="quickview"
                                                           title="Quick view" data-bs-toggle="modal"
                                                           data-bs-target="#ec_quickview_modal"><img
                                                                src="/user/assets/images/icons/quickview.svg"
                                                                class="svg_img pro_svg"
                                                                alt=""/></a>
                                                        <div class="ec-pro-actions">
                                                            <c:if test="${product.totalProduct <= 0}">
                                                                <button style="background-color: #555555;" type="button" title="Add To Cart" class="add-to-cart">
                                                                    <img style="fill: #FFFFFF;"
                                                                         src="/user/assets/images/icons/cart.svg"
                                                                         class="svg_img pro_svg"
                                                                         alt=""/> Add To Cart
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${product.totalProduct > 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/cart/create/${product.id}"
                                                                        modelAttribute="urlDto">
                                                                    <f:input type="text" path="url" value="${urlDto.url}"
                                                                             cssClass="d-none"/>
                                                                    <button type="submit" title="Add To Cart" class="add-to-cart">
                                                                        <img
                                                                                src="/user/assets/images/icons/cart.svg"
                                                                                class="svg_img pro_svg"
                                                                                alt=""/> Add To Cart
                                                                    </button>
                                                                </f:form>
                                                                <c:forEach items="${listCartUserId}" var="cartUser">
                                                                    <c:if test="${product.id == cartUser.product.id}">
                                                                        <f:form method="post"
                                                                                action="/ekka/cart/delete/${cartUser.id}"
                                                                                modelAttribute="urlDto">
                                                                            <f:input type="text" path="url" value="${urlDto.url}"
                                                                                     cssClass="d-none"/>

                                                                            <button type="submit" style="background-color: #3575d4;"
                                                                                    class="add-to-cart active"
                                                                                    title="Cart"><img style="fill: white;"
                                                                                                      src="/user/assets/images/icons/cart.svg"
                                                                                                      class="svg_img pro_svg"
                                                                                                      alt=""/></button>
                                                                        </f:form>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:forEach items="${listCartUserId}" var="cartUser">
                                                                <c:if test="${product.id == cartUser.product.id}">
                                                                    <f:form method="post"
                                                                            action="/ekka/cart/delete/${cartUser.id}"
                                                                            modelAttribute="urlDto">
                                                                        <f:input type="text" path="url"
                                                                                 value="${urlDto.url}"
                                                                                 cssClass="d-none"/>

                                                                        <button type="submit"
                                                                                style="background-color: #3575d4;"
                                                                                class="add-to-cart active"
                                                                                title="Cart"><img style="fill: white;"
                                                                                                  src="/user/assets/images/icons/cart.svg"
                                                                                                  class="svg_img pro_svg"
                                                                                                  alt=""/></button>
                                                                    </f:form>
                                                                </c:if>
                                                            </c:forEach>
                                                            <f:form method="post"
                                                                    action="/ekka/wish-list/create/${product.id}"
                                                                    modelAttribute="urlDto">
                                                                <f:input type="text" path="url" value="${urlDto.url}"
                                                                         cssClass="d-none"/>
                                                                <button type="submit"
                                                                        class="ec-btn-group wishlist"
                                                                        title="Wishlist"><img
                                                                        src="/user/assets/images/icons/wishlist.svg"
                                                                        class="svg_img pro_svg" alt=""/></button>
                                                            </f:form>
                                                            <c:forEach items="${listWishListUserId}" var="wishListUser">
                                                                <c:if test="${product.id == wishListUser.product.id}">
                                                                    <f:form method="post"
                                                                            action="/ekka/wish-list/delete/${wishListUser.id}"
                                                                            modelAttribute="urlDto">
                                                                        <f:input type="text" path="url"
                                                                                 value="${urlDto.url}"
                                                                                 cssClass="d-none"/>

                                                                        <button type="submit"
                                                                                class="ec-btn-group wishlist active"
                                                                                title="Wishlist"><img
                                                                                src="/user/assets/images/icons/wishlist.svg"
                                                                                class="svg_img pro_svg" alt=""/>
                                                                        </button>
                                                                    </f:form>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="ec-pro-content">
                                                    <h5 class="ec-pro-title"><a
                                                            href="product-detail.html">${product.productName}</a>
                                                    </h5>
                                                    <div class="ec-pro-rating">
                                                        <c:if test="${product.rating <= 0}">
                                                            <i class="ecicon eci-star"></i>
                                                            <i class="ecicon eci-star"></i>
                                                            <i class="ecicon eci-star"></i>
                                                            <i class="ecicon eci-star"></i>
                                                            <i class="ecicon eci-star"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating > 0 && product.rating < 1}">
                                                            <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating > 1 && product.rating < 2}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating > 2 && product.rating < 3}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating > 3 && product.rating < 4}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating > 4 && product.rating < 5}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i style="color: #ff6262;opacity: 0.7;" class="ecicon eci-star-half-o"></i>
                                                        </c:if>

                                                        <c:if test="${product.rating == 1}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>

                                                        <c:if test="${product.rating == 2}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>

                                                        <c:if test="${product.rating == 3}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating == 4}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star-o"></i>
                                                        </c:if>
                                                        <c:if test="${product.rating == 5}">
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                            <i class="ecicon eci-star fill"></i>
                                                        </c:if>
                                                    </div>
                                                    <span class="ec-price">
                                                <span class="old-price">$${product.priceProduct}</span>
                                                <span class="new-price">$<fmt:formatNumber maxFractionDigits="2"
                                                                                           value="${product.priceProduct * ((100 - product.discount)/100)}"></fmt:formatNumber></span>
                                            </span>
                                                    <div class="ec-pro-option">
                                                        <div class="ec-pro-color">
                                                            <span class="ec-pro-opt-label">Color</span>
                                                            <ul class="ec-opt-swatch ec-change-img">
                                                                <c:forEach items="${listProductColor}"
                                                                           var="productColor">
                                                                    <c:if test="${productColor.product.id == product.id}">
                                                                        <li style="border: 1px solid darkgray;"><a href="#" class="ec-opt-clr-img"
                                                                               data-src="${product.productImage}"
                                                                               data-src-hover="${product.productImage}"
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
                                                                    <c:if test="${productSize.product.id == product.id}">
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
                                    </c:if>
                                </c:forEach>
                                <%@include file="/WEB-INF/views/layout/user/paging.jsp" %>
                                <div class="col-sm-12 shop-all-btn"><a href="shop-left-sidebar-col-3.html">Shop All
                                    Collection</a></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ec Product tab Area End -->

<!--  services Section Start -->
<section class="section ec-services-section section-space-p" id="services">
    <h2 class="d-none">Services</h2>
    <div class="container">
        <div class="row">
            <div class="ec_ser_content ec_ser_content_1 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_1.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>Free Shipping</h2>
                        <p>Free shipping on all US order or order above $200</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_2 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_2.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>24X7 Support</h2>
                        <p>Contact us 24 hours a day, 7 days a week</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_3 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_3.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>30 Days Return</h2>
                        <p>Simply return it within 30 days for an exchange</p>
                    </div>
                </div>
            </div>
            <div class="ec_ser_content ec_ser_content_4 col-sm-12 col-md-6 col-lg-3" data-animation="zoomIn">
                <div class="ec_ser_inner">
                    <div class="ec-service-image">
                        <img src="/user/assets/images/icons/service_4.svg" class="svg_img" alt=""/>
                    </div>
                    <div class="ec-service-desc">
                        <h2>Payment Secure</h2>
                        <p>Contact us 24 hours a day, 7 days a week</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--services Section End -->

<!--  offer Section Start -->
<section class="section ec-offer-section section-space-p section-space-m">
    <h2 class="d-none">Offer</h2>
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-xl-6 col-lg-7 col-md-7 col-sm-7 align-self-center ec-offer-content">
                <h2 class="ec-offer-title">Sunglasses</h2>
                <h3 class="ec-offer-stitle" data-animation="slideInDown">Super Offer</h3>
                <span class="ec-offer-img" data-animation="zoomIn"><img src="/user/assets/images/offer-image/1.png"
                                                                        alt="offer image"/></span>
                <span class="ec-offer-desc">Acetate Frame Sunglasses</span>
                <span class="ec-offer-price">$40.00 Only</span>
                <a class="btn btn-primary" href="shop-left-sidebar-col-3.html" data-animation="zoomIn">Shop Now</a>
            </div>
        </div>
    </div>
</section>
<!-- offer Section End -->

<!-- ec testmonial Start -->
<section class="section ec-test-section section-space-ptb-100 section-space-m" id="reviews">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title mb-0">
                    <h2 class="ec-bg-title">Testimonial</h2>
                    <h2 class="ec-title">Client Review</h2>
                    <p class="sub-title mb-3">What say client about us</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="ec-test-outer">
                <ul id="ec-testimonial-slider">
                    <li class="ec-test-item">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/1.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                    <li class="ec-test-item ">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/2.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                    <li class="ec-test-item">
                        <img src="/user/assets/images/testimonial/top-quotes.svg" class="svg_img test_svg top" alt=""/>
                        <div class="ec-test-inner">
                            <div class="ec-test-img"><img alt="testimonial" title="testimonial"
                                                          src="/user/assets/images/testimonial/3.jpg"/></div>
                            <div class="ec-test-content">
                                <div class="ec-test-desc">Lorem Ipsum is simply dummy text of the printing and
                                    typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                    ever since the 1500s, when an unknown printer took a galley of type and
                                    scrambled it to make a type specimen
                                </div>
                                <div class="ec-test-name">John Doe</div>
                                <div class="ec-test-designation">General Manager</div>
                                <div class="ec-test-rating">
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                    <i class="ecicon eci-star fill"></i>
                                </div>
                            </div>
                        </div>
                        <img src="/user/assets/images/testimonial/bottom-quotes.svg" class="svg_img test_svg bottom"
                             alt=""/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- ec testmonial end -->

<!-- Ec Brand Section Start -->
<section class="section ec-brand-area section-space-p">
    <h2 class="d-none">Brand</h2>
    <div class="container">
        <div class="row">
            <div class="ec-brand-outer">
                <ul id="ec-brand-slider">
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/1.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/2.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/3.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/4.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/5.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/6.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/7.png"/></a>
                        </div>
                    </li>
                    <li class="ec-brand-item" data-animation="zoomIn">
                        <div class="ec-brand-img"><a href="#"><img alt="brand" title="brand"
                                                                   src="/user/assets/images/brand-image/8.png"/></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- Ec Brand Section End -->

<!-- Ec Instagram Start -->
<section class="section ec-instagram-section module section-space-p" id="insta">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h2 class="ec-bg-title">Instagram Feed</h2>
                    <h2 class="ec-title">Instagram Feed</h2>
                    <p class="sub-title">Share your store with us</p>
                </div>
            </div>
        </div>
    </div>
    <div class="ec-insta-wrapper">
        <div class="ec-insta-outer">
            <div class="container" data-animation="fadeIn">
                <div class="insta-auto">
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/1.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/2.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/3.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/4.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/5.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/6.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                    <!-- instagram item -->
                    <div class="ec-insta-item">
                        <div class="ec-insta-inner">
                            <a href="#" target="_blank"><img src="/user/assets/images/instragram-image/7.jpg"
                                                             alt="insta"></a>
                        </div>
                    </div>
                    <!-- instagram item -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Ec Instagram End -->

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

<!-- Footer navigation panel for responsive display -->
<%@include file="/WEB-INF/views/layout/user/footer.jsp" %>
<!-- Footer navigation panel for responsive display end -->


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