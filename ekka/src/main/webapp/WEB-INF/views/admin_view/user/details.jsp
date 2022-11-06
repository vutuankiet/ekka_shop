<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | User Details.</title>

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
                <div class="breadcrumb-wrapper breadcrumb-contacts">
                    <div>
                        <h1>User Details</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>User Details
                        </p>
                    </div>
                    <div>
                        <a href="/ekka/admin/user/list" class="btn btn-primary">User List</a>
                    </div>
                </div>
                <div class="card bg-white profile-content">
                    <div class="row">
                        <div class="col-lg-4 col-xl-3">

                            <div class="profile-content-left profile-left-spacing">
                                <div class="text-center widget-profile px-0 border-0" style="height: 307px;">
                                    <div class="card-img mx-auto rounded-circle" style="width: 100%!important;">
                                        <img id="fileImageBackGround" src="${userDto.background_profile}"
                                             alt="user image">
                                    </div>
                                    <img id="fileImageAvatar" style="height: 120px;width: 120px;border-radius: 50%;object-fit: cover;position: relative;top: -62px;border: 5px solid white;"
                                         src="${userDto.avatar}"
                                         alt="user image">

                                    <div class="card-body" style="position: relative;top: -58px;">
                                        <p>( ${userDto.role} )</p>
                                        <h4 class="py-2 text-dark showUserName">${userDto.fullName}</h4>
                                        <p>${userDto.email}</p>
                                        ${userDto.state == 1 ? '<a class="btn btn-success my-3" href="#">ACTIVE</a>' : '<a class="btn btn-danger my-3" href="#">BLOCK</a>'}
                                    </div>
                                </div>

                                <hr class="w-100">

                                <div class="contact-info pt-4">
                                    <h5 class="text-dark">Contact Information</h5>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Email address</p>
                                    <p>${userDto.email == null ? "( null )" : userDto.email}</p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Phone Number</p>
                                    <p class="showUserPhone">${userDto.phone == null ? "( null )" : userDto.phone}</p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Address</p>
                                    <p class="showUserAddress">${userDto.address == null ? "( null )" : userDto.address}</p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Social Profile</p>
                                    <p class="social-button">
                                        <a href="#" class="mb-1 btn btn-outline btn-twitter rounded-circle">
                                            <i class="mdi mdi-twitter"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-linkedin rounded-circle">
                                            <i class="mdi mdi-linkedin"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-facebook rounded-circle">
                                            <i class="mdi mdi-facebook"></i>
                                        </a>

                                        <a href="#" class="mb-1 btn btn-outline btn-skype rounded-circle">
                                            <i class="mdi mdi-skype"></i>
                                        </a>
                                    </p>
                                    <c:if test="${userDto.state == 1}">
                                        <f:form method="post" action="/ekka/admin/user/delete" modelAttribute="userDto"
                                                enctype="multipart/form-data">
                                            <div class="col-md-12 space-t-15 form-group d-none">
                                                <label class="form-label">Email*</label>
                                                <f:input type="text" path="email" class="form-control"
                                                         placeholder="Enter your email"
                                                         aria-label="Enter your Email"
                                                         required="required" readonly="true"/>
                                            </div>
                                            <button class="btn btn-outline-danger" type="submit">Delete</button>
                                        </f:form>
                                    </c:if>
                                    <c:if test="${userDto.state == 0}">
                                        <f:form method="post" action="/ekka/admin/user/restore" modelAttribute="userDto"
                                                enctype="multipart/form-data">
                                            <div class="col-md-12 space-t-15 form-group d-none">
                                                <label class="form-label">Email*</label>
                                                <f:input type="text" path="email" class="form-control"
                                                         placeholder="Enter your email"
                                                         aria-label="Enter your Email"
                                                         required="required" readonly="true"/>
                                            </div>
                                            <button class="btn btn-outline-success" type="submit">Restore</button>
                                        </f:form>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8 col-xl-9">
                            <div class="profile-content-right profile-right-spacing py-5">
                                <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myProfileTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#profile" type="button" role="tab"
                                                aria-controls="profile" aria-selected="true">History Order
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="edit-tab" data-bs-toggle="tab"
                                                data-bs-target="#edit" type="button" role="tab"
                                                aria-controls="edit" aria-selected="false">Edit
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="user-tab" data-bs-toggle="tab"
                                                data-bs-target="#user" type="button" role="tab"
                                                aria-controls="user" aria-selected="false">Users
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content px-3 px-xl-5" id="myTabContent">

                                    <div class="tab-pane fade show active" id="profile" role="tabpanel"
                                         aria-labelledby="profile-tab">
                                        <div class="tab-widget mt-5">

                                            <div class="row">
                                                <div class="col-xl-12">

                                                    <!-- Notification Table -->
                                                    <div class="card card-default">
                                                        <div class="card-header justify-content-between mb-1">
                                                            <h2>History Order</h2>
                                                            <div>
                                                                <button class="text-black-50 mr-2 font-size-20"><i
                                                                        class="mdi mdi-cached"></i></button>
                                                            </div>

                                                        </div>
                                                        <div class="card-body compact-notifications" data-simplebar
                                                             style="height: 434px;">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="card card-default">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <table id="responsive-data-table" class="table" style="width:100%">
                                                                                    <thead>
                                                                                    <tr>
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
                                                        Order Cancellation
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
                                                                                                        <a style="padding: 3px 10px;"
                                                                                                           class="btn btn-outline-success"
                                                                                                           href="/ekka/admin/order/details/${bill.order_code}">Info</a>
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
                                                                                                                            style="color: #8a909d!important"
                                                                                                                            type="submit">PENDING
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fec400!important"
                                                                                                                            type="submit">READY TO SHIP
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #13cae1!important"
                                                                                                                            type="submit">ON THE WAY
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #29cc97!important"
                                                                                                                            type="submit">DELIVERED
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                            </c:if>
                                                                                                            <c:if test="${bill.state == 1}">
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fe5461!important"
                                                                                                                            type="submit">Order Cancellation
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fec400!important"
                                                                                                                            type="submit">READY TO SHIP
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #13cae1!important"
                                                                                                                            type="submit">ON THE WAY
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #29cc97!important"
                                                                                                                            type="submit">DELIVERED
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                            </c:if>
                                                                                                            <c:if test="${bill.state == 2}">
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fe5461!important"
                                                                                                                            type="submit">Order Cancellation
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #8a909d!important"
                                                                                                                            type="submit">PENDING
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #13cae1!important"
                                                                                                                            type="submit">ON THE WAY
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #29cc97!important"
                                                                                                                            type="submit">DELIVERED
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                            </c:if>
                                                                                                            <c:if test="${bill.state == 3}">
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fe5461!important"
                                                                                                                            type="submit">Order Cancellation
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #8a909d!important"
                                                                                                                            type="submit">PENDING
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fec400!important"
                                                                                                                            type="submit">READY TO SHIP
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState4/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #29cc97!important"
                                                                                                                            type="submit">DELIVERED
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                            </c:if>
                                                                                                            <c:if test="${bill.state == 4}">
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState0/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fe5461!important"
                                                                                                                            type="submit">Order Cancellation
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState1/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #8a909d!important"
                                                                                                                            type="submit">PENDING
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState2/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #fec400!important"
                                                                                                                            type="submit">READY TO SHIP
                                                                                                                    </button>
                                                                                                                </f:form>
                                                                                                                <f:form method="post"
                                                                                                                        action="/ekka/admin/order/changeState3/${bill.order_code}"
                                                                                                                        modelAttribute="orderDto"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                    <button class="dropdown-item pl-3"
                                                                                                                            style="color: #13cae1!important"
                                                                                                                            type="submit">ON THE WAY
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

                                                        </div>
                                                        <div class="mt-3"></div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="edit" role="tabpanel"
                                         aria-labelledby="edit-tab">
                                        <div class="tab-pane-content mt-5">
                                            <f:form method="post" action="/ekka/admin/user/update" cssClass="row g-3"
                                                    modelAttribute="userDto" enctype="multipart/form-data">
                                                <div class="space-bottom-30">
                                                    <div class="ec-vendor-block-bg cover-upload">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input onchange="readURLBackGround(this);" type="file" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" accept="image/*"
                                                                         path="fileImageBackground"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg"
                                                                            alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img style="object-fit: cover; width: 100%;"
                                                                         class="image-thumb-preview ec-image-preview v-img"
                                                                         src="${userDto.background_profile}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-block-detail">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input onchange="readURL(this);" type="file" id="thumbUpload02"
                                                                         cssClass="ec-image-upload" path="fileImage" accept="image/*"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg"
                                                                            alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img id="fileImage" style="object-fit: cover;"
                                                                         class="image-thumb-preview ec-image-preview v-img"
                                                                         src="${userDto.avatar}"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-upload-detail">
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">User Name*</label>
                                                            <f:input type="text" path="fullName" class="form-control userName"
                                                                     placeholder="Enter your full name" maxlength="30"
                                                                     aria-label="Enter your full name"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Email*</label>
                                                            <f:input type="text" path="email" class="form-control"
                                                                     placeholder="Enter your email"
                                                                     aria-label="Enter your Email"
                                                                     required="required" readonly="true"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Phone</label>
                                                            <f:input type="text" path="phone" class="form-control userPhone"
                                                                     placeholder="Enter your phone" maxlength="15" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                                                     aria-label="Enter your phone"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Address*</label>
                                                            <f:input type="text" path="address" class="form-control userAddress"
                                                                     placeholder="Enter your address" maxlength="50"
                                                                     aria-label="Enter your address"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15">
                                                            <div class="d-flex justify-content-end mt-5">
                                                                <button type="submit"
                                                                        class="btn btn-primary mb-2 btn-pill">Update
                                                                    Profile
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </f:form>

                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="user" role="tabpanel"
                                         aria-labelledby="user-tab">
                                        <div class="tab-pane-content mt-5">
                                            <div class="row">
                                                <c:forEach items="${list}" var="user">
                                                    <c:if test="${user.id > userDto.id && user.id < user.id + 8 && user.role == 'USER' }">
                                                    <div class="col-md-12 col-xl-6 mb-24px">
                                                        <div class="ec-user-card card card-default p-4">
                                                            <a href="/ekka/admin/user/details/${user.id}" data-bs-toggle="modal"
                                                               data-bs-target="#modalContact"
                                                               class="view-detail"><i
                                                                    class="mdi mdi-eye-plus-outline"></i>
                                                            </a>
                                                            <a href="/ekka/admin/user/details/${user.id}" class="media text-secondary">
                                                                <img src="${user.avatar}"
                                                                     class="mr-3 img-fluid" alt="Avatar Image">

                                                                <div class="media-body">
                                                                    <h5 class="mt-0 mb-2 text-dark">${user.fullName}</h5>

                                                                    <ul class="list-unstyled">
                                                                        <li class="d-flex mb-1">
                                                                            <i class="mdi mdi-email mr-1"></i>
                                                                            <span>${user.email}</span>
                                                                        </li>
                                                                        <li class="d-flex mb-1">
                                                                            <i class="mdi mdi-phone mr-1"></i>
                                                                            <span>${user.phone == null ? "( null )" : user.phone}</span>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </c:forEach>
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
    function readURL(input) {
        // for (let i = 0; i < input.files.length; i++) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("fileImageAvatar").src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    function readURLBackGround(input) {
        // for (let i = 0; i < input.files.length; i++) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById("fileImageBackGround").src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("input.userName").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('h4.showUserName').text(el);
    });

    $("input.userPhone").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('p.showUserPhone').text(el);
    });

    $("input.userAddress").keyup(function (element) {
        var el = $(this).val();
        console.log(el)
        $('p.showUserAddress').text(el);
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
