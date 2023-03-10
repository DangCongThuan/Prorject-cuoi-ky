<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 14/11/2022
  Time: 6:06 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header"><!--header-->

    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> 0989.04.3239 - 0982.051.651</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> lightVN@gmail.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">

                        <a href=" <c:url value="/trang-chu" />"><img
                                src=" <c:url value="/templates/web/images/home/logo.png" />" alt=""/></a>
                    </div>
                    <div class="btn-group pull-right">

                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="mainmenu pull-right">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Gi??? h??ng</a></li>
                            <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Thanh to??n</a></li>
<%--                            Ki???m tra ????ng nh???p hay ch??a--%>
                            <c:if test="${empty USERMODEL}">
                                        <li><a href="<c:url value="/user-register?typeAction=register"/>"><i class="fa fa-plus"></i> ????ng K??</a></li>
                                        <li><a href="<c:url value="/dang-nhap?action=login"/>">
                                            <i class="fa fa-sign-in"></i> ????ng Nh???p</a></li>
                            </c:if>
                            <c:if test="${not empty USERMODEL}">
                                <li><a href="#"><i class="fa fa-user"></i>T??i kho???n, ${USERMODEL.firstName}</a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<c:url value="/views/web/account.jsp"/>"><i class="fa fa-edit"></i> C??i ?????t</a></li>
                                        <li><a href="<c:url value="/thoat?action=logout"/>"><i
                                                class="fa fa-sign-out"></i> Tho??t </a></li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.html" class="active">Trang ch???</a></li>
                            <li class="dropdown"><a href="#">C???a h??ng<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
<%--                                    ???????ng d???n ?????n trang S???n ph???m--%>
                                    <c:url var="shopURL" value="/danh-sach-san-pham">
                                        <c:param name="page" value="1"/>
                                        <c:param name="sortBy" value="asc"/>
                                        <c:param name="sortName" value="product_name"/>
                                    </c:url>
                                    <li><a href="${shopURL}">S???n ph???m</a></li>
                                    <li><a href="../../../product-details.html">Chi ti???t s???n ph???m</a></li>
                                    <li><a href="checkout.html">Thanh to??n</a></li>
                                    <li><a href="cart.html">Gi??? h??ng</a></li>


                                </ul>
                            </li>
                            <li><a href="blog.html">Tin t???c</a></li>
                            <li><a href="contact-us.html">Li??n h???</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class=" pull-right">
                        <form action="/danh-sach-san-pham" method="get" class="searchform">
                            <label>
                                <input id="searchBy" name="searchBy" type="text" placeholder="T??m ki???m"/>
                                <input type="hidden" id="typeAction" name="typeAction" value="search">
                            </label>
                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->

</header>
<!--/header-->
