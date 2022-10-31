<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template.">

    <title>Ekka - Admin | Profile.</title>

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
                        <h1>User Profile</h1>
                        <p class="breadcrumbs"><span><a href="index.html">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Profile
                        </p>
                    </div>
                    <div>
                        <a href="user-list.html" class="btn btn-primary">Edit</a>
                    </div>
                </div>
                <div class="card bg-white profile-content">
                    <div class="row">
                        <div class="col-lg-4 col-xl-3">
                            <div class="profile-content-left profile-left-spacing">
                                <div class="text-center widget-profile px-0 border-0" style="height: 250px;">
                                    <div class="card-img mx-auto rounded-circle" style="width: 100%!important;">
                                        <img src="<sec:authentication
                                                            property="principal.background_profile"></sec:authentication>"
                                                                     alt="user image">
                                    </div>
                                        <img style="height: 120px;width: 120px;border-radius: 50%;object-fit: cover;position: relative;top: -62px;" src="<sec:authentication
                                                            property="principal.avatar"></sec:authentication>"
                                             alt="user image">

                                    <div class="card-body" style="position: relative;top: -58px;">
                                        <p>( Admin )</p>
                                        <h4 class="py-2 text-dark"><sec:authentication
                                                property="principal.fullName"></sec:authentication></h4>
                                        <p><sec:authentication
                                                property="principal.email"></sec:authentication></p>
                                    </div>
                                </div>

                                <hr class="w-100">

                                <div class="contact-info pt-4">
                                    <h5 class="text-dark">Contact Information</h5>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Email address</p>
                                    <p><sec:authentication
                                            property="principal.email"></sec:authentication></p>
                                    <p class="text-dark font-weight-medium pt-24px mb-2">Phone Number</p>
                                    <p><sec:authentication
                                            property="principal.phone"></sec:authentication></p>
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
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8 col-xl-9">
                            <div class="profile-content-right profile-right-spacing py-5">
                                <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myProfileTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#profile" type="button" role="tab"
                                                aria-controls="profile" aria-selected="true">Profile
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="settings-tab" data-bs-toggle="tab"
                                                data-bs-target="#settings" type="button" role="tab"
                                                aria-controls="settings" aria-selected="false">Settings
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
                                                            <h2>Latest Notifications</h2>
                                                            <div>
                                                                <button class="text-black-50 mr-2 font-size-20"><i
                                                                        class="mdi mdi-cached"></i></button>
                                                                <div
                                                                        class="dropdown show d-inline-block widget-dropdown">
                                                                    <a class="dropdown-toggle icon-burger-mini"
                                                                       href="#" role="button"
                                                                       id="dropdown-notification"
                                                                       data-bs-toggle="dropdown"
                                                                       aria-haspopup="true" aria-expanded="false"
                                                                       data-display="static"></a>
                                                                    <ul class="dropdown-menu dropdown-menu-right"
                                                                        aria-labelledby="dropdown-notification">
                                                                        <li class="dropdown-item"><a
                                                                                href="#">Action</a></li>
                                                                        <li class="dropdown-item"><a
                                                                                href="#">Another action</a></li>
                                                                        <li class="dropdown-item"><a
                                                                                href="#">Something else here</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="card-body compact-notifications" data-simplebar
                                                             style="height: 434px;">
                                                            <div
                                                                    class="media pb-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
                                                                    <i
                                                                            class="mdi mdi-cart-outline font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3 ">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">New Order</a>
                                                                    <p>Selena has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 10
																		AM</span>
                                                            </div>

                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-success text-white">
                                                                    <i
                                                                            class="mdi mdi-email-outline font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">New Enquiry</a>
                                                                    <p>Phileine has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 9
																		AM</span>
                                                            </div>


                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-warning text-white">
                                                                    <i
                                                                            class="mdi mdi-stack-exchange font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">Support Ticket</a>
                                                                    <p>Emma has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 10
																		AM</span>
                                                            </div>

                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
                                                                    <i
                                                                            class="mdi mdi-cart-outline font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">New order</a>
                                                                    <p>Ryan has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 10
																		AM</span>
                                                            </div>

                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-info text-white">
                                                                    <i
                                                                            class="mdi mdi-calendar-blank font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">Comapny Meetup</a>
                                                                    <p>Phileine has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 10
																		AM</span>
                                                            </div>

                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-warning text-white">
                                                                    <i
                                                                            class="mdi mdi-stack-exchange font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">Support Ticket</a>
                                                                    <p>Emma has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 10
																		AM</span>
                                                            </div>

                                                            <div
                                                                    class="media py-3 align-items-center justify-content-between">
                                                                <div
                                                                        class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-success text-white">
                                                                    <i
                                                                            class="mdi mdi-email-outline font-size-20"></i>
                                                                </div>
                                                                <div class="media-body pr-3">
                                                                    <a class="mt-0 mb-1 font-size-15 text-dark"
                                                                       href="#">New Enquiry</a>
                                                                    <p>Phileine has placed an new order</p>
                                                                </div>
                                                                <span class=" font-size-12 d-inline-block"><i
                                                                        class="mdi mdi-clock-outline"></i> 9
																		AM</span>
                                                            </div>

                                                        </div>
                                                        <div class="mt-3"></div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="settings" role="tabpanel"
                                         aria-labelledby="settings-tab">
                                        <div class="tab-pane-content mt-5">
                                            <f:form method="post" action="/ekka/admin/update" cssClass="row g-3" modelAttribute="userDto" enctype="multipart/form-data">
                                                <div class="space-bottom-30">
                                                    <div class="ec-vendor-block-bg cover-upload">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload01" cssClass="ec-image-upload" path="fileImageBackground" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img style="object-fit: cover; width: 100%;" class="image-thumb-preview ec-image-preview v-img"
                                                                         src="<sec:authentication property="principal.background_profile"></sec:authentication>" alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-block-detail">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload02" cssClass="ec-image-upload" path="fileImage" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                                                                <label><img src="/user/assets/images/icons/edit.svg"
                                                                            class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img id="fileImage" style="object-fit: cover;" class="image-thumb-preview ec-image-preview v-img"
                                                                         src="<sec:authentication property="principal.avatar"></sec:authentication>"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ec-vendor-upload-detail">
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">User Name*</label>
                                                            <f:input type="text" path="fullName" class="form-control"
                                                                     placeholder="Enter your full name" aria-label="Enter your full name"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Email*</label>
                                                            <f:input type="text" path="email" class="form-control"
                                                                     placeholder="Enter your email" aria-label="Enter your Email"
                                                                     required="required" readonly="true"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Phone</label>
                                                            <f:input type="text" path="phone" class="form-control"
                                                                     placeholder="Enter your phone" aria-label="Enter your phone"
                                                                     required="required"/>
                                                        </div>
                                                        <div class="col-md-12 space-t-15 form-group">
                                                            <label class="form-label">Address*</label>
                                                            <f:input type="text" path="address" class="form-control"
                                                                     placeholder="Enter your address" aria-label="Enter your address"
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

</body>
</html>
