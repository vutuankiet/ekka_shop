<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin Dashboard eCommerce HTML Template.</title>

    <%@include file="/WEB-INF/views/layout/admin/assets.jsp" %>


</head>

<body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light" id="body">

<!--  WRAPPER  -->
<div class="wrapper">

    <!-- LEFT MAIN SIDEBAR -->
    <%@include file="/WEB-INF/views/layout/admin/sidebar.jsp" %>

    <!--  PAGE WRAPPER -->
    <div class="ec-page-wrapper">

        <!-- Header -->
        <%@include file="/WEB-INF/views/layout/admin/navbar.jsp" %>


        <!-- CONTENT WRAPPER -->
        <div class="ec-content-wrapper">
            <div class="content">
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Product</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin/product">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Product</p>
                    </div>
                    <div>
                        <a href="/ekka/admin/product/create" class="btn btn-primary"> Add Porduct</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table"
                                           style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Name</th>
                                            <th>Price ($)</th>
                                            <th>Discount (%)</th>
                                            <th>Brand</th>
                                            <th>Category</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listProduct}" var="product">
                                            <tr>
                                                <td>
                                                            <img style="object-fit: cover;" class="tbl-thumb"
                                                                 src="${product.productImage}"
                                                                 alt="user profile"/>


                                                </td>
                                                <td>${product.productName}</td>
                                                <td>${product.priceProduct}</td>
                                                <td>${product.discount == null ? "(null)" : product.discount}</td>
                                                <td>${product.brand.nameBrand}</td>
                                                <td>${product.category.categoryName}
                                                    (${product.category.genderCategory.genderCategoryName})
                                                </td>
                                                <c:if test="${product.state == 1}">
                                                    <td style="color: #34c997!important;">
                                                        ACTIVE
                                                    </td>
                                                </c:if>
                                                <c:if test="${product.state == 0}">
                                                    <td style="color: #ec4a58!important;">
                                                        BLOCK
                                                    </td>
                                                </c:if>

                                                <td>${product.updated_at}</td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                            <%--                                                        <button type="button"--%>
                                                            <%--                                                                class="btn btn-outline-success"--%>
                                                            <%--                                                                data-bs-toggle="modal"--%>
                                                            <%--                                                                data-bs-target="#infoUser-${product.id}">Info--%>
                                                            <%--                                                        </button>--%>
                                                        <a style="padding: 3px 10px;" class="btn btn-outline-success" href="/ekka/admin/product/details/${product.id}">Info</a>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Info</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item"
                                                               href="/ekka/admin/product/edit/${product.id}">Edit</a>
                                                            <c:if test="${product.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/product/delete/${product.id}"
                                                                        modelAttribute="productDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Delete
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${product.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/product/restore/${product.id}"
                                                                        modelAttribute="productDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Restore
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Info User Modal -->
                                            <%--                                            <div class="modal fade modal-add-contact" id="infoUser-${product.id}"--%>
                                            <%--                                                 tabindex="-1"--%>
                                            <%--                                                 role="dialog"--%>
                                            <%--                                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
                                            <%--                                                <div class="modal-dialog modal-dialog-centered modal-lg"--%>
                                            <%--                                                     role="document">--%>
                                            <%--                                                    <div class="modal-content">--%>
                                            <%--                                                        <div class="row">--%>
                                            <%--                                                            <div class="col-12">--%>
                                            <%--                                                                <div class="card card-default">--%>
                                            <%--                                                                    <div class="card-header card-header-border-bottom">--%>
                                            <%--                                                                        <h2>Product Detail</h2>--%>
                                            <%--                                                                    </div>--%>

                                            <%--                                                                    <div class="card-body product-detail">--%>
                                            <%--                                                                        <div class="row">--%>
                                            <%--                                                                            <div class="col-xl-6 col-lg-6">--%>
                                            <%--                                                                                <div class="row">--%>
                                            <%--                                                                                    <div class="single-pro-img">--%>
                                            <%--                                                                                        <div class="single-product-scroll">--%>
                                            <%--                                                                                            <div class="single-product-cover">--%>
                                            <%--                                                                                                <c:forEach items="${listProductImage}" var="productImage">--%>
                                            <%--                                                                                                    <c:if test="${product.id == productImage.product.id}">--%>
                                            <%--                                                                                                        <div class="single-slide zoom-image-hover">--%>
                                            <%--                                                                                                            <img class="img-responsive"--%>
                                            <%--                                                                                                                 src="${productImage.image}"--%>
                                            <%--                                                                                                                 alt="">--%>
                                            <%--                                                                                                        </div>--%>
                                            <%--                                                                                                    </c:if>--%>

                                            <%--                                                                                                </c:forEach>--%>

                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                            <div class="single-nav-thumb">--%>
                                            <%--                                                                                                <c:forEach items="${listProductImage}" var="productImage">--%>
                                            <%--                                                                                                    <c:if test="${product.id == productImage.product.id}">--%>
                                            <%--                                                                                                        <div class="single-slide">--%>
                                            <%--                                                                                                            <img class="img-responsive"--%>
                                            <%--                                                                                                                 src="${productImage.image}"--%>
                                            <%--                                                                                                                 alt="">--%>
                                            <%--                                                                                                        </div>--%>
                                            <%--                                                                                                    </c:if>--%>

                                            <%--                                                                                                </c:forEach>--%>
                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                        </div>--%>
                                            <%--                                                                                    </div>--%>
                                            <%--                                                                                </div>--%>
                                            <%--                                                                            </div>--%>
                                            <%--                                                                            <div class="col-xl-6 col-lg-6">--%>
                                            <%--                                                                                <div class="row product-overview">--%>
                                            <%--                                                                                    <div class="col-12">--%>
                                            <%--                                                                                        <h5 class="product-title">Pure--%>
                                            <%--                                                                                            Leather Purse for Woman</h5>--%>
                                            <%--                                                                                        <p class="product-rate">--%>
                                            <%--                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                            <i class="mdi mdi-star"></i>--%>
                                            <%--                                                                                        </p>--%>
                                            <%--                                                                                        <p class="product-desc">Lorem--%>
                                            <%--                                                                                            Ipsum is simply dummy text--%>
                                            <%--                                                                                            of the--%>
                                            <%--                                                                                            printing and typesetting--%>
                                            <%--                                                                                            industry. Lorem Ipsum has--%>
                                            <%--                                                                                            been the--%>
                                            <%--                                                                                            industry's standard dummy--%>
                                            <%--                                                                                            text ever since the--%>
                                            <%--                                                                                            1990.</p>--%>
                                            <%--                                                                                        <p class="product-desc">Lorem--%>
                                            <%--                                                                                            Ipsum is simply dummy text--%>
                                            <%--                                                                                            of the--%>
                                            <%--                                                                                            printing and typesetting--%>
                                            <%--                                                                                            industry. Lorem Ipsum has--%>
                                            <%--                                                                                            been the--%>
                                            <%--                                                                                            industry's standard dummy--%>
                                            <%--                                                                                            text ever since the 1990.--%>
                                            <%--                                                                                            Lorem Ipsum--%>
                                            <%--                                                                                            is simply dummy text of the--%>
                                            <%--                                                                                            printing and typesetting--%>
                                            <%--                                                                                            industry.--%>
                                            <%--                                                                                        </p>--%>
                                            <%--                                                                                        <div class="ec-ofr">--%>
                                            <%--                                                                                            <h6>Available offers</h6>--%>
                                            <%--                                                                                            <ul>--%>
                                            <%--                                                                                                <li><b>Special Price--%>
                                            <%--                                                                                                    :</b> Get extra 16%--%>
                                            <%--                                                                                                    off (price--%>
                                            <%--                                                                                                    inclusive of--%>
                                            <%--                                                                                                    discount) <a--%>
                                            <%--                                                                                                            href="#">T&C</a>--%>
                                            <%--                                                                                                </li>--%>
                                            <%--                                                                                                <li><b>Bank Offer :</b>--%>
                                            <%--                                                                                                    10% off on XYZ Bank--%>
                                            <%--                                                                                                    Cards, up to--%>
                                            <%--                                                                                                    $12. On orders of--%>
                                            <%--                                                                                                    $200 and above <a--%>
                                            <%--                                                                                                            href="#">T&C</a>--%>
                                            <%--                                                                                                </li>--%>
                                            <%--                                                                                                <li><b>Bank Offer :</b>--%>
                                            <%--                                                                                                    5% Unlimited--%>
                                            <%--                                                                                                    Cashback on Ekka XYZ--%>
                                            <%--                                                                                                    Bank Credit Card <a--%>
                                            <%--                                                                                                            href="#">T&C</a>--%>
                                            <%--                                                                                                </li>--%>
                                            <%--                                                                                                <li><b>Bank Offer :</b>--%>
                                            <%--                                                                                                    Flat $50 off on--%>
                                            <%--                                                                                                    first Ekka Pay Later--%>
                                            <%--                                                                                                    order of $200 and--%>
                                            <%--                                                                                                    above <a href="#">T&C</a>--%>
                                            <%--                                                                                                </li>--%>
                                            <%--                                                                                            </ul>--%>
                                            <%--                                                                                        </div>--%>
                                            <%--                                                                                        <p class="product-price">Price:--%>
                                            <%--                                                                                            $120</p>--%>
                                            <%--                                                                                        <p class="product-sku">SKU#:--%>
                                            <%--                                                                                            WH12</p>--%>
                                            <%--                                                                                        <ul class="product-size">--%>
                                            <%--                                                                                            <li class="size">--%>
                                            <%--                                                                                                <span>S</span></li>--%>
                                            <%--                                                                                            <li class="size">--%>
                                            <%--                                                                                                <span>M</span></li>--%>
                                            <%--                                                                                            <li class="size">--%>
                                            <%--                                                                                                <span>L</span></li>--%>
                                            <%--                                                                                            <li class="size">--%>
                                            <%--                                                                                                <span>XL</span></li>--%>
                                            <%--                                                                                        </ul>--%>
                                            <%--                                                                                        <ul class="product-color">--%>
                                            <%--                                                                                            <li class="color"><span--%>
                                            <%--                                                                                                    style="background-color:#90cdf7;"></span>--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li class="color"><span--%>
                                            <%--                                                                                                    style="background-color:#ff3b66;"></span>--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li class="color"><span--%>
                                            <%--                                                                                                    style="background-color:#ffc476;"></span>--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li class="color"><span--%>
                                            <%--                                                                                                    style="background-color:#1af0ba;"></span>--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li class="color"><span--%>
                                            <%--                                                                                                    style="background-color:#f887d6;"></span>--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                        </ul>--%>

                                            <%--                                                                                        <div class="product-stock">--%>
                                            <%--                                                                                            <div class="stock">--%>
                                            <%--                                                                                                <p class="title">--%>
                                            <%--                                                                                                    Available</p>--%>
                                            <%--                                                                                                <p class="text">180</p>--%>
                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                            <div class="stock">--%>
                                            <%--                                                                                                <p class="title">--%>
                                            <%--                                                                                                    Pending</p>--%>
                                            <%--                                                                                                <p class="text">50</p>--%>
                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                            <div class="stock">--%>
                                            <%--                                                                                                <p class="title">--%>
                                            <%--                                                                                                    InOrder</p>--%>
                                            <%--                                                                                                <p class="text">20</p>--%>
                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                        </div>--%>
                                            <%--                                                                                    </div>--%>
                                            <%--                                                                                </div>--%>
                                            <%--                                                                            </div>--%>
                                            <%--                                                                        </div>--%>

                                            <%--                                                                        <div class="row review-rating mt-4">--%>
                                            <%--                                                                            <div class="col-12">--%>
                                            <%--                                                                                <ul class="nav nav-tabs"--%>
                                            <%--                                                                                    id="myRatingTab" role="tablist">--%>
                                            <%--                                                                                    <li class="nav-item">--%>
                                            <%--                                                                                        <a class="nav-link active"--%>
                                            <%--                                                                                           id="product-detail-tab"--%>
                                            <%--                                                                                           data-bs-toggle="tab"--%>
                                            <%--                                                                                           data-bs-target="#productdetail"--%>
                                            <%--                                                                                           href="#productdetail"--%>
                                            <%--                                                                                           role="tab"--%>
                                            <%--                                                                                           aria-selected="true">--%>
                                            <%--                                                                                            <i class="mdi mdi-library-books mr-1"></i>--%>
                                            <%--                                                                                            Detail</a>--%>
                                            <%--                                                                                    </li>--%>

                                            <%--                                                                                    <li class="nav-item">--%>
                                            <%--                                                                                        <a class="nav-link"--%>
                                            <%--                                                                                           id="product-information-tab"--%>
                                            <%--                                                                                           data-bs-toggle="tab"--%>
                                            <%--                                                                                           data-bs-target="#productinformation"--%>
                                            <%--                                                                                           href="#productinformation"--%>
                                            <%--                                                                                           role="tab"--%>
                                            <%--                                                                                           aria-selected="false">--%>
                                            <%--                                                                                            <i class="mdi mdi-information mr-1"></i>Info</a>--%>
                                            <%--                                                                                    </li>--%>

                                            <%--                                                                                    <li class="nav-item">--%>
                                            <%--                                                                                        <a class="nav-link"--%>
                                            <%--                                                                                           id="product-reviews-tab"--%>
                                            <%--                                                                                           data-bs-toggle="tab"--%>
                                            <%--                                                                                           data-bs-target="#productreviews"--%>
                                            <%--                                                                                           href="#productreviews"--%>
                                            <%--                                                                                           role="tab"--%>
                                            <%--                                                                                           aria-selected="false">--%>
                                            <%--                                                                                            <i class="mdi mdi-star-half mr-1"></i>--%>
                                            <%--                                                                                            Reviews</a>--%>
                                            <%--                                                                                    </li>--%>
                                            <%--                                                                                </ul>--%>
                                            <%--                                                                                <div class="tab-content"--%>
                                            <%--                                                                                     id="myTabContent2">--%>
                                            <%--                                                                                    <div class="tab-pane pt-3 fade show active"--%>
                                            <%--                                                                                         id="productdetail"--%>
                                            <%--                                                                                         role="tabpanel">--%>
                                            <%--                                                                                        <p>Lorem Ipsum is simply dummy--%>
                                            <%--                                                                                            text of the printing and--%>
                                            <%--                                                                                            typesetting--%>
                                            <%--                                                                                            industry.--%>
                                            <%--                                                                                            Lorem Ipsum has been the--%>
                                            <%--                                                                                            industry's standard dummy--%>
                                            <%--                                                                                            text ever--%>
                                            <%--                                                                                            since the--%>
                                            <%--                                                                                            1500s, when an unknown--%>
                                            <%--                                                                                            printer took a galley of--%>
                                            <%--                                                                                            type and--%>
                                            <%--                                                                                            scrambled it to--%>
                                            <%--                                                                                            make a type specimen book.--%>
                                            <%--                                                                                            It has survived not only--%>
                                            <%--                                                                                            five--%>
                                            <%--                                                                                            centuries, but also--%>
                                            <%--                                                                                            the leap into electronic--%>
                                            <%--                                                                                            typesetting, remaining--%>
                                            <%--                                                                                            essentially--%>
                                            <%--                                                                                            unchanged.--%>
                                            <%--                                                                                        </p>--%>
                                            <%--                                                                                        <ul class="features">--%>
                                            <%--                                                                                            <li>Any Product types that--%>
                                            <%--                                                                                                You want - Simple,--%>
                                            <%--                                                                                                Configurable--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li>Downloadable/Digital--%>
                                            <%--                                                                                                Products, Virtual--%>
                                            <%--                                                                                                Products--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li>Inventory Management--%>
                                            <%--                                                                                                with Backordered items--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li>Flatlock seams--%>
                                            <%--                                                                                                throughout.--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                        </ul>--%>
                                            <%--                                                                                    </div>--%>

                                            <%--                                                                                    <div class="tab-pane pt-3 fade"--%>
                                            <%--                                                                                         id="productinformation"--%>
                                            <%--                                                                                         role="tabpanel">--%>
                                            <%--                                                                                        <ul>--%>
                                            <%--                                                                                            <li><span>Weight</span> 1000--%>
                                            <%--                                                                                                g--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li><span>Dimensions</span>--%>
                                            <%--                                                                                                35 × 30 × 7 cm--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                            <li><span>Color</span>--%>
                                            <%--                                                                                                Black, Pink, Red, White--%>
                                            <%--                                                                                            </li>--%>
                                            <%--                                                                                        </ul>--%>
                                            <%--                                                                                    </div>--%>

                                            <%--                                                                                    <div class="tab-pane pt-3 fade"--%>
                                            <%--                                                                                         id="productreviews"--%>
                                            <%--                                                                                         role="tabpanel">--%>
                                            <%--                                                                                        <div class="ec-t-review-wrapper">--%>
                                            <%--                                                                                            <div class="ec-t-review-item">--%>
                                            <%--                                                                                                <div class="ec-t-review-avtar">--%>
                                            <%--                                                                                                    <img src="assets/img/review-image/1.jpg"--%>
                                            <%--                                                                                                         alt="">--%>
                                            <%--                                                                                                </div>--%>
                                            <%--                                                                                                <div class="ec-t-review-content">--%>
                                            <%--                                                                                                    <div class="ec-t-review-top">--%>
                                            <%--                                                                                                        <p class="ec-t-review-name">--%>
                                            <%--                                                                                                            Jeny Doe</p>--%>
                                            <%--                                                                                                        <div class="ec-t-rate">--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star"></i>--%>
                                            <%--                                                                                                        </div>--%>
                                            <%--                                                                                                    </div>--%>
                                            <%--                                                                                                    <div class="ec-t-review-bottom">--%>
                                            <%--                                                                                                        <p>Lorem Ipsum--%>
                                            <%--                                                                                                            is simply--%>
                                            <%--                                                                                                            dummy text--%>
                                            <%--                                                                                                            of the--%>
                                            <%--                                                                                                            printing--%>
                                            <%--                                                                                                            and--%>
                                            <%--                                                                                                            typesetting--%>
                                            <%--                                                                                                            industry.--%>
                                            <%--                                                                                                        </p>--%>
                                            <%--                                                                                                    </div>--%>
                                            <%--                                                                                                </div>--%>
                                            <%--                                                                                            </div>--%>
                                            <%--                                                                                            <div class="ec-t-review-item">--%>
                                            <%--                                                                                                <div class="ec-t-review-avtar">--%>
                                            <%--                                                                                                    <img src="assets/img/review-image/2.jpg"--%>
                                            <%--                                                                                                         alt="">--%>
                                            <%--                                                                                                </div>--%>
                                            <%--                                                                                                <div class="ec-t-review-content">--%>
                                            <%--                                                                                                    <div class="ec-t-review-top">--%>
                                            <%--                                                                                                        <p class="ec-t-review-name">--%>
                                            <%--                                                                                                            Linda--%>
                                            <%--                                                                                                            Morgus</p>--%>
                                            <%--                                                                                                        <div class="ec-t-rate">--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star is-rated"></i>--%>
                                            <%--                                                                                                            <i class="mdi mdi-star"></i>--%>
                                            <%--                                                                                                        </div>--%>
                                            <%--                                                                                                    </div>--%>
                                            <%--                                                                                                    <div class="ec-t-review-bottom">--%>
                                            <%--                                                                                                        <p>Lorem Ipsum--%>
                                            <%--                                                                                                            is simply--%>
                                            <%--                                                                                                            dummy text--%>
                                            <%--                                                                                                            of the--%>
                                            <%--                                                                                                            printing--%>
                                            <%--                                                                                                            and--%>
                                            <%--                                                                                                            typesetting--%>
                                            <%--                                                                                                            industry.--%>
                                            <%--                                                                                                        </p>--%>
                                            <%--                                                                                                    </div>--%>
                                            <%--                                                                                                </div>--%>
                                            <%--                                                                                            </div>--%>

                                            <%--                                                                                        </div>--%>
                                            <%--                                                                                    </div>--%>
                                            <%--                                                                                </div>--%>
                                            <%--                                                                            </div>--%>
                                            <%--                                                                        </div>--%>
                                            <%--                                                                    </div>--%>
                                            <%--                                                                </div>--%>
                                            <%--                                                            </div>--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                        <div class="modal-footer px-4">--%>
                                            <%--                                                            <button type="button" class="btn btn-secondary btn-pill"--%>
                                            <%--                                                                    data-bs-dismiss="modal">Cancel--%>
                                            <%--                                                            </button>--%>
                                            <%--                                                            <a href="/ekka/admin/user/details/${user.id}">--%>
                                            <%--                                                                <button class="btn btn-primary btn-pill">Edit--%>
                                            <%--                                                                </button>--%>
                                            <%--                                                            </a>--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                    </div>--%>
                                            <%--                                                </div>--%>
                                            <%--                                            </div>--%>
                                        </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End Content -->
        </div> <!-- End Content Wrapper -->

        <!-- Footer -->
        <%@include file="/WEB-INF/views/layout/admin/foot.jsp" %>


    </div> <!-- End Page Wrapper -->
</div> <!-- End Wrapper -->

<%@include file="/WEB-INF/views/layout/admin/scripts.jsp" %>
<script>
    function ChangeValueColor(e, target) {
        // console.log(e.previousElementSibling);
        // let color1 = document.querySelector(`.color1`);
        let checkboxColor1 = document.querySelector(target);
        checkboxColor1.setAttribute("value", e.value);
    }
</script>
</body>
</html>
