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

    <title>Ekka - Admin | Order Delivered.</title>

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
                    <h1>Orders Delivered</h1>
                    <p class="breadcrumbs"><span><a href="/ekka/admin/order/delivered">Home</a></span>
                        <span><i class="mdi mdi-chevron-right"></i></span>Orders Delivered
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table" style="width:100%">
                                        <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>CODE</th>
                                            <th>Customer</th>
                                            <th>Price</th>
                                            <th>Payment</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listBill}" var="bill">

                                            <tr>
                                                <td>
                                                    <c:forEach items="${listOrder}" var="order">
                                                        <c:if test="${bill.order_code == order.order_code}">
                                                        <a href="/ekka/admin/product/details/${order.product.id}">
                                                            <img class="tbl-thumb" src="${order.product.productImage}" alt="product image"/></a>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>#${bill.order_code}</td>
                                                <td><strong>${bill.user.fullName}</strong><br>
                                                    <a href="/ekka/admin/user/details/${bill.user.id}">${bill.user.email}</a>
                                                </td>
                                                <td>$<fmt:formatNumber
                                                        maxFractionDigits="2"
                                                        value="${bill.price}"></fmt:formatNumber></td>
                                                <c:if test="${bill.payment == 0}">
                                                    <td>Cash</td>
                                                </c:if>
                                                <c:if test="${bill.payment == 1}">
                                                    <td>Bank</td>
                                                </c:if>

                                                <c:if test="${bill.state == 0}">
                                                    <td><span class="mb-2 mr-2 badge badge-danger">
                                                        ORDER CANCELLATION
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 1}">
                                                    <td><span class="mb-2 mr-2 badge badge-secondary">
                                                        PENDING
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 2}">
                                                    <td><span class="mb-2 mr-2 badge badge-warning">
                                                        READY TO SHIP
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 3}">
                                                    <td><span class="mb-2 mr-2 badge badge-info">
                                                        ON THE WAY
                                                    </span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${bill.state == 4}">
                                                    <td><span class="mb-2 mr-2 badge badge-success">
                                                        DELIVERED
                                                    </span>
                                                    </td>
                                                </c:if>

                                                <td>${bill.updated_at}</td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                        <a style="padding: 3px 10px;" class="btn btn-outline-success" href="/ekka/admin/order/details/${bill.order_code}">Info</a>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Info</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <c:if test="${bill.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important" type="submit">PENDING
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important" type="submit">READY TO SHIP
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important" type="submit">ON THE WAY
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important" type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important" type="submit">ORDER CANCELLATION
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important" type="submit">READY TO SHIP
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important" type="submit">ON THE WAY
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important" type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 2}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important" type="submit">ORDER CANCELLATION
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important" type="submit">PENDING
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important" type="submit">ON THE WAY
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important" type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 3}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important" type="submit">ORDER CANCELLATION
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important" type="submit">PENDING
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important" type="submit">READY TO SHIP
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #29cc97!important" type="submit">DELIVERED
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${bill.state == 4}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fe5461!important" type="submit">ORDER CANCELLATION
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #8a909d!important" type="submit">PENDING
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #fec400!important" type="submit">READY TO SHIP
                                                                    </button>
                                                                </f:form>
                                                                <f:form method="post"
                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                        modelAttribute="orderDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            style="color: #13cae1!important" type="submit">ON THE WAY
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
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
