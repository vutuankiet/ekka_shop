<%@page pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<link href="/css/user.css" rel="stylesheet"/>
<div class="container-fluid">
    <div >
        <h1>Đổi mật khẩu</h1>
    </div>
    <br>
</div>
<div class="container">
    <span style="color: red">${message}</span>
    <f:form method="post" action="/backend/user/change-password" modelAttribute="user" enctype="multipart/form-data">
        <div class="row">
            <div class="row g-3">
                <div class="col">
                    <f:input type="password" class="form-control" path="oldPassword" placeholder="Mật khẩu cũ" aria-label="Mật khẩu cũ"/>
                    <f:errors path="oldPassword" cssClass="error"></f:errors>
                </div>
            </div>
            <div class="row g-3">
                <div class="col">
                    <f:input type="password" class="form-control" path="password" placeholder="Mật khẩu" aria-label="Mật khẩu"/>
                    <f:errors path="password" cssClass="error"></f:errors>
                </div>
                <div class="col">
                    <f:input type="password" path="rePassword" class="form-control" placeholder="Nhập lại mật khẩu" aria-label="Nhập lại mật khẩu" />
                    <f:errors path="rePassword" cssClass="error"></f:errors>
                </div>
            </div>
        </div>
        <br>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4 g-3">Đỏi mật khẩu</button>
    </f:form>
</div>
<%@include file="/WEB-INF/views/common/foot.jsp"%>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#fileImage').attr('src', e.target.result).width(100);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>