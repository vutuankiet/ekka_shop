<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row ">
    <div class="col-4 d-flex">
        <input class="form-control" id="search" value="${list.key}"/>
        <button id="btnSearch" onclick="search()">Tìm</button>
    </div>
    <script>
        var search = function() {
            window.location.href = "/backend/${list.path}/list?page=${list.page - 1}&perpage=${list.perpage}&key=" + document.getElementById("search").value;
        }

    </script>
</div>