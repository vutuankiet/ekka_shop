<%@page pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<style>
    .error {
        color: red;
    }
</style>
<div class="container-fluid">
    <div >
        <h1>Tạo mới nhãn hiệu</h1>
    </div>
    <br>
</div>
<div class="container">
    <span style="color: red">${message}</span>
    <form id="brandForm" method="post" action="/brand/save">
        <div class="form-outline mb-4">
            <input type="text" id="form4Example1" name="name" class="form-control" />
            <label class="form-label" for="form4Example1">Name</label>
        </div>
        <!-- Email input -->
        <div class="form-outline mb-4">
            <input type="text" name="description" id="form4Example2" class="form-control" />
            <label class="form-label" for="form4Example2">Mô tả</label>
        </div>

        <div class="form-outline mb-4">
            <input type="password" id="code" name="code" class="form-control" />
            <label class="form-label" for="form4Example1">Mã code</label>
        </div>
        <!-- Email input -->
        <div class="form-outline mb-4">
            <input type="password" name="code_confirm" id="form4Example2" class="form-control" />
            <label class="form-label" for="form4Example2">Nhập lại mã code</label>
        </div>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Tạo mới</button>
    </form>
</div>
<%@include file="/WEB-INF/views/common/foot.jsp"%>

<script>
    $(document).ready(function(){
        $( "#brandForm" ).validate({
            rules: {
                name: {
                    required: true,
                    minlength: 10
                },
                code :{
                    required: true,
                    minlength:6
                },
                code_confirm :{
                    required: true,
                    minlength:6,
                    equalTo: "#code"
                }
            },
            messages: {
                name: {
                    required: "Bắt buộc nhập tên thương hiệu",
                    minlength: "Tên ít nhất 10 ký tự"
                },
                code :{
                    required: "Bắt buộc nhập mã code",
                    minlength: "Tên ít nhất 6 ký tự"
                },
                code_confirm :{
                    required: "Bắt buộc nhập lại mã code",
                    minlength: "Tên ít nhất 6 ký tự",
                    equalTo: "mã code không trùng khớp"
                }
            }
        });
    })
    console.log("Hello2");
</script>