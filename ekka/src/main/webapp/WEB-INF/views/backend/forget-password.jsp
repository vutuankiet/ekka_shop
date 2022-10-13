<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<style>
    .error {
        color: red;
    }

    .is-invalid {
        border-color: red;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      rel="stylesheet"
/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      rel="stylesheet"
/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.4.0/mdb.min.css"
      rel="stylesheet"
/>
<div class="container">
    <br>
    <span style="color: red">${message}</span>
    <form method="post" action="/forget-password">
        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <input type="text" id="form3Example1" name="email" class="form-control"/>
                    <label class="form-label" for="form3Example1">Email</label>
                </div>
            </div>
        </div>


        <!-- Submit button -->
        <button style="width: 10%" type="submit" class="btn btn-primary btn-block mb-4">Quên mật khẩu</button>

    </form>
</div>

<%--<%@include file="/WEB-INF/views/common/footer.jsp" %>--%>