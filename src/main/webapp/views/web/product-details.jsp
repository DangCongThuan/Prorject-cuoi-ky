<%@include file="/commons/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chi Tiết Sản Phẩm | E-Shopper</title>
</head><!--/head-->

<body>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <%@include file="/commons/web/danhmuc.jsp" %>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">

                            <img src="<c:url value="/UploadDownloadFileServlet?fileName=${model.thumbnail}"></c:url>"
                                 alt=""/>
                            <%--                            <h3>ZOOM</h3>--%>
                        </div>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <c:forEach begin="0" end="2" var="item" items="${model.inforImages}">
                                        <a href=""><img width="84px" height="84px"
                                                        src="<c:url value="/UploadDownloadFileServlet?fileName=${item.productImage}"></c:url>"
                                                        alt=""></a>
                                    </c:forEach>
                                </div>
                                <c:if test="${model.inforImages.size() > 3}">
                                    <c:forEach var="i" begin="3" end="${model.inforImages.size()}" step="3">
                                        <div class="item">
                                            <c:forEach begin="${i}" end="${i + 2}" var="item"
                                                       items="${model.inforImages}">
                                                <a href=""><img width="84px" height="84px"
                                                                src="<c:url value="/UploadDownloadFileServlet?fileName=${item.productImage}"></c:url>"
                                                                alt=""></a>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </c:if>

                            </div>

                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-7">
                        <div class="product-information"><!--/product-information-->
                            <img src="images/product-details/new.jpg" class="newarrival" alt=""/>
                            <h2>${model.name}</h2>
                            <p>ID: ${model.id}</p>
                            <img src="images/product-details/rating.png" alt=""/>
                            <span>
									<span>${model.price} đ</span>
									<label>Số lượng:</label>
									<input type="text" value="1"/>
									<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
<%--										Thên vào giỏ hàng--%>
									</button>
								</span>
                            <%--                            <p><b>Khả:</b> In Stock</p>--%>
                            <%--                            <p><b>Condition:</b> New</p>--%>
                            <p>${model.description}</p>
                            <p><b>Thương hiệu:</b> Light</p>
                            <a href=""><img src="images/product-details/share.png" class="share img-responsive" alt=""/></a>
                        </div><!--/product-information-->
                    </div>
                </div><!--/product-details-->

                <div class="category-tab shop-details-tab"><!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li><a href="#details" data-toggle="tab">Thông tin</a></li>
                            <%--                            <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>--%>
                            <%--                            <li><a href="#tag" data-toggle="tab">Tag</a></li>--%>
                            <li class="active"><a href="#reviews" data-toggle="tab">Đánh giá (0)</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade" id="details">
                            <c:forEach var="item" items="${model.inforImages}">
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="<c:url value="/UploadDownloadFileServlet?fileName=${item.productImage}"></c:url>"
                                                     alt=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="tab-pane fade active in" id="reviews">
                            <div class="col-sm-12">
                                <ul>
                                    <li><a href=""><i class="fa fa-user"></i>Thuận</a></li>
                                    <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                    <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2022</a></li>
                                </ul>
                                <p>Chỉ những người đã đăng nhập và mua hàng mới có thể bình luận</p>
                                <p><b>viết bình luận của bạn</b></p>

                                <form action="#">
										<span>
											<input type="text" placeholder="Tên của bạn"/>
											<input type="email" placeholder="Email"/>
										</span>
                                    <textarea name=""></textarea>
                                    <b>Đánh giá: </b> <img
                                        src="<c:url value="/templates/web/images/product-details/rating.png"></c:url>"
                                        alt=""/>
                                    <button type="button" class="btn btn-default pull-right">
                                        Đánh giá
                                    </button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div><!--/category-tab-->

                <div class="recommended_items"><!--recommended_items-->
                    <h2 class="title text-center">Sản phẩm đề xuất</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
                                <c:forEach begin="0" end="2" var="otherProduct1" items="${model.listResult}">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="<c:url value="/UploadDownloadFileServlet?fileName=${otherProduct1.thumbnail}"></c:url>"
                                                         alt=""/>
                                                    <h2>${otherProduct1.price}</h2>
                                                    <p>${otherProduct1.name}</p>
                                                    <button type="button" class="btn btn-default add-to-cart"><i
                                                            class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <c:if test="${model.listResult.size() > 3}">
                                <c:forEach var="i" begin="3" end="${model.listResult.size()}" step="2">
                                    <div class="item">
                                        <c:forEach begin="${i}" end="${i +2}"
                                                   var="otherProduct" items="${model.listResult}">

                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="<c:url value="/UploadDownloadFileServlet?fileName=${otherProduct.thumbnail}"></c:url>"
                                                                 alt=""/>
                                                            <h2>${otherProduct.price}</h2>
                                                            <p>${otherProduct.name}</p>
                                                            <button type="button" class="btn btn-default add-to-cart"><i
                                                                    class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </c:if>


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