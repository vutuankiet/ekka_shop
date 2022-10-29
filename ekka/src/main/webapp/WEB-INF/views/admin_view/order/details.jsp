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
                <div class="breadcrumb-wrapper breadcrumb-wrapper-2">
                    <h1>Order Detail</h1>
                    <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                        <span><i class="mdi mdi-chevron-right"></i></span>Orders
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="ec-odr-dtl card card-default">
                            <div class="card-header card-header-border-bottom d-flex justify-content-between">
                                <h2 class="ec-odr">Order Detail<br>
                                    <span class="small">Order ID: #1082</span>
                                </h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Customer:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                Twitter, Inc.<br>
                                                795 Folsom Ave, Suite 600<br>
                                                San Francisco, CA 94107<br>
                                                <abbr title="Phone">P:</abbr> (123) 456-7890
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Shipped To:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                Elaine Hernandez<br>
                                                P. Sherman 42,<br>
                                                Wallaby Way, Sidney<br>
                                                <abbr title="Phone">P:</abbr> (123) 345-6789
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Payment Method:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                Visa ending **** 1234<br>
                                                <a href="https://loopinfosol.in/cdn-cgi/l/email-protection"
                                                   class="__cf_email__"
                                                   data-cfemail="c1a9efa4ada0a8afa481a6aca0a8adefa2aeac">[email&#160;protected]</a><br>
                                            </div>
                                        </address>
                                    </div>
                                    <div class="col-xl-3 col-lg-6">
                                        <address class="info-grid">
                                            <div class="info-title"><strong>Order Date:</strong></div>
                                            <br>
                                            <div class="info-content">
                                                4:34PM,<br>
                                                Wed, Aug 13, 2020
                                            </div>
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="tbl-title">PRODUCT SUMMARY</h3>
                                        <div class="table-responsive">
                                            <table class="table table-striped o-tbl">
                                                <thead>
                                                <tr class="line">
                                                    <td><strong>Code</strong></td>
                                                    <td class="text-left"><strong>IMAGE</strong></td>
                                                    <td class="text-left"><strong>PRODUCT</strong></td>
                                                    <td class="text-right"><strong>PRICE/UNIT</strong></td>
                                                    <td class="text-right"><strong>QUANTITY</strong></td>
                                                    <td class="text-right"><strong>SUBTOTAL</strong></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listOrder}" var="order">
                                                    <tr>
                                                        <td>${order.order_code}</td>
                                                        <td><img class="product-img"
                                                                 src="${order.product.productImage}" alt=""/></td>
                                                        <td><strong>${order.product.productName}</strong><br></td>
                                                        <td class="text-right">
                                                            $${order.product.discount == null ? order.product.priceProduct * ((100 - 0)/100) : order.product.priceProduct * ((100 - order.product.discount)/100)}</td>
                                                        <td class="text-right">${order.item}</td>
                                                        <td class="text-right">$<fmt:formatNumber maxFractionDigits="2"
                                                                                                  value="${order.product.discount == null ? (order.product.priceProduct * ((100 - 0)/100)) * order.item : (order.product.priceProduct * ((100 - order.product.discount)/100)) * order.item}"></fmt:formatNumber></td>
                                                    </tr>
                                                </c:forEach>
                                                <tr class="line"></tr>

                                                <tr>
                                                    <td colspan="4"></td>
                                                    <td class="text-right"><strong>Taxes</strong></td>
                                                    <td class="text-right"><strong>N/A</strong></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                    </td>
                                                    <td class="text-right"><strong>Total</strong></td>
                                                    <td class="text-right"><strong>$<fmt:formatNumber
                                                            maxFractionDigits="2"
                                                            value="${orderDto.total_price}"></fmt:formatNumber></strong>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td colspan="4">
                                                    </td>
                                                    <td class="text-right"><strong>Payment Status</strong></td>
                                                    <td class="text-right"><strong>PAID</strong></td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Tracking Detail -->
                        <div class="card mt-4 trk-order">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                                <span class="text-uppercase">Tracking Order No - </span>
                                <span class="text-medium">34VB5540K83</span>
                            </div>
                            <div
                                    class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-secondary">
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Shipped
											Via:</span> UPS Ground
                                </div>
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Status:</span>
                                    Checking Quality
                                </div>
                                <div class="w-100 text-center py-1 px-2"><span class="text-medium">Expected
											Date:</span> DEC 09, 2021
                                </div>
                            </div>
                            <div class="card-body">
                                <div
                                        class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
                                    <div class="step completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="mdi mdi-cart"></i></div>
                                        </div>
                                        <h4 class="step-title">Confirmed Order</h4>
                                    </div>
                                    <div class="step completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="mdi mdi-tumblr-reblog"></i></div>
                                        </div>
                                        <h4 class="step-title">Processing Order</h4>
                                    </div>
                                    <div class="step completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="mdi mdi-gift"></i></div>
                                        </div>
                                        <h4 class="step-title">Product Dispatched</h4>
                                    </div>
                                    <div class="step">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="mdi mdi-truck-delivery"></i></div>
                                        </div>
                                        <h4 class="step-title">On Delivery</h4>
                                    </div>
                                    <div class="step">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="mdi mdi-hail"></i></div>
                                        </div>
                                        <h4 class="step-title">Product Delivered</h4>
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
</body>
</html>
