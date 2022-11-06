<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | Product Details.</title>

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
                        <h1>Product Detail</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Product
                        </p>
                    </div>
                    <div>
                        <a href="/ekka/admin/product/edit/${productDto.id}" class="btn btn-primary"> Edit
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Product Detail</h2>
                            </div>

                            <div class="card-body product-detail">
                                <div class="row">
                                    <div class="col-xl-5 col-lg-5">
                                        <div class="row">
                                            <div class="single-pro-img">
                                                <div class="single-product-scroll">
                                                    <div class="single-product-cover">
                                                        <c:forEach items="${listProductImage}" var="productImage">
                                                            <c:if test="${productDto.id == productImage.product.id}">
                                                                <div class="single-slide zoom-image-hover">
                                                                    <img class="img-responsive"
                                                                         src="${productImage.image}" alt="">
                                                                </div>
                                                            </c:if>

                                                        </c:forEach>
                                                    </div>
                                                    <div class="single-nav-thumb">
                                                        <c:forEach items="${listProductImage}" var="productImage">
                                                            <c:if test="${productDto.id == productImage.product.id}">
                                                                <div class="single-slide">
                                                                    <img class="img-responsive"
                                                                         src="${productImage.image}" alt="">
                                                                </div>
                                                            </c:if>

                                                        </c:forEach>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-7 col-lg-7">
                                        <div class="row product-overview">
                                            <div class="col-12">
                                                <h5 class="product-title">${productDto.productName}</h5>
                                                <p class="product-rate">
                                                    <c:if test="${review_rating <= 0}">
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating > 0 && review_rating < 1}">
                                                        <i style="color: #ff6262;opacity: 0.7;"
                                                           class="mdi mdi-star-half is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating > 1 && review_rating < 2}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;"
                                                           class="mdi mdi-star-half is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating > 2 && review_rating < 3}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;"
                                                           class="mdi mdi-star-half is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating > 3 && review_rating < 4}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;"
                                                           class="mdi mdi-star-half is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating > 4 && review_rating < 5}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i style="color: #ff6262;opacity: 0.7;"
                                                           class="mdi mdi-star-half is-rated"></i>
                                                    </c:if>

                                                    <c:if test="${review_rating == 1}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>

                                                    <c:if test="${review_rating == 2}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>

                                                    <c:if test="${review_rating == 3}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating == 4}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star"></i>
                                                    </c:if>
                                                    <c:if test="${review_rating == 5}">
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                        <i class="mdi mdi-star is-rated"></i>
                                                    </c:if>
                                                    (${review_rating} <i class="mdi mdi-star is-rated"></i>) (${countReviewProduct}
                                                    review)
                                                </p>
                                                <p><b>Category</b></p>
                                                <ul class="product-size">
                                                    <c:forEach items="${listCategory}" var="category">
                                                        <c:if test="${category.id == productDto.categoryId}">
                                                            <li class="size"><span>${category.categoryName}</span></li>
                                                            <li class="size">
                                                                <span>${category.genderCategory.genderCategoryName}</span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>

                                                </ul>
                                                <c:if test="${productDto.discount == null}">
                                                    <p class="product-price pb-0">Price: $${productDto.priceProduct}</p>
                                                </c:if>
                                                <c:if test="${productDto.discount != null}">
                                                    <p class="product-price text-decoration-line-through pb-0"
                                                       style="color: #f64400!important;">Price:
                                                        $${productDto.priceProduct}<span class="badge" style="color: #ffffff; background-color: #76b6be; top: -7px; position: relative ; padding: 0.2em 0.3em;">-${productDto.discount}%</span></p>
                                                    <p class="product-price">Price: <span
                                                            style="color: #1d8a5b!important">$<fmt:formatNumber maxFractionDigits="2"
                                                                                                                value="${productDto.priceProduct * ((100 - productDto.discount)/100)}"></fmt:formatNumber></span>
                                                    </p>
                                                </c:if>
                                                <p class="product-sku pb-1">Total: ${productDto.totalProduct}</p>

                                                <p><b>Size :</b></p>
                                                <ul class="product-size">
                                                    <c:forEach items="${listProductSize}" var="productSize">
                                                        <c:if test="${productDto.id == productSize.product.id}">
                                                            <li class="size"><span>${productSize.sizeName}</span></li>
                                                        </c:if>
                                                    </c:forEach>

                                                </ul>
                                                <p><b>Color :</b></p>
                                                <ul class="product-color">
                                                    <c:forEach items="${listProductColor}" var="productColor">
                                                        <c:if test="${productDto.id == productColor.product.id}">
                                                            <li class="color"><span
                                                                    style="background-color:${productColor.colorName};"></span>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                                <p><b>Brand :</b></p>
                                                <ul class="product-size">
                                                    <c:forEach items="${listBrand}" var="brand">
                                                        <c:if test="${brand.id == productDto.brandId}">
                                                            <div class="card card-default" style="width: 100px">
                                                                <div class="card-body text-center" style="padding: 5px">
                                                                    <div class="image mb-3">
                                                                        <img src="${brand.logo}"
                                                                             class="img-fluid rounded-circle"
                                                                             alt="Avatar Image">
                                                                    </div>

                                                                    <li class="card-title text-dark m-auto">${brand.nameBrand}</li>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>

                                                </ul>


                                                <div class="product-stock">
                                                    <div class="stock">
                                                        <p class="title">Available</p>
                                                        <p class="text">180</p>
                                                    </div>
                                                    <div class="stock">
                                                        <p class="title">Pending</p>
                                                        <p class="text">50</p>
                                                    </div>
                                                    <div class="stock">
                                                        <p class="title">InOrder</p>
                                                        <p class="text">20</p>
                                                    </div>
                                                    <div class="stock">
                                                        <p class="title">Status</p>
                                                        <p>
                                                            <c:if test="${productDto.state == 1}">
                                                                <span style="color: #00f600!important;">Active</span>
                                                            </c:if>
                                                            <c:if test="${productDto.state != 1}">
                                                                <span style="color: #f64400!important;">Block</span>
                                                            </c:if>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row review-rating mt-4">
                                    <div class="col-12">
                                        <ul class="nav nav-tabs" id="myRatingTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active"
                                                   id="product-detail-tab" data-bs-toggle="tab"
                                                   data-bs-target="#productdetail" href="#productdetail" role="tab"
                                                   aria-selected="true">
                                                    <i class="mdi mdi-library-books mr-1"></i> Detail</a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link"
                                                   id="product-information-tab" data-bs-toggle="tab"
                                                   data-bs-target="#productinformation" href="#productinformation"
                                                   role="tab" aria-selected="false">
                                                    <i class="mdi mdi-information mr-1"></i>Info</a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link"
                                                   id="product-reviews-tab" data-bs-toggle="tab"
                                                   data-bs-target="#productreviews" href="#productreviews"
                                                   role="tab" aria-selected="false">
                                                    <i class="mdi mdi-star-half mr-1"></i> Reviews</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent2">
                                            <div class="tab-pane pt-3 fade show active" id="productdetail"
                                                 role="tabpanel">
                                                <p>${productDto.details}</p>
                                            </div>

                                            <div class="tab-pane pt-3 fade" id="productinformation" role="tabpanel">
                                                <p>${productDto.moreInformation}</p>
                                            </div>

                                            <div class="tab-pane pt-3 fade" id="productreviews" role="tabpanel">
                                                <div class="ec-t-review-wrapper">
                                                    <c:if test="${listReview == []}">
                                                        <div class="ec-t-review-item">
                                                            <h6>This product has no reviews yet!</h6>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${listReview != []}">
                                                        <c:forEach items="${listReview}" var="review">
                                                            <div class="ec-t-review-item">
                                                                <div class="ec-t-review-avtar">
                                                                    <img style="border-radius: 50%;width: 100px;height: 100px;object-fit: cover;" src="${review.user.avatar}"
                                                                         alt=""/>
                                                                </div>
                                                                <div class="ec-t-review-content">
                                                                    <div class="ec-t-review-top">
                                                                        <div class="ec-t-review-name">${review.user.fullName}</div>
                                                                        <div class="ec-t-rate">

                                                                            <c:if test="${review_rating == 1}">
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                            </c:if>
                                                                            <c:if test="${review_rating == 2}">
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                            </c:if>
                                                                            <c:if test="${review_rating == 3}">
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                            </c:if>
                                                                            <c:if test="${review_rating == 4}">
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star"></i>
                                                                            </c:if>
                                                                            <c:if test="${review_rating == 5}">
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                                <i class="mdi mdi-star is-rated"></i>
                                                                            </c:if>

                                                                        </div>
                                                                    </div>
                                                                    <div class="ec-t-review-bottom">
                                                                        <p>
                                                                                ${review.comment}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
