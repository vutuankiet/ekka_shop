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

    <title>Ekka - Admin Dashboard eCommerce HTML Template.</title>

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
                <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                    <div>
                        <h1>Add Product</h1>
                        <p class="breadcrumbs"><span><a href="/ekka/admin">Home</a></span>
                            <span><i class="mdi mdi-chevron-right"></i></span>Product</p>
                    </div>
                    <div>
                        <a href="/ekka/admin/product" class="btn btn-primary"> View All
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Add Product</h2>
                            </div>

                            <div class="card-body">
                                <div class="ec-vendor-uploads">
                                    <f:form method="post" action="/ekka/admin/product/save"
                                            modelAttribute="productDto"
                                            enctype="multipart/form-data" cssClass="row">
                                        <div class="col-lg-4 row">
                                            <div class="col-md-12 mb-25">
                                                <label class="form-label">Colors</label>
                                                <div class="d-flex align-items-start">
                                                    <f:checkbox path="color" class="checkbox-color1" value=""/>
                                                    <input type="color" class="color1 form-control form-control-color mr-2"
                                                           id="exampleColorInput1" value="" oninput="ChangeValueColor(this,'.checkbox-color1')"
                                                           title="Choose your color">
                                                    <f:checkbox path="color" class="checkbox-color2" value=""/>
                                                    <input type="color" class="color2 form-control form-control-color mx-2"
                                                           id="exampleColorInput1" value="" oninput="ChangeValueColor(this,'.checkbox-color2')"
                                                           title="Choose your color">
                                                    <f:checkbox path="color" class="checkbox-color3" value=""/>
                                                    <input type="color" class="color3 form-control form-control-color mx-2"
                                                           id="exampleColorInput3" value="" oninput="ChangeValueColor(this,'.checkbox-color3')"
                                                           title="Choose your color">
                                                    <f:checkbox path="color" class="checkbox-color4" value=""/>
                                                    <input type="color" class="color4 form-control form-control-color ml-2"
                                                           id="exampleColorInput1" value="" oninput="ChangeValueColor(this,'.checkbox-color4')"
                                                           title="Choose your color">
                                                </div>
                                                <f:errors path="color" cssClass="error"></f:errors>
                                            </div>
                                            <div class="col-md-12 mb-25">
                                                <label class="form-label">Size</label>
                                                <div class="form-checkbox-box">
                                                    <div class="form-check form-check-inline pl-0">
                                                        <f:checkbox path="size" value="S"/>
                                                        <label>S</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <f:checkbox path="size" value="M"/>
                                                        <label>M</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <f:checkbox path="size" value="L"/>
                                                        <label>L</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <f:checkbox path="size" value="XL"/>
                                                        <label>XL</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <f:checkbox path="size" value="XXL"/>
                                                        <label>XXL</label>
                                                    </div>
                                                </div>
                                                <f:errors path="size" cssClass="error"></f:errors>
                                            </div>
                                            <div class="col-md-12 ec-vendor-img-upload">
                                                <div class="ec-vendor-main-img">
                                                    <div class="avatar-upload">
                                                        <div class="avatar-edit">
                                                            <f:input type="file" id="imageUpload"
                                                                     cssClass="ec-image-upload" path="fileImage"
                                                                     placeholder="Chọn file"
                                                                     aria-label="Ảnh đại diện" required="required"/>
                                                            <label for="imageUpload"><img
                                                                    src="/admin/assets/img/icons/edit.svg"
                                                                    class="svg_img header_svg" alt="edit"/></label>
                                                        </div>
                                                        <div class="avatar-preview ec-preview">
                                                            <div class="imagePreview ec-div-preview">
                                                                <img class="ec-image-preview"
                                                                     src="/admin/assets/img/products/vender-upload-preview.jpg"
                                                                     alt="edit"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-upload-set colo-md-12">
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload01"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload02"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload03"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload04"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload05"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="thumb-upload">
                                                            <div class="thumb-edit">
                                                                <f:input type="file" id="thumbUpload06"
                                                                         cssClass="ec-image-upload" path="fileImage"
                                                                         placeholder="Chọn file"
                                                                         aria-label="Ảnh đại diện" required="required"/>
                                                                <label for="imageUpload"><img
                                                                        src="/admin/assets/img/icons/edit.svg"
                                                                        class="svg_img header_svg" alt="edit"/></label>
                                                            </div>
                                                            <div class="thumb-preview ec-preview">
                                                                <div class="image-thumb-preview">
                                                                    <img class="image-thumb-preview ec-image-preview"
                                                                         src="/admin/assets/img/products/vender-upload-thumb-preview.jpg"
                                                                         alt="edit"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="ec-vendor-upload-detail">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label for="inputEmail4" class="form-label">Product
                                                            name*</label>
                                                        <f:input type="text" id="inputEmail4" path="productName"
                                                                 class="form-control slug-title"
                                                                 placeholder="Enter your product name"
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Select Categories</label>
                                                        <f:select path="categoryId" class="form-control"
                                                                  required="required">
                                                            <option value="">--Gender Category--</option>
                                                            <c:forEach items="${genderCategoryDto}"
                                                                       var="genderCategoryDto">

                                                                <c:forEach items="${listCategory}" var="listCategory">
                                                                    <c:if test="${genderCategoryDto.id == listCategory.genderCategory.id}">
                                                                        <f:option class="form-control"
                                                                                  value="${listCategory.id}">${genderCategoryDto.genderCategoryName} - ${listCategory.categoryName}</f:option>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </c:forEach>
                                                        </f:select>
                                                            <%--                                                        <select name="categories" id="Categories" class="form-select">--%>
                                                            <%--                                                            <optgroup label="Fashion">--%>
                                                            <%--                                                                <option value="t-shirt">T-shirt</option>--%>
                                                            <%--                                                                <option value="dress">Dress</option>--%>
                                                            <%--                                                            </optgroup>--%>
                                                            <%--                                                        </select>--%>
                                                    </div>
                                                        <%--                                                    <div class="col-md-12">--%>
                                                        <%--                                                        <label class="form-label">Sort Description</label>--%>
                                                        <%--                                                        <textarea class="form-control" rows="2"></textarea>--%>
                                                        <%--                                                    </div>--%>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Sort Description</label>
                                                        <f:textarea path="details" rows="2" cssClass="form-control"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Price*<span>( In USD
																)</span></label>
                                                        <f:input type="number" id="price1" path="priceProduct"
                                                                 class="form-control"
                                                                 placeholder="Enter your product name"
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Quantity</label>
                                                        <f:input type="number" id="quantity1" path="totalProduct"
                                                                 class="form-control"
                                                                 placeholder="Enter your product name"
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Ful Detail</label>
                                                        <f:textarea path="moreInformation" rows="4"
                                                                    cssClass="form-control"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Select Brand*</label>
                                                        <f:select path="brandId" class="form-control"
                                                                  required="required">
                                                            <option value="">--Brand--</option>
                                                            <c:forEach items="${brandDto}"
                                                                       var="brandDto">
                                                                <f:option class="form-control"
                                                                          value="${brandDto.id}">${brandDto.nameBrand}</f:option>
                                                            </c:forEach>
                                                        </f:select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Discount<span>( % )</span></label>
                                                        <f:input type="number" id="quantity1" path="discount"
                                                                 class="form-control"
                                                                 placeholder="Enter your product name"
                                                                 aria-label="Enter your product name"
                                                                 required="required"/>
                                                    </div>
                                                    <div class="col-md-12 mt-3">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
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
            </div> <!-- End Content -->
        </div> <!-- End Content Wrapper -->

        <!-- Footer -->
        <%@include file="/WEB-INF/views/layout/admin/foot.jsp" %>


    </div> <!-- End Page Wrapper -->
</div> <!-- End Wrapper -->

<%@include file="/WEB-INF/views/layout/admin/scripts.jsp" %>
<script>
    function ChangeValueColor(e,target) {
        // console.log(e.previousElementSibling);
        // let color1 = document.querySelector(`.color1`);
        let checkboxColor1 = document.querySelector(target);
        checkboxColor1.setAttribute("value", e.value);
    }
</script>
</body>
</html>
