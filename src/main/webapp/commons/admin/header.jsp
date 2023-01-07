<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/3/2023
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
<!--header start-->
<header class="header fixed-top clearfix">
    <!--logo start-->
    <div class="brand">
        <a href="<c:url value="/admin-home"/>" class="logo">
            ADMIN
        </a>
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars"></div>
        </div>
    </div>
    <!--logo end-->

    <div class="top-nav clearfix">
        <!--search & user info start-->
        <ul class="nav pull-right top-menu">
            <li>
                <input type="text" class="form-control search" placeholder=" Search">
            </li>
            <!-- user login dropdown start-->
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <span class="username">${USERMODEL.fullName}</span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu extended logout">
                    <li><a href="#"><i class=" fa fa-suitcase"></i>Thông tin</a></li>
                    <li><a href="#"><i class="fa fa-cog"></i> Cài đặt</a></li>
                    <li><a href="<c:url value="/thoat?action=logout"/>"><i class="fa fa-key"></i> Đăng xuất</a></li>
                </ul>
            </li>
            <!-- user login dropdown end -->

        </ul>
        <!--search & user info end-->
    </div>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="danh-muc-admin" href="<c:url value="/admin-home"/>">
                        <i class="fa fa-dashboard"></i>
                        <span>Tổng quan</span>
                    </a>
                </li>

                <li>
                    <a class="danh-muc-admin" href="quanlynguoidung.html">
                        <i class="fa fa-user"></i>
                        <span>Quản lý người dùng</span>
                    </a>
                </li>


                <li class="sub-menu">
                    <a class="parents" href="#;'">
                        <i class="fa fa-book"></i>
                        <span>Danh mục sản phẩm</span>
                    </a>
                    <ul class="sub">
                        <c:url var="eCategoryURL" value="/admin-edit-danh-muc">
                            <c:param name="typeAction" value="edit"/>
                        </c:url>
                        <li><a class="danh-muc-admin" href="${eCategoryURL}">Thêm danh mục</a></li>

                        <c:url var="lCategoryUrl" value="/admin-list-danh-muc">
                            <c:param name="typeAction" value="list"/>
                            <c:param name="page" value="1"/>
                            <c:param name="sortName" value="category_name"/>
                            <c:param name="sortBy" value="asc"/>
                        </c:url>
                        <li><a class="danh-muc-admin" href="${lCategoryUrl}">Liệt kê danh mục</a></li>

                    </ul>
                </li>

                <li class="sub-menu">
                    <a class="parents" href="#;'">
                        <i class="fa fa-book"></i>
                        <span> Sản phẩm</span>
                    </a>
                    <ul class="sub">
                        <%--                        đường dẫn vào Phần thêm sản phẩm--%>
                        <c:url var="eProductURL" value="/admin-san-pham">
                            <c:param name="typeAction" value="edit"/>
                        </c:url>
                        <li><a class="danh-muc-admin" href="${eProductURL}">Thêm sản phẩm</a></li>
<%--                        đường dẫn vào Phần liệt kê sản phẩm--%>
                        <c:url var="lProductURL" value="/admin-san-pham">
                            <c:param name="typeAction" value="list"/>
                            <c:param name="page" value="1"/>
                            <c:param name="sortName" value="product_name"/>
                            <c:param name="sortBy" value="asc"/>
                        </c:url>
                        <li><a class="danh-muc-admin" href="${lProductURL}">liệt kê sản phẩm</a></li>

                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="parents" href="#;'">
                        <i class="fa fa-credit-card"></i>
                        <span> Đơn hàng</span>
                    </a>
                    <ul class="sub">
                        <li><a class="danh-muc-admin" href="qldonhang.html">Quản lý đơn hàng</a></li>

                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascrip:;">
                        <i class="fa fa-barcode"></i>
                        <span> Mã giảm giá</span>
                    </a>
                    <ul class="sub">
                        <li><a class="danh-muc-admin" href="thêmmagiamgia.html">Thêm mã giảm giá</a></li>
                        <li><a class="danh-muc-admin" href="lietmagiamgia.html">liệt kê mã giảm giá </a></li>

                    </ul>
                </li>


            </ul>
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>

<%--<script>--%>
<%--    // Add active class to the current button (highlight it)--%>
<%--    var header = document.getElementById("nav-accordion");--%>
<%--    var btns = header.getElementsByClassName("danh-muc-admin");--%>
<%--    for (var i = 0; i < btns.length; i++) {--%>

<%--        if (btns[i].pathname == window.location.pathname) {--%>
<%--            console.log(btns[i].pathname + " ten danh muc");--%>
<%--            console.log(window.location.pathname + " ten local muc");--%>
<%--            btns[i].className += " active";--%>
<%--        }--%>
<%--    }--%>
<%--    var parents = document.getElementsByName("parents");--%>
<%--    for (var i = 0; i < parents.length; i++) {--%>
<%--    }--%>
<%--</script>--%>