
<%@include file="/commons/taglib.jsp"%>
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
					<div class="left-sidebar">
						<%@include file="/commons/web/danhmuc.jsp" %>
						<%@include file="/commons/web/tintuc.jsp" %>
						<%@include file="/commons/web/quangcao.jsp"%>
					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="../../../images/product-details/img_1.png" alt="" />
								<h3>ZOOM</h3>
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								
								  <!-- Wrapper for slides -->
								    <div class="carousel-inner">
										<div class="item active">
										  <a href=""><img width="84px" src="../../../images/product-details/img1_1.png" alt=""></a>
										  <a href=""><img width="84px" src="../../../images/product-details/img1_2.png" alt=""></a>
										  <a href=""><img width="84px" src="../../../images/product-details/img1_3.png" alt=""></a>
										</div>
										<div class="item">
											<a href=""><img width="84px" src="../../../images/product-details/img1_1.png" alt=""></a>
											<a href=""><img width="84px" src="../../../images/product-details/img1_2.png" alt=""></a>
											<a href=""><img width="84px" src="../../../images/product-details/img1_3.png" alt=""></a>
										</div>
										<div class="item">
											<a href=""><img width="84px" src="../../../images/product-details/img1_1.png" alt=""></a>
											<a href=""><img width="84px" src="../../../images/product-details/img1_2.png" alt=""></a>
											<a href=""><img width="84px" src="../../../images/product-details/img1_3.png" alt=""></a>
										</div>
										
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
								<h2>Đèn Led Pha TD06 100W</h2>
								<p>Mã SP: AMBEE-TD06-100W</p>
								<img src="../../../images/product-details/rating.png" alt="" />
								<span>
									<span>350.000đ</span>
									<label>Số lượng:</label>
									<input type="text" value="1" />
									<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Thêm vào giỏ hàng
									</button>
								</span>
								<p><b>Công suất:</b>100W</p>
								<p><b>Kích thước:</b>168x310x145 mm (LxWxH)</p>
								<p><b>Ánh sáng:</b>Trắng, Vàng</p>
								<a href=""><img src="../../../images/product-details/share.png" class="share img-responsive" alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a href="#details" data-toggle="tab">Thông số</a></li>
								<li><a href="#companyprofile" data-toggle="tab">Cấu tạo</a></li>
								<li class="active"><a href="#reviews" data-toggle="tab">Bình luận</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade" id="details" >
								<div class="col-sm-6">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img.png" alt="" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-5">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_2-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-5">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_3-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>

							</div>

							<div class="tab-pane fade" id="companyprofile" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_4-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_5-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_6-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="../../../images/product-details/img_7-compressed.jpg" alt="" />

											</div>
										</div>
									</div>
								</div>
							</div>
							

							
							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
									<ul>
										<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31/10/2022</a></li>
									</ul>
									<p><b>Viết đánh giá của bạn</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="Tên bạn"/>
											<input type="email" placeholder=" Địa chỉ Email"/>
										</span>
										<textarea name="" ></textarea>
										<b>Xếp hạng: </b> <img src="../../../images/product-details/rating.png" alt="" />
										<button type="button" class="btn btn-default pull-right">
										Đăng
										</button>
									</form>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h3 class="title text-center" style="color: #fe980f;font-size: 35px">Sản phẩm được đề xuất</h3>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="../../../images/shop/img_1-1.png" alt="" />
													<h2>400.000đ</h2>
													<p>Đèn Led Pha TD07 300W</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="../../../images/shop/img_2-1.png" alt="" />
													<h2>540.000đ</h2>
													<p>Đèn Led Pha HDFL02 1250W</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="../../../images/shop/img_49.png" alt="" />
													<h2>200.000đ</h2>
													<p>Đèn Tuýp Led 0m6 9w Đầu Xoay RA95-Daylight</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
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
													<img src="../../../images/shop/img_1-1.png" alt="" />
													<h2>400.000đ</h2>
													<p>Đèn Led Pha TD07 300W</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="../../../images/shop/img_2-1.png" alt="" />
													<h2>540.000đ</h2>
													<p>Đèn Led Pha HDFL02 1250W</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="../../../images/shop/img_49.png" alt="" />
													<h2>200.000đ</h2>
													<p>Đèn Tuýp Led 0m6 9w Đầu Xoay RA95-Daylight</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
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