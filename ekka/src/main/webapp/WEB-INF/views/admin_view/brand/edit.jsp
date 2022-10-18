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
                        <h1>Brand</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span> Brand</p>
                    </div>
                    <div>
                        <a href="/ekka/admin/brand/list" type="button" class="btn btn-primary">Add Brand
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-4 col-lg-12">
                        <div class="ec-cat-list card card-default mb-24px">
                            <div class="card-body">
                                <div class="ec-cat-form">
                                    <h4>Edit Brand</h4>
                                    <span style="color: red">${message}</span>

                                    <f:form method="post" action="/ekka/admin/brand/update" modelAttribute="brandDto"
                                            enctype="multipart/form-data">
                                        <div class="ec-vendor-block-detail" style="margin-top: 75px;">
                                            <div class="thumb-upload">
                                                <div class="thumb-edit">
                                                    <f:input type="file" id="thumbUpload02"
                                                             cssClass="ec-image-upload" path="fileLogo"
                                                             placeholder="Chọn file"
                                                             aria-label="Ảnh đại diện"/>
                                                    <label><img src="/user/assets/images/icons/edit.svg"
                                                                class="svg_img header_svg"
                                                                alt="edit"/></label>
                                                </div>
                                                <div class="thumb-preview ec-preview">
                                                    <div class="image-thumb-preview">
                                                        <img id="fileLogo"
                                                             style="object-fit: cover; border-radius: 35%!important;"
                                                             class="image-thumb-preview ec-image-preview v-img"
                                                             src="${brandDto.logo}"
                                                             alt="edit"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 d-none">
                                            <div class="form-group">
                                                <label>Name Brand*</label>
                                                <f:input type="text" path="id" class="form-control"
                                                         placeholder="Enter your user name"
                                                         aria-label="Enter your user name"
                                                         required="required"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Name Brand*</label>
                                                <f:input type="text" path="nameBrand" class="form-control"
                                                         placeholder="Enter your user name"
                                                         aria-label="Enter your user name"
                                                         required="required"/>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary btn-pill">Update Brand</button>

                                    </f:form>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-12">
                        <div class="ec-cat-list card card-default">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="responsive-data-table" class="table">
                                        <thead>
                                        <tr>
                                            <th>Logo</th>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Join on</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${list}" var="brand">
                                            <tr>
                                                <td><img style="object-fit: cover;" class="cat-thumb"
                                                         src="${brand.logo}"
                                                         alt="brand logo"/></td>
                                                <td>${brand.nameBrand}</td>
                                                <c:if test="${brand.state == 1}">
                                                    <td style="color: #34c997!important;">
                                                        ACTIVE
                                                    </td>
                                                </c:if>
                                                <c:if test="${brand.state == 0}">
                                                    <td style="color: #ec4a58!important;">
                                                        BLOCK
                                                    </td>
                                                </c:if>

                                                <td>${brand.created_at}</td>
                                                <td>
                                                    <div class="btn-group mb-1">
                                                        <button type="button"
                                                                class="btn btn-outline-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#infoUser-${brand.id}">Info
                                                        </button>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Info</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item"
                                                               href="/ekka/admin/brand/edit/${brand.id}">Edit</a>
                                                            <c:if test="${brand.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/brand/delete/${brand.id}"
                                                                        modelAttribute="brandDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Delete
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${brand.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/brand/restore/${brand.id}"
                                                                        modelAttribute="brandDto"
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
                                            <div class="modal fade modal-add-contact" id="infoUser-${brand.id}"
                                                 tabindex="-1"
                                                 role="dialog"
                                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                     role="document" style="width: fit-content; margin: auto;">
                                                    <div class="modal-content">
                                                        <div class="card bg-white profile-content">
                                                            <div class="row">
                                                                <div class="col-md-12 col-lg-12">
                                                                    <div class="card card-default">
                                                                        <div class="card-body text-center p-24px">
                                                                            <div class="image mb-3">
                                                                                <img src="${brand.logo}"
                                                                                     class="img-fluid rounded-circle"
                                                                                     alt="Avatar Image"
                                                                                     style="width: 200px; height: 200px; object-fit: cover;">
                                                                            </div>

                                                                            <h5 class="card-title text-dark">${brand.nameBrand}</h5>
                                                                            <p class="item-count">535<span> items</span>
                                                                            </p>
                                                                            <div class="d-flex justify-content-center align-items-center">
                                                                                    ${brand.state == 1 ? '<a class="btn btn-success my-3 mr-2" href="#">ACTIVE</a>' : '<a class="btn btn-danger my-3 mr-2" href="#">BLOCK</a>'}

                                                                                <c:if test="${brand.state == 1}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/brand/delete/${brand.id}"
                                                                                            modelAttribute="brandDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-danger ml-2"
                                                                                                type="submit"><span
                                                                                                class="brand-delete mdi mdi-delete-outline"></span>
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                                <c:if test="${brand.state == 0}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/brand/restore/${brand.id}"
                                                                                            modelAttribute="brandDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-success ml-2"
                                                                                                type="submit"><span
                                                                                                class="brand-delete mdi mdi-backup-restore"></span>
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer px-4">
                                                            <button type="button" class="btn btn-secondary btn-pill"
                                                                    data-bs-dismiss="modal">Cancel
                                                            </button>
                                                            <a href="/ekka/admin/brand/edit/${brand.id}">
                                                                <button class="btn btn-primary btn-pill">Edit
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Modal -->
                <div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header justify-content-end border-bottom-0">
                                <button type="button" class="btn-edit-icon" data-bs-dismiss="modal" aria-label="Close">
                                    <i class="mdi mdi-pencil"></i>
                                </button>

                                <div class="dropdown">
                                    <button class="btn-dots-icon" type="button" id="dropdownMenuButton"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="mdi mdi-dots-vertical"></i>
                                    </button>

                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>

                                <button type="button" class="btn-close-icon" data-bs-dismiss="modal"
                                        aria-label="Close">
                                    <i class="mdi mdi-close"></i>
                                </button>
                            </div>

                            <div class="modal-body pt-0">
                                <div class="row no-gutters">
                                    <div class="col-md-6">
                                        <div class="profile-content-left px-4">
                                            <div class="card text-center widget-profile px-0 border-0">
                                                <div class="card-img mx-auto rounded-circle">
                                                    <img src="assets/img/user/u6.jpg" alt="user image">
                                                </div>

                                                <div class="card-body">
                                                    <h4 class="py-2 text-dark">Albrecht Straub</h4>
                                                    <p><a href="https://loopinfosol.in/cdn-cgi/l/email-protection"
                                                          class="__cf_email__"
                                                          data-cfemail="d796bbb5a5b2b4bfa3f9a4a3a5b6a2b597b0bab6bebbf9b4b8ba">[email&#160;protected]</a>
                                                    </p>
                                                    <a class="btn btn-primary btn-pill btn-lg my-4"
                                                       href="#">Follow</a>
                                                </div>
                                            </div>

                                            <div class="d-flex justify-content-between ">
                                                <div class="text-center pb-4">
                                                    <h6 class="text-dark pb-2">1503</h6>
                                                    <p>Friends</p>
                                                </div>

                                                <div class="text-center pb-4">
                                                    <h6 class="text-dark pb-2">2905</h6>
                                                    <p>Followers</p>
                                                </div>

                                                <div class="text-center pb-4">
                                                    <h6 class="text-dark pb-2">1200</h6>
                                                    <p>Following</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="contact-info px-4">
                                            <h4 class="text-dark mb-1">Contact Details</h4>
                                            <p class="text-dark font-weight-medium pt-4 mb-2">Email address</p>
                                            <p><a href="https://loopinfosol.in/cdn-cgi/l/email-protection"
                                                  class="__cf_email__"
                                                  data-cfemail="5d1c313f2f383e3529732e292f3c283f1d3a303c3431733e3230">[email&#160;protected]</a>
                                            </p>
                                            <p class="text-dark font-weight-medium pt-4 mb-2">Phone Number</p>
                                            <p>+99 9539 2641 31</p>
                                            <p class="text-dark font-weight-medium pt-4 mb-2">Birthday</p>
                                            <p>Nov 15, 1990</p>
                                            <p class="text-dark font-weight-medium pt-4 mb-2">Event</p>
                                            <p>Lorem, ipsum dolor</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Contact Button  -->
                <div class="modal fade" id="modal-add-member" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                        <div class="modal-content">
                            <%--                            <f:form method="post" action="/ekka/admin/brand/save" modelAttribute="brandDto"--%>
                            <%--                                    enctype="multipart/form-data">--%>
                            <%--                                <div class="modal-header px-4">--%>
                            <%--                                    <h5 class="modal-title" id="exampleModalCenterTitle">Add New Brand</h5>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="modal-body px-4">--%>

                            <%--                                    <div class="row mb-2">--%>
                            <%--                                        <div class="ec-vendor-block-detail" style="margin-top: 60px;">--%>
                            <%--                                            <div class="thumb-upload">--%>
                            <%--                                                <div class="thumb-edit">--%>
                            <%--                                                    <f:input type="file" id="thumbUpload02"--%>
                            <%--                                                             cssClass="ec-image-upload" path="fileLogo"--%>
                            <%--                                                             placeholder="Chọn file"--%>
                            <%--                                                             aria-label="Ảnh đại diện"/>--%>
                            <%--                                                    <label><img src="/user/assets/images/icons/edit.svg"--%>
                            <%--                                                                class="svg_img header_svg"--%>
                            <%--                                                                alt="edit"/></label>--%>
                            <%--                                                </div>--%>
                            <%--                                                <div class="thumb-preview ec-preview">--%>
                            <%--                                                    <div class="image-thumb-preview">--%>
                            <%--                                                        <img id="fileImage" style="object-fit: cover;"--%>
                            <%--                                                             class="image-thumb-preview ec-image-preview v-img"--%>
                            <%--                                                             src="/admin/"--%>
                            <%--                                                             alt="edit"/>--%>
                            <%--                                                    </div>--%>
                            <%--                                                </div>--%>
                            <%--                                            </div>--%>
                            <%--                                        </div>--%>

                            <%--                                        <div class="col-lg-12">--%>
                            <%--                                            <div class="form-group">--%>
                            <%--                                                <label>User Name*</label>--%>
                            <%--                                                <f:input type="text" path="name_brand" class="form-control"--%>
                            <%--                                                         placeholder="Enter your user name"--%>
                            <%--                                                         aria-label="Enter your user name"--%>
                            <%--                                                         required="required"/>--%>
                            <%--                                            </div>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="modal-footer px-4">--%>
                            <%--                                    <button type="button" class="btn btn-secondary btn-pill"--%>
                            <%--                                            data-bs-dismiss="modal">Cancel--%>
                            <%--                                    </button>--%>
                            <%--                                    <button type="submit" class="btn btn-primary btn-pill">Create User</button>--%>
                            <%--                                </div>--%>
                            <%--                            </f:form>--%>
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
