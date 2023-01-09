<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/8/2023
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
<c:url var="userAPIurl" value="/api-user"/>
<c:url var="registerUrl" value="/user-register"/>
<c:url var="loginUrl" value="trang-chu"/>
<html>
<head>
    <title>Title</title>
    <link href=" <c:url value="/templates/web/register.css" />" rel="stylesheet">
</head>
<body>
<div class="form-bg">
    <div class="container">
        <div class="row">
            <div class="breadcrumbs">
                <ol class="breadcrumb" style="margin-bottom: 15px !important;">
                    <li><a href="#">Trang chủ</a></li>
                    <li class="active">Đăng ký</li>
                </ol>
            </div><!--/breadcrums-->
            <div class="col-md-offset-2 col-md-8 form-container">
                <h3 class="title">Đăng ký</h3>
                <c:if test="${not empty messageResponse}">
                    <div class="alert alert-${alert}">
                            ${messageResponse}
                    </div>
                </c:if>
                <form id="userForm" class="row form-horizontal">
                    <div class="form-group">
                        <label>Họ</label>
                        <input id="firstName" name="firstName" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Tên</label>
                        <input id="lastName" name="lastName" type="text" class="form-control">
                    </div>
                    <div>
                        <div class="row form-group">
                            <label>Email</label>
                            <input id="email" name="email" type="email" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <input id="password" name="password" type="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nhập lại mật khẩu</label>
                        <input id="confirmPassword" name="confirmPassword" type="password" class="form-control">
                    </div>
                    <h4 class="sub-title">Thông tin cá nhân</h4>
                    <div class="form-group">
                        <label>SDT</label>
                        <input name="phoneNumber" id="phoneNumber" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Thành phố</label>
                        <input name="city" id="city" type="text" class="form-control">
                        <%--                        <select class="form-control">--%>
                        <%--                            <option value="paris">Paris</option>--%>
                        <%--                            <option value="new york">New York</option>--%>
                        <%--                        </select>--%>
                    </div>

                    <div STYLE="width: 100%" class="row form-group">
                        <label>Địa chỉ chi tiết</label>
                        <input style="width: 100%" id="address" name="address" type="text" class="form-control">
                    </div>
                    <div class="check-terms">
                        <input id="checkTerm" name="checkTerm" type="checkbox" class="checkbox">
                        <span class="check-label">Tôi đồng ý với các điều khoản</span>
                    </div>
                    <span class="signin-link">Đã có tài khoản? Nhấn vào đây để <a href="">Đăng nhập</a></span>
                    <button id="registerBtn" class="btn signup">Đăng ký</button>
                </form>
            </div><!--/register-->
        </div>
    </div>
</div>
</div>
<script>
    $('#registerBtn').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#userForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        console.log(data);
        addUser(data);
    });

    function addUser(data) {
        $.ajax({
            url: '${userAPIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if (result.id == null) {
                    window.location.href = "${registerUrl}?typeAction=register&message=" + result.message;
                } else {
                    window.location.href = "${loginUrl}?action=login&message=" + result.message;
                }
            },
            error: function (error) {
                window.location.href = "${registerUrl}?typeAction=register&message=error_system";
            }
        });
    }
</script>
</body>
</html>
