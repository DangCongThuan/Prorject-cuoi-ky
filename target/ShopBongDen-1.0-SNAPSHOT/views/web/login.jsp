<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 12/30/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đăng Nhập | LIGHT</title>
  <link href=" <c:url value="/templates/web/css/login_style.css" />" rel="stylesheet">
</head><!--/head-->

<body>


<section id="login_section">
  <div class="container">
    <div class="row">
      <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="#">Trang chủ</a></li>
          <li class="active">Đăng nhập</li>
        </ol>
      </div><!--/breadcrums-->
      <div class="center">

        <div class="container_login">
          <div class="text">Đăng nhập</div>
          <c:if test="${not empty messageResponse}">
            <div class="alert alert-${alert}">
                ${messageResponse}
            </div>
          </c:if>

          <form action="<c:url value="/dang-nhap"/>" id="formLogin" method="post">
            <div class="data">
              <label>Email</label>
              <input type="email" name="email" required>
            </div>
            <div class="data">
              <label>Mật khẩu</label>
              <input type="password" name="password" required>
            </div>
            <div class="forgot-pass">
              <a href="forgotpass.html">Quên mật khẩu?</a>
            </div>
            <div class="btn_login">
              <input type="hidden" value="login" name="action" >
              <button  type="submit">Đăng nhập</button>
            </div>
            <div class="signup-link">
              Không có tài khoản? <a href="../../../register.html">Đăng ký ngay</a></div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
