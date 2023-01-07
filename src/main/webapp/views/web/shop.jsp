<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cửa Hàng | LIGHT</title>
    <script type="text/javascript" src="<c:url value='/templates/paging/jquery.twbsPagination.js' />"></script>
</head><!--/head-->

<body>
<section id="advertisement">
    <div class="container">
        <img style="width: 1200px;" src="<c:url value = "/templates/web/images/shop/img_slide.png" />" alt="" title="#htmlcaption1">
    </div>
</section>
<section>
    <div class="container">
        <div class="row">
<%--			Các thành phần bên trái--%>
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <%@include file="/commons/web/danhmuc.jsp" %>
                    <div class="panel-group category-products" id="accordian2">
                        <div class="price-range"><!--price-range-->
                            <h2>phạm vi giá</h2>
                            <div class="well">
                                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600"
                                       data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br/>
                                <b>0đ</b> <b class="pull-right">600.000đ</b>
                            </div>
                        </div><!--/price-range-->
                    </div>
<%--					Phần quảng cáo--%>
                    <%@include file="/commons/web/quangcao.jsp" %>
                </div>
            </div>
<%--Hiển thị sản phẩm--%>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h3 class="title text-center" style="color: #fe980f;font-size: 35px">Danh sách sản phẩm</h3>
<%--					Dùng vòng lặp để hiển thị danh sách--%>
                    <c:forEach var="item" items="${model.listResult}">
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
<%--											Hiển thị hình ảnh sản phẩm--%>
                                        <img src="<c:url value="/UploadDownloadFileServlet?fileName=${item.thumbnail}"></c:url>"
                                             alt="" class="img-responsive">
<%--											Giá sản phẩm--%>
                                        <h2>${item.price} đ</h2>
<%--											Tên sản phẩm--%>
                                        <p>${item.name}</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${item.price} đ</h2>
                                            <p>${item.categoryName}</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                    class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href=""><i class="fa fa-plus-square"></i>Thêm vào danh sách yêu thích</a>
                                        </li>
                                        <li><a href=""><i class="fa fa-plus-square"></i>Thêm vào để so sánh</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div><!--features_items-->
<%--				Phần phân trang--%>
                <div class="row">
                    <div class="col-sm-12">
                        <form action="<c:url value="/danh-sach-san-pham"/>" id="pageChange" method="get">
                            <div class="text-center" aria-label="Page navigation">
                                <ul class="pagination" id="pagination"></ul>
                            </div>
                            <input type="hidden" value="" id="page" name="page">
                            <input type="hidden" value="" id="maxPageItems" name="maxPageItems">
                            <input type="hidden" value="" id="sortName" name="sortName">
                            <input type="hidden" value="" id="sortBy" name="sortBy">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    var totalPages = Number('${model.totalPages}');
    var currentPage = Number('${model.page}');
    var limit = 9;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#page').val(page);
                    $('#maxPageItems').val(limit);
                    $('#sortBy').val('desc');
                    $('#sortName').val("price");

                    $('#pageChange').submit();
                }
            }
        });
    });
</script>
</body>
</html>