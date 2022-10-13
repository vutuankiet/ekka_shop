<%@page pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<link href="/css/user.css" rel="stylesheet"/>
<div class="container-fluid">
    <div >
        <h1>Tạo mới tài khoản</h1>
    </div>
    <br>
</div>
<div class="container">
    <span style="color: red">${message}</span>
    <f:form method="post" action="/backend/user/save" modelAttribute="userDto" enctype="multipart/form-data">
        <div class="row">
            <div class="row g-3">
                <div class="col">
                    <f:input type="text" class="form-control" path="email" placeholder="Email" aria-label="Email"/>
                    <f:errors path="email" cssClass="error"></f:errors>
                </div>
                <div class="col">
                    <f:input type="text" path="fullName" class="form-control" placeholder="Họ và tên" aria-label="Họ và tên" />
                </div>
            </div>
            <div class="row g-3">
                <div class="col">
                    <f:input type="tel" class="form-control" path="phone" placeholder="Phone" aria-label="Phone"/>
                    <f:errors path="phone" cssClass="error"></f:errors>
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
            <div class="row g-3">
                <div class="col-4">
                    <f:input type="text" class="form-control"  path="address" placeholder="Địa chỉ" aria-label="Địa chỉ"/>

                </div>
                <div class="col-4">
                    <f:input type="file" id="inputImage" onchange="readURL(this);" cssStyle="display: none"  class="form-control" path="fileImage" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                    <label for="inputImage">Chọn ảnh đại diện</label>
                </div>
                <div class="col-4">
                    <img id="fileImage" src="#" alt="your image" />
                </div>


            </div>
        </div>
        <br>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4 g-3">Tạo mới</button>
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