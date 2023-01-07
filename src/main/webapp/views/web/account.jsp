<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/7/2023
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/templates/account/form-account-style.css"/>" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2  bhoechie-tab-menu">
                <div class="list-group">
                    <a href="#" class="list-group-item active text-center">
                        <h4 class="glyphicon glyphicon-plane"></h4><br/> Tài khoản
                    </a>
                    <a href="#" class="list-group-item text-center">
                        <h4 class="glyphicon glyphicon-road"></h4><br/> Đặt lại mật
                        <khẩu></khẩu>
                    </a>
                    <a href="#" class="list-group-item text-center">
                        <h4 class="glyphicon glyphicon-home"></h4><br/>Hotel
                    </a>
                    <a href="#" class="list-group-item text-center">
                        <h4 class="glyphicon glyphicon-cutlery"></h4><br/>Restaurant
                    </a>
                    <a href="#" class="list-group-item text-center">
                        <h4 class="glyphicon glyphicon-credit-card"></h4><br/>Credit Card
                    </a>
                </div>
            </div>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <!-- Tài khoaản -->
                <div class="bhoechie-tab-content active">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Họ</label>
                                <input type="text" class="form-control" value="${USERMODEL.fistName}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tên</label>
                                <input type="text" class="form-control" value="${USERMODEL.lastName}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" value="${USERMODEL.lastName}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>SDT</label>
                                <input type="text" class="form-control" value="${USERMODEL.phoneNumber}">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-primary">Cập nhật</button>
                    </div>
                </div>
                <!-- Đổi mật khẩu -->
                <div class="bhoechie-tab-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mật khẩu cũ</label>
                                <input type="password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mật khẩu mới</label>
                                <input type="password" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Nhập lại mật khẩu mới</label>
                                <input type="password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-primary">Cập nhật</button>
                    </div>
                </div>
                <!-- Địa chỉ -->
                <div class="bhoechie-tab-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Họ</label>
                                <input type="password" value="${USERMODEL.firstName}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tên</label>
                                <input type="password" value="${USERMODEL.lastName}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" value="${USERMODEL.address}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Tỉnh / thành phố</label>
                                <input type="text" class="${USERMODEL.city}">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-primary">Cập nhật</button>
                    </div>
                </div>
                <!-- Yêu thích -->
                <div class="bhoechie-tab-content">
                </div>
                <!-- Đăng xuất -->
                <div class="bhoechie-tab-content">
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<script>
    $(function () {
        $("div.bhoechie-tab-menu>div.list-group>a").click(function (e) {
            e.preventDefault();
            $(this).siblings('a.active').removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
            $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
        });
    });
</script>
</body>
</html>
