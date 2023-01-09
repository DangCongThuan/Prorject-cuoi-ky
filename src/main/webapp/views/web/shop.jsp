<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cửa Hàng | LIGHT</title>
    <script type="text/javascript" src="<c:url value='/templates/paging/jquery.twbsPagination.js' />"></script>
</head><!--/head-->

<body>
<section id="advertisement">
    <div class="container">
        <img style="width: 1200px;" src="<c:url value = "/templates/web/images/shop/img_slide.png" />" alt=""
             title="#htmlcaption1">
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
                    <%--                    <%@include file="/commons/web/quangcao.jsp" %>--%>
                </div>
            </div>
            <%--Hiển thị sản phẩm--%>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h3 class="title text-center" style="color: #fe980f;font-size: 35px">Danh sách sản phẩm</h3>
                    <div class="row">
                        <div class="col-sm-8 mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li style="padding: 10px 5px"><a>Trang chủ /</a></li>
                                <li style="padding: 10px 5px"><a>Shop /</a></li>
                                <li class="active" style="padding: 10px 5px"><a>${model.categoryName}</a></li>
                                <c:if test="${not empty model.searchBy}">
                                    <li class="active" style="padding: 10px 5px"><a>/ kết quả tìm kiếm cho "${model.searchBy}"</a></li>
                                </c:if>
                                <li class="active" style="padding: 10px 5px"><a>(${model.totalItems} sản phẩm)</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-4 mainmenu">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li style="padding: 10px 5px"><a>Hiển thị: </a></li>
                                <c:url var="max9" value="/danh-sach-san-pham">
                                    <c:param name="sortBy" value="${model.sortBy}"/>
                                    <c:param name="sortName" value="${model.sortName}"/>
                                    <c:param name="page" value="${model.page}"/>
                                    <c:param name="maxPageItems" value="9"/>
                                    <c:param name="categoryName" value="${model.categoryName}"/>
                                </c:url>
                                <li style="padding: 10px 0"><a
                                        href="${max9}">9</a></li>
                                <c:url var="max12" value="/danh-sach-san-pham">
                                    <c:param name="sortBy" value="${model.sortBy}"/>
                                    <c:param name="sortName" value="${model.sortName}"/>
                                    <c:param name="page" value="${model.page}"/>
                                    <c:param name="maxPageItems" value="12"/>
                                    <c:param name="categoryName" value="${model.categoryName}"/>
                                </c:url>
                                <li style="padding: 10px 0"><a
                                        href="${max12}">/ 12</a></li>
                                <c:url var="max15" value="/danh-sach-san-pham">
                                    <c:param name="sortBy" value="${model.sortBy}"/>
                                    <c:param name="sortName" value="${model.sortName}"/>
                                    <c:param name="page" value="${model.page}"/>
                                    <c:param name="maxPageItems" value="15"/>
                                    <c:param name="categoryName" value="${model.categoryName}"/>
                                </c:url>
                                <li style="padding: 10px 0"><a
                                        href="${max15}">/ 15</a></li>
                            </ul>
                            <div class=" dropdown pull-right">
                                    <button style="margin-top: 0;" class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Lọc
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li></li>
                                        <c:url var="inPrice" value="/danh-sach-san-pham">
                                            <c:param name="sortBy" value="asc"/>
                                            <c:param name="sortName" value="price"/>
                                            <c:param name="page" value="${model.page}"/>
                                            <c:param name="maxPageItems" value="${model.maxPageItems}"/>
                                            <c:param name="categoryName" value="${model.categoryName}"/>
                                        </c:url>
                                        <li>
                                            <a href="${inPrice}">Giá tăng dần</a>
                                        </li>
                                        <c:url var="dePrice" value="/danh-sach-san-pham">
                                            <c:param name="sortBy" value="desc"/>
                                            <c:param name="sortName" value="price"/>
                                            <c:param name="page" value="${model.page}"/>
                                            <c:param name="maxPageItems" value="${model.maxPageItems}"/>
                                            <c:param name="categoryName" value="${model.categoryName}"/>
                                        </c:url>
                                        <li><a href="${dePrice}">Giá giảm dần</a></li>
                                        <c:url var="oldest" value="/danh-sach-san-pham">
                                            <c:param name="sortBy" value="desc"/>
                                            <c:param name="sortName" value="created_date"/>
                                            <c:param name="page" value="${model.page}"/>
                                            <c:param name="maxPageItems" value="${model.maxPageItems}"/>
                                            <c:param name="categoryName" value="${model.categoryName}"/>
                                        </c:url>
                                        <li><a href="${oldest}">Cũ nhất</a></li>
                                        <c:url var="newest" value="/danh-sach-san-pham">
                                            <c:param name="sortBy" value="asc"/>
                                            <c:param name="sortName" value="created_date"/>
                                            <c:param name="page" value="${model.page}"/>
                                            <c:param name="maxPageItems" value="${model.maxPageItems}"/>
                                            <c:param name="categoryName" value="${model.categoryName}"/>
                                        </c:url>
                                        <li><a href="${newest}">Mới nhất</a></li>
                                    </ul>
                        </div>

                    </div>
                    <hr>
                </div>
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
                                    <li><a href="<c:url value="/danh-sach-san-pham?typeAction=shows&id=${item.id}"/>"><i class="fa fa-plus-square"></i>Xem thông tin</a></li>
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
                        <input type="hidden" value="${model.page}" id="page" name="page">
                        <input type="hidden" value="${model.maxPageItems}" id="maxPageItems" name="maxPageItems">
                        <input type="hidden" value="${model.sortName}" id="sortName" name="sortName">
                        <input type="hidden" value="${model.sortBy}" id="sortBy" name="sortBy">
                        <input type="hidden" value="${model.categoryName}" id="categoryName" name="categoryName">
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
                    $('#maxPageItems').val("${model.maxPageItems}");
                    $('#sortBy').val("${model.sortBy}");
                    $('#sortName').val("${model.sortName}");
                    $('#pageChange').submit();
                }
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $(".dropdown-menu li").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
</body>
</html>