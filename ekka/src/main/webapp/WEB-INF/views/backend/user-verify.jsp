<%@page pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <f:form method="post" action="/user-verify" modelAttribute="user">
        <div class="row">
            <div class="row g-3">
                <div class="col">
                    <f:input type="email" class="form-control" path="email" placeholder="Mật khẩu cũ" aria-label="Mật khẩu cũ"/>
                    <f:errors path="email" cssClass="error"></f:errors>
                </div>
                <div class="col">
                    <f:input type="text" class="form-control" path="token" placeholder="Mật khẩu cũ" aria-label="Mật khẩu cũ"/>
                    <f:errors path="token" cssClass="error"></f:errors>
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