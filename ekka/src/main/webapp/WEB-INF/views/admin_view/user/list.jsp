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
                <div class="breadcrumb-wrapper breadcrumb-contacts">
                    <div>
                        <h1>User List</h1>
                        <p class="breadcrumbs"><span><a href="index.html">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>User
                        </p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#addUser"> Add User
                        </button>
                    </div>
                </div>
                <div class="row">
                    <span style="color: red">${message}</span>
                    <div class="col-12">
                        <div class="ec-vendor-list card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table">
                                        <thead>
                                        <tr>
                                            <th>Profile</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                            <th>Join On</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${list}" var="user">
                                            <c:if test="${user.role == 'USER'}">
                                                <tr>
                                                    <td><img style="object-fit: cover;" class="vendor-thumb"
                                                             src="${user.avatar}"
                                                             alt="user profile"/></td>
                                                    <td>${user.fullName}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.phone}</td>
                                                    <td>${user.address}</td>
                                                    <c:if test="${user.state == 1}">
                                                        <td style="color: #34c997!important;">
                                                            ACTIVE
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${user.state == 0}">
                                                        <td style="color: #ec4a58!important;">
                                                            BLOCK
                                                        </td>
                                                    </c:if>

                                                    <td>${user.created_at}</td>
                                                    <td>
                                                        <div class="btn-group mb-1">
                                                            <button type="button"
                                                                    class="btn btn-outline-success"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#infoUser-${user.id}">Info
                                                            </button>
                                                            <button type="button"
                                                                    class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                    data-bs-toggle="dropdown" aria-haspopup="true"
                                                                    aria-expanded="false" data-display="static">
                                                                <span class="sr-only">Info</span>
                                                            </button>

                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item"
                                                                   href="/ekka/admin/user/details/${user.id}">Edit</a>
                                                                <c:if test="${user.state == 1}">
                                                                    <f:form method="post"
                                                                            action="/ekka/admin/user/delete/${user.id}"
                                                                            modelAttribute="userDto"
                                                                            enctype="multipart/form-data">
                                                                        <button class="dropdown-item pl-3"
                                                                                type="submit">Delete
                                                                        </button>
                                                                    </f:form>
                                                                </c:if>
                                                                <c:if test="${user.state == 0}">
                                                                    <f:form method="post"
                                                                            action="/ekka/admin/user/restore/${user.id}"
                                                                            modelAttribute="userDto"
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
                                            <div class="modal fade modal-add-contact" id="infoUser-${user.id}" tabindex="-1"
                                                 role="dialog"
                                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                     role="document">
                                                    <div class="modal-content">
                                                        <div class="card bg-white profile-content">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-xl-12">
                                                                    <div class="profile-content-left profile-left-spacing">
                                                                        <div class="text-center widget-profile px-0 border-0"
                                                                             style="height: 307px;">
                                                                            <div class="card-img mx-auto rounded-circle"
                                                                                 style="width: 100%!important;">
                                                                                <img src="${user.background_profile}"
                                                                                     alt="user image">
                                                                            </div>
                                                                            <img style="height: 120px;width: 120px;border-radius: 50%;object-fit: cover;position: relative;top: -62px;"
                                                                                 src="${user.avatar}"
                                                                                 alt="user image">

                                                                            <div class="card-body"
                                                                                 style="position: relative;top: -58px;">
                                                                                <p>( ${user.role} )</p>
                                                                                <h4 class="py-2 text-dark">${user.fullName}</h4>
                                                                                <p>${user.email}</p>
                                                                                    ${user.state == 1 ? '<a class="btn btn-success my-3" href="#">ACTIVE</a>' : '<a class="btn btn-danger my-3" href="#">BLOCK</a>'}
                                                                            </div>
                                                                        </div>
                                                                        <hr class="w-100">
                                                                        <div class="contact-info pt-4">
                                                                            <h5 class="text-dark">Contact
                                                                                Information</h5>
                                                                            <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                Email address</p>
                                                                            <p>${user.email == null ? "( null )" : user.email}</p>
                                                                            <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                Phone Number</p>
                                                                            <p>${user.phone == null ? "( null )" : user.phone}</p>
                                                                            <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                Address</p>
                                                                            <p>${user.address == null ? "( null )" : user.address}</p>
                                                                            <p class="text-dark font-weight-medium pt-24px mb-2">
                                                                                Action</p>
                                                                            <c:if test="${user.state == 1}">
                                                                                <f:form method="post"
                                                                                        action="/ekka/admin/user/delete/${user.id}"
                                                                                        modelAttribute="userDto"
                                                                                        enctype="multipart/form-data">
                                                                                    <button class="btn btn-outline-danger"
                                                                                            type="submit">Delete
                                                                                    </button>
                                                                                </f:form>
                                                                            </c:if>
                                                                            <c:if test="${user.state == 0}">
                                                                                <f:form method="post"
                                                                                        action="/ekka/admin/user/restore/${user.id}"
                                                                                        modelAttribute="userDto"
                                                                                        enctype="multipart/form-data">
                                                                                    <button class="btn btn-outline-success"
                                                                                            type="submit">Restore
                                                                                    </button>
                                                                                </f:form>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer px-4">
                                                            <button type="button" class="btn btn-secondary btn-pill"
                                                                    data-bs-dismiss="modal">Cancel
                                                            </button>
                                                            <a href="/ekka/admin/user/details/${user.id}">
                                                                <button class="btn btn-primary btn-pill">Edit
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:if>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Add User Modal  -->
                <div class="modal fade modal-add-contact" id="addUser" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <f:form method="post" action="/ekka/admin/user/save" modelAttribute="userDto"
                                    enctype="multipart/form-data">
                                <div class="modal-header px-4">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Add New User</h5>
                                </div>

                                <div class="modal-body px-4">

                                    <div class="row mb-2">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>User Name*</label>
                                                <f:input type="text" path="fullName" class="form-control"
                                                         placeholder="Enter your user name"
                                                         aria-label="Enter your user name"
                                                         required="required"/>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Email*</label>
                                                <f:input type="email" class="form-control" path="email"
                                                         placeholder="Email"
                                                         aria-label="Email" required="required"/>
                                                <f:errors path="email" cssClass="error"></f:errors>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-4">
                                                <label>Phone Number*</label>
                                                <f:input type="text" path="phone" class="form-control"
                                                         placeholder="Nhập phone number"
                                                         aria-label="Nhập phone number"/>
                                                <f:errors path="phone" cssClass="error"></f:errors>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-4">
                                                <label>Address*</label>
                                                <f:input type="text" path="address" class="form-control"
                                                         placeholder="Nhập address" aria-label="Nhập laddress"/>
                                                <f:errors path="address" cssClass="error"></f:errors>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-4">
                                                <label>Password*</label>
                                                <f:input type="password" class="form-control" path="password"
                                                         placeholder="Mật khẩu"
                                                         aria-label="Mật khẩu"/>
                                                <f:errors path="password" cssClass="error"></f:errors>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-4">
                                                <label>Confirm Password*</label>
                                                <f:input type="password" path="rePassword" class="form-control"
                                                         placeholder="Nhập lại mật khẩu"
                                                         aria-label="Nhập lại mật khẩu"/>
                                                <f:errors path="rePassword" cssClass="error"></f:errors>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer px-4">
                                    <button type="button" class="btn btn-secondary btn-pill"
                                            data-bs-dismiss="modal">Cancel
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-pill">Create User</button>
                                </div>
                            </f:form>>
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

</body>
</html>
