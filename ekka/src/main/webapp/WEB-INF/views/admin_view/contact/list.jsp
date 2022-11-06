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

    <title>Ekka - Admin | Contact.</title>

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
                <div
                        class="breadcrumb-wrapper breadcrumb-wrapper-2 d-flex align-items-center justify-content-between">
                    <h1>Review</h1>
                    <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                        <span><i class="mdi mdi-chevron-right"></i></span>Review
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
                                            <th>FullName</th>
                                            <th>Comment/Question</th>
                                            <th>Phone</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listContact}" var="contact">
                                            <tr>
                                                <td><strong>${contact.first_name} ${contact.last_name}</strong><br>
                                                    <a href="/ekka/admin/user/details/${contact.user.id}">${contact.email}</a>
                                                </td>
                                                <td>${contact.comment}</td>
                                                <td>${contact.phone}</td>
                                                <td>${contact.created_at}</td>
                                                <c:if test="${contact.state == 1}">
                                                    <td style="color: #34c997!important;">
                                                        ACTIVE
                                                    </td>
                                                </c:if>
                                                <c:if test="${contact.state == 0}">
                                                    <td style="color: #ec4a58!important;">
                                                        BLOCK
                                                    </td>
                                                </c:if>
                                                <c:if test="${contact.state == 2}">
                                                    <td style="color: #4aecd4!important;">
                                                        REPLIED
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <c:if test="${contact.state == 2}">
                                                        <div class="btn-group mb-1">
                                                            <button type="button"
                                                                    class="btn btn-outline-success"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#infoUser-${contact.id}">Info
                                                            </button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${contact.state != 2}">
                                                    <div class="btn-group mb-1">
                                                        <button type="button"
                                                                class="btn btn-outline-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#infoUser-${contact.id}">Info
                                                        </button>
                                                        <button type="button"
                                                                class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                                                                data-bs-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false" data-display="static">
                                                            <span class="sr-only">Info</span>
                                                        </button>

                                                        <div class="dropdown-menu">
                                                            <c:if test="${contact.state == 1}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/contact/delete/${contact.id}"
                                                                        modelAttribute="contactDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Delete
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                            <c:if test="${contact.state == 0}">
                                                                <f:form method="post"
                                                                        action="/ekka/admin/contact/restore/${contact.id}"
                                                                        modelAttribute="contactDto"
                                                                        enctype="multipart/form-data">
                                                                    <button class="dropdown-item pl-3"
                                                                            type="submit">Restore
                                                                    </button>
                                                                </f:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </td>
                                            </tr>

                                            <!-- Info User Modal -->
                                            <div class="modal fade modal-add-contact" id="infoUser-${contact.id}"
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
                                                                            <div class="ec-t-review-item d-flex">
                                                                                <div class="ec-t-review-avtar">
                                                                                    <img style="border-radius: 50%;width: 100px;height: 100px;object-fit: cover;" src="${contact.user.avatar}"
                                                                                         alt=""/>
                                                                                </div>
                                                                                <div class="ec-t-review-content" style="padding: 10px;">
                                                                                    <div class="ec-t-review-top">
                                                                                        <div class="ec-t-review-name" style="text-align: left;">${contact.first_name} ${contact.last_name}</div>
                                                                                        <div class="ec-t-review-name" style="text-align: left;">${contact.email}</div>
                                                                                        <div class="ec-t-review-name" style="text-align: left;">${contact.phone}</div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                            <div class="ec-t-review-bottom" style="text-align: left;margin: 10px 0 10px 0;border: 2px solid;padding: 5px;border-radius: 10px;">
                                                                                <p style="text-align: left;">
                                                                                        ${contact.comment}
                                                                                </p>
                                                                            </div>
                                                                            <div class="d-flex justify-content-center align-items-center">
                                                                                    <c:if test="${contact.state == 1}"><a class="btn btn-success my-3 mr-2" href="#">ACTIVE</a></c:if>
                                                                                    <c:if test="${contact.state == 0}"><a class="btn btn-danger my-3 mr-2" href="#">BLOCK</a></c:if>
                                                                                    <c:if test="${contact.state == 2}"><a class="btn btn-info my-3 mr-2" href="#">REPLIED</a></c:if>

                                                                                <c:if test="${contact.state == 1}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/contact/delete/${contact.id}"
                                                                                            modelAttribute="contactDto"
                                                                                            enctype="multipart/form-data">
                                                                                        <button class="btn btn-outline-danger ml-2"
                                                                                                type="submit"><span
                                                                                                class="brand-delete mdi mdi-delete-outline"></span>
                                                                                        </button>
                                                                                    </f:form>
                                                                                </c:if>
                                                                                <c:if test="${contact.state == 0}">
                                                                                    <f:form method="post"
                                                                                            action="/ekka/admin/contact/restore/${contact.id}"
                                                                                            modelAttribute="contactDto"
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
                                                        <hr>
                                                        <div class="card bg-white profile-content">
                                                            <div class="row">
                                                                <div class="col-md-12 col-lg-12">
                                                                    <div class="card card-default">
                                                                        <c:if test="${contact.state == 2}">
                                                                            <div class="card-body text-center p-24px">
                                                                                <h3>REPLIED</h3>
                                                                                <div class="ec-t-review-item d-flex">
                                                                                    <div class="ec-t-review-content">
                                                                                        <div class="ec-t-review-top">
                                                                                            <div class="ec-t-review-name" style="text-align: left;">Ekka Shop -> ${contact.email}</div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                                                                <div class="ec-t-review-bottom">
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Hi ${contact.first_name} ${contact.last_name},</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Cảm ơn bạn đã gửi phản hồi đến ekka shop!</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Chúng tôi xin trả lời cho bình luận/câu hỏi của bạn:</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">${contact.reply}</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Đội ngũ Ekka Shop.</div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${contact.state != 2}">
                                                                            <div class="card-body text-center p-24px">
                                                                                <h3>FEEDBACK</h3>
                                                                                <div class="ec-t-review-item d-flex">
                                                                                    <div class="ec-t-review-content">
                                                                                        <div class="ec-t-review-top">
                                                                                            <div class="ec-t-review-name" style="text-align: left;">Ekka Shop</div>
                                                                                            <div class="ec-t-review-name" style="text-align: left;">vutuankiet2411@gmail.com</div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                                <f:form method="post" cssClass="ec-t-review-bottom my-2"
                                                                                        action="/ekka/admin/contact/reply/${contact.id}"
                                                                                        modelAttribute="contactDto"
                                                                                        enctype="multipart/form-data">
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Hi ${contact.first_name} ${contact.last_name},</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Cảm ơn bạn đã gửi phản hồi đến ekka shop!</div>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Chúng tôi xin trả lời cho bình luận/câu hỏi của bạn:</div>
                                                                                    <f:textarea path="reply" class="form-control" type="text" required="required"></f:textarea>
                                                                                    <div class="ec-t-review-name" style="text-align: left;">Đội ngũ Ekka Shop.</div>
                                                                                    <button class="btn btn-outline-info mt-2"
                                                                                            type="submit">Send
                                                                                    </button>
                                                                                </f:form>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer px-4 m-auto">
                                                            <button type="button" class="btn btn-secondary btn-pill"
                                                                    data-bs-dismiss="modal">Cancel
                                                            </button>
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
