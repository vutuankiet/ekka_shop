<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ec-pro-pagination justify-content-center">
    <%--                        <span>Showing 1-12 of 21 item(s)</span>--%>
    <ul class="ec-pro-pagination-inner">
        <li class="<c:if test="${list.page == 1}">disabled</c:if>">
            <a
               href="/ekka/${list.path}?page=${list.page - 1}&perpage=${list.perpage}&key=${list.key}"
               tabindex="-1" aria-disabled="true"><i class="fa-solid fa-backward"></i></a>
        </li>
        <c:forEach begin="1" end="${list.numberPage}" step="1" var="p">
            <li>
                <a class="<c:if test="${p==list.page}">active</c:if>"
                   href="/ekka/${list.path}?page=${p}&perpage=${list.perpage}&key=${list.key}">${p}</a>
            </li>
        </c:forEach>
        <li class="<c:if test="${list.page == list.numberPage}">disabled</c:if>">
            <a
               href="/ekka/${list.path}?page=${list.page + 1}&perpage=${list.perpage}&key=${list.key}"><i class="fa-solid fa-forward"></i></a>
        </li>
    </ul>
</div>