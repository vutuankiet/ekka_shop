<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>dashboard</title>
    <%@include file="/WEB-INF/views/layout/admin/assets.jsp" %>
    <%@include file="/WEB-INF/views/layout/admin/bootstrap.jsp" %>

</head>
<body>
<%--<div id="preloader"></div>--%>
<!-- Preloader End Here -->
<div id="wrapper" class="wrapper bg-ash">
    <%@include file="/WEB-INF/views/layout/admin/top_navbar.jsp" %>

    <div class="dashboard-page-one">
        <%@include file="/WEB-INF/views/layout/admin/sidebar.jsp" %>
        <div class="dashboard-content-one">
            <%--        content--%>
            <div>
                <%--                //body--%>

                <div class="container-fluid">
                    <div >
                        <h1>Tạo mới tài khoản</h1>
                    </div>
                    <br>
                </div>
                <div class="container">
                    <span style="color: red">${message}</span>
                    <f:form method="post" action="/ekka/admin/user/update" modelAttribute="userDto" enctype="multipart/form-data">
                        <div class="row">
                            <div class="row g-3">
                                <div class="col">
                                    <f:input type="text" class="form-control" path="id" placeholder="id" aria-label="id"/>
                                    <f:errors path="email" cssClass="error"></f:errors>
                                </div>
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
                                    <f:input type="password" class="form-control" path="password" placeholder="Mật khẩu" aria-label="Mật khẩu"/>
                                    <f:errors path="password" cssClass="error"></f:errors>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col">
                                    <f:input type="text" class="form-control"  path="address" placeholder="Địa chỉ" aria-label="Địa chỉ"/>

                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col">
                                    <f:input type="text" class="form-control"  path="money" placeholder="Money" aria-label="Money"/>

                                </div>
                            </div>
                            <div class="col-4">
                                <f:input type="file" id="inputImage" class="form-control" path="avatar" placeholder="Chọn file" aria-label="Ảnh đại diện"/>
                                <label for="inputImage">Chọn ảnh đại diện</label>
                            </div>
                        </div>
                        <br>
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4 g-3">Tạo mới</button>
                    </f:form>
                </div>


                <%--                //end body--%>
            </div>
            <%@include file="/WEB-INF/views/layout/admin/foot.jsp" %>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/views/layout/admin/scripts.jsp" %>
<%--<script>--%>
<%--    function readURL(input) {--%>
<%--        // for (let i = 0; i < input.files.length; i++) {--%>
<%--        if (input.files && input.files[0]) {--%>
<%--            var reader = new FileReader();--%>

<%--            reader.onload = function (e) {--%>
<%--                document.getElementById("fileImage").innerHTML += `<img src="` + e.target.result + `" style="width: 100px" alt="your image" />`;--%>
<%--            };--%>

<%--            reader.readAsDataURL(input.files[0]);--%>
<%--            // console.log(input.files[i])--%>
<%--        }--%>
<%--        // }--%>
<%--        // console.log(input.files.length)--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
