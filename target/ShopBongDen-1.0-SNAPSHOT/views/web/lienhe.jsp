<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 15/11/2022
  Time: 1:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Liên hệ | LIGHT</title>
    <%@include file="/commons/web/link.jsp"%>
</head><!--/head-->

<body>
<header id="header"><!--header-->
    <%@include file="/commons/web/header.jsp"%>

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="home.jsp" class="active">Trang chủ</a></li>
                            <li class="dropdown"><a href="#">Cửa hàng<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="../../../shop.html">Sản phẩm</a></li>
                                    <li><a href="../../../product-details.html">Chi tiết sản phẩm</a></li>
                                    <li><a href="checkout.html">Thanh toán</a></li>
                                    <li><a href="cart.html">Giỏ hàng</a></li>
                                    <li><a href="login.html">Đăng nhập</a></li>
                                </ul>
                            </li>
                            <li><a href="blog.html">Tin tức</a></li>
                            <li><a href="contact-us.html">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input type="text" placeholder="Tìm kiếm"/>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->

<div id="contact-page" class="container">
    <div class="bg">

        <!--	    	<div class="row">    		-->
        <!--	    		<div class="col-sm-12">    			   			-->
        <!--					<h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				-->
        <!--					<div id="gmap" class="contact-map">-->
        <!--					</div>-->
        <!--				</div>			 		-->
        <!--			</div>    	-->
        <div class="row">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Trang chủ</a></li>
                    <li class="active">Liên hệ</li>
                </ol>
            </div><!--/breadcrums-->
            <div class="col-sm-8">
                <div class="contact-form">
                    <h2 class="title text-center">Liên hệ với chúng tôi</h2>
                    <div class="status alert alert-success" style="display: none"></div>
                    <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                        <div class="form-group col-md-6">
                            <input type="text" name="name" class="form-control" required="required" placeholder="Tên">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="email" name="email" class="form-control" required="required" placeholder="Email">
                        </div>
                        <div class="form-group col-md-12">
                            <input type="text" name="subject" class="form-control" required="required" placeholder="Chủ đề">
                        </div>
                        <div class="form-group col-md-12">
                            <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Nhập tin nhắn của bạn"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <input type="submit" name="submit" class="btn btn-primary pull-right" value="Gửi tin nhắn">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-info">
                    <h2 class="title text-center">Thông tin liên hệ</h2>
                    <address>
                        <p>CÔNG TY LIGHT</p>
                        <p>Địa chỉ: 31 Hoàng Quốc Việt,  P.Nghĩa Độ, </p>
                        <p> Q.Cầu giấy, Hà Nội</p>
                        <p>Hotline: 0989.04.32.39 - 0982.051.651</p>
                        <p>Fax: 1-714-252-0026</p>
                        <p>Email:lightVN@gmail.com</p>
                    </address>
                    <div class="social-networks">
                        <h2 class="title text-center">Phương tiện truyền thông</h2>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-youtube"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--/#contact-page-->

<%@include file="/commons/web/footer.jsp"%>
<%@include file="/commons/web/script.jsp"%>

</body>
</html>