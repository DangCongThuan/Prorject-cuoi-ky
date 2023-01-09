<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 12/30/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Trang đăng nhập</title>
    <link href=" <c:url value="/templates/web/login_style.css" />" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="breadcrumbs">
            <ol class="breadcrumb" style="margin-bottom: 15px !important;">
                <li><a href="#">Trang chủ</a></li>
                <li class="active">Đăng nhập</li>
            </ol>
        </div><!--/breadcrums-->
    </div>
    <div class="row main-content bg-success text-center">
        <div class="col-md-4 text-center company__info">
            <span class="company__logo"><h2><span class="fa fa-lightbulb-o"></span></h2></span>
<%--            <h4 class="company_title">Your Company Logo</h4>--%>
        </div>
        <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
            <div class="container-fluid">
                <div class="row">
                    <h2>Log In</h2>
                </div>
                <div class="row">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-${alert}">
                                ${messageResponse}
                        </div>
                    </c:if>

                    <form action="<c:url value="/dang-nhap"/>" method="post" class="form-group">
                        <div class="row">
                            <input type="email" name="email" id="email" class="form__input"
                                   placeholder="Email">
                        </div>
                        <div class="row">
                            <!-- <span class="fa fa-lock"></span> -->
                            <input type="password" name="password" id="password" class="form__input"
                                   placeholder="Mật khẩu">
                        </div>
                        <div class="row">
                            <input type="checkbox" name="rememberMme" id="rememberMe" class="">
                            <label for="rememberMe">Nhớ tôi đăng nhập</label>
                        </div>
                        <div class="row">
                            <input type="hidden" value="login" name="action" >
                            <input type="submit" value="Đăng nhập" class="btn">
                        </div>
                    </form>
                </div>
                <div class="row">
                    <p>Don't have an account? <a href="#">Register Here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>