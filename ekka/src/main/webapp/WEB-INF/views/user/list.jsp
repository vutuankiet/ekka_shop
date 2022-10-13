<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<div class="container-fluid">
    <div >
        <h1>Danh sách tài khoản</h1>
    </div>
    <br>
</div>
<div class="container">
    <%@include file="/WEB-INF/views/common/head_paging.jsp"%>
    <span style="color: red">${message}</span>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Ảnh đại diện</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Họ và tên</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Created_at</th>
            <th scope="col">State</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list.data}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                <td>
                    <c:if test="${user.avatar.contains('https://')}">
                        <img width="50px" src="${user.avatar}"/>
                    </c:if>
                    <c:if test="${!user.avatar.contains('https://')}">
                        <img width="50px" src="/image-file/${user.avatar}"/>
                    </c:if>

                </td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.fullName}</td>
                <td>${user.address}</td>
                <td>${user.created_at}</td>
                <td>${user.state}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%@include file="/WEB-INF/views/common/paging.jsp"%>
</div>
<%@include file="/WEB-INF/views/common/foot.jsp"%>