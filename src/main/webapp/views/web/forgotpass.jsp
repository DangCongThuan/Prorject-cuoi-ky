<%@include file="/commons/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Quên Mật Khẩu | LIGHT</title>
	<%@include file="/commons/web/link.jsp"%>
	<link href=" <c:url value="/templates/web/css/login_style.css" />" rel="stylesheet">

</head><!--/head-->

<body>
<header id="header"><!--header-->
	<%@include file="/commons/web/header.jsp" %>

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
							<li><a href="index.html" class="active">Trang chủ</a></li>
							<li class="dropdown"><a href="#">Cửa hàng<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="../../../shop.html">Sản phẩm</a></li>
									<li><a href="../../../product-details.html">Chi tiết sản phẩm</a></li>
									<li><a href="checkout.html">Thanh toán</a></li>
									<li><a href="cart.html">Giỏ hàng</a></li>
									<li><a href="login.html">Đăng nhập</a></li>
								</ul>
							</li>
							<li><a href="blog.html" >Tin tức</a></li>
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

	<section id="login_section">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Trang chủ</a></li>
					<li class="active">Quên mật khẩu</li>
				</ol>
			</div><!--/breadcrums-->
			<div class="row">
				<div class="center">

					<div class="container_login">

						<div class="text">
							Quên mật khẩu?</div>
						<form action="#">
							<div class="data forgot_text">
								<label>Nhập Email của bạn để đổi mật khẩu.</label>
							</div>
							<div class="data">
								<label>Email</label>
								<input type="email" required>
							</div>
							<div style="padding-bottom: 1px"></div>
							<div class="btn_login">

								<button  type="submit">Đồng ý</button>
							</div>
							<div class="signup-link">
								Trở lại đăng nhập? <a href="login.html">Đăng nhập ngay.</a></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@include file="/commons/web/footer.jsp"%>
<%@include file="/commons/web/script.jsp"%>
</body>
</html>