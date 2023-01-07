<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 12/30/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="userAPIurl" value="/api-user"/>
<c:url var="registerUrl" value="/user-register"/>
<c:url var="loginUrl" value="trang-chu"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng Ký | LIGHT</title>
    <link href=" <c:url value="/templates/web/css/login_style.css" />" rel="stylesheet">
</head><!--/head-->

<body>
<section id="login_section">
    <div class="container">
        <div class="row">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a></li>
                    <li class="active">Đăng ký</li>
                </ol>
            </div><!--/breadcrums-->
            <div class="center">
                <div class="container_login">
                    <div class="text">Đăng ký</div>
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-${alert}">
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form id="userSubmitForm">
                        <div class="data">
                            <label for="fullName">Tên người dùng</label>
                            <input type="text" name="fullName">
                        </div>
                        <div class="data">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" required>
                        </div>
                        <div class="data">
                            <label for="password">Mật khẩu</label>
                            <input type="password" name="password" id="password" required>
                        </div>
                        <div class="data">
                            <label for="">Nhập lại mật khẩu</label>
                            <input type="password" name="passwordRepeated" id="passwordRepeated" required>
                        </div>
                        <div class="checkbox_term">
                            <input type="checkbox" name="checkTerm" id="check_term_btn" class="check_term_btn">
                            <span>Bằng việc đăng kí tài khoản bạn đã, đồng ý với
									<a href="#"> điều khoản sử dụng </a>của chúng tôi.</span>
                        </div>
                        <div class="btn_login">
                            <button id="registerBtn" type="submit">Đăng ký</button>
                        </div>
                        <div class="signup-link">
                            Đã có tài khoản? <a href="login.html">Đăng nhập ngay!</a></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $('#registerBtn').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#userSubmitForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
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
                    window.location.href = "${registerUrl}?typeAction=register&message="+ result.message;
                    } else {
                        window.location.href = "${loginUrl}?action=login&message="+ result.message;
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
