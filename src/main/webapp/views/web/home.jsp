<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 14/11/2022
  Time: 9:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Trang Chủ | LIGHT</title>
</head><!--/head-->

<body>

<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1 style="font-size: 100px"><span>LIGHT</span></h1>
                                <h2>12 năm kinh nghiệm trong lĩnh vực chiếu sáng</h2>
                                <p>Giải pháp chiếu sáng hàng đầu Việt Nam</p>
                                <button type="button" class="btn btn-default get">Mua ngay</button>
                            </div>
                            <div class="col-sm-6">
                                <img src=" <c:url value="/templates/web/images/home/home1.PNG" /> "
                                     class="girl img-responsive" alt=""/>
                                <!--								<img src="images/home/pricing.png"  class="pricing" alt="" />-->
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1 style="font-size: 100px"><span>LIGHT</span></h1>
                                <h2>Chất lượng - Hoàn hảo - Giá hợp lí</h2>
                                <p>Bảo hành lên đến 24 tháng</p>
                                <button type="button" class="btn btn-default get">Mua ngay</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="<c:url value="/templates/web/images/home/home2.PNG" />"
                                     class="girl img-responsive" alt=""/>
                                <%--                <!--									<img src="<c:url value="/templates/web/images/home/pricing.pn />"g"  class="pricing" alt="" />-->--%>
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-sm-6">
                                <h1 style="font-size: 100px"><span>LIGHT</span></h1>
                                <h2>An toàn - Hiệu quả - Vững bền</h2>
                                <p>Tiết kiệm chi phí</p>
                                <button type="button" class="btn btn-default get">Mua ngay</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="<c:url value="/templates/web/images/home/home3.PNG" />"
                                     class="girl img-responsive" alt=""/>
                                <!--									<img src="images/home/pricing.png" class="pricing" alt="" />-->
                            </div>
                        </div>

                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

            </div>
        </div>
    </div>
</section><!--/slider-->

<section>
    <div class="container">
        <div class="row">
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



            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h3 class="title text-center" style="color: #fe980f;font-size: 35px">Sản phẩm đèn led</h3>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led nhà xưởng</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_1-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn chống cháy nổ</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_2-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led pha</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_3-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led tuýp</h2>
                                    </a>
                                </div>
                                <img src=" <c:url value="/templates/web/images/home/new.png" /> " class="new" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_4-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led đường</h2>
                                    </a>
                                </div>
                                <img src=" <c:url value="/templates/web/images/home/sale.png" /> " class="new" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_5-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led chống thấm</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_6-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led panel</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_7-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led máy công cụ</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_8-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn an toàn xe nâng</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_9-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led may</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_10-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn năng lượng mặt trời</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="#"> <img
                                            src=" <c:url value="/templates/web/images/home/img_11-compressed.jpg" /> "
                                            alt=""/>
                                        <h2>Đèn led bulb</h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--features_items-->


                <div class="recommended_items"><!--recommended_items-->
                    <h3 class="title text-center" style="color: #fe980f;font-size: 35px">Các dự án đã triển khai</h3>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan1-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Nhà máy thủy sản IDI</h2></a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan2-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Công ty giày Viễn Thịnh</h2></a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan3-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Công ty may SB Ngọc Trai</h2>
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan4-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Nhà máy VEDAN</h2>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan5-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Nhà máy sửa NUTIFOOD</h2>
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#"><img
                                                        src=" <c:url value="/templates/web/images/home/duan6-compressed.jpg" /> "
                                                        alt=""/>
                                                    <h2>Nhà máy COCA-COLA</h2>
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div><!--/recommended_items-->

            </div>
        </div>
    </div>
</section>

</body>

</html>