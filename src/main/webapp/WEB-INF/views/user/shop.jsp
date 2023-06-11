<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>B.S.C.Team - CarService</title>

<!-- Link To Base CSS -->
<%@include file="component/_linkCSS.jsp"%>

<link rel="stylesheet" href="../css/product.css">

</head>

<body>

	<!-- Header Start -->
	<%@include file="component/_header.jsp"%>
	<!-- Header End -->

	<main>

		<!-- ========================== BREADCRUMB ========================== -->
		<section class="breadcrumb">
			<ul class="breadcrumb__list d-flex container">
				<li><a href="/user/index" class="breadcrumb__link">Trang
						chủ</a></li>
				<li><span class="breadcrumb__link">></span></li>
				<li><span class="breadcrumb__link active">Sản phẩm</span></li>
			</ul>
		</section>

		<div class=" py-5">
			<div class="">
				<div class="container">
					<div class="row products" id="product-list">
						<c:forEach items="${listproduts}" var="item">

							<div class="col-md-3 col-sm-6">
								<input id="productId2" value="${item.id}" type="hidden">
								<div class="product-grid6">
									<div class="card rounded-0">
										<div class="product-image6">

											<!----------------------- thông tin được chuyển trang ----------------------->
											<a href="/user/product?id=${item.id}"> <img
												class="card-img rounded-0 img-fluid"
												src="../images/product-img/${item.images}">
											</a>


										</div>
										<div class="product-content">
											<a href="shop-single.html" class="h3 text-decoration-none"></a>
											<ul class="list-unstyled d-flex justify-content-center mb-1">
												<li><i class="text-warning bi bi-star"></i> <i
													class="text-warning bi bi-star"></i> <i
													class="text-warning bi bi-star"></i> <i
													class="text-warning bi bi-star"></i> <i
													class="text-warning bi bi-star"></i></li>
											</ul>
											<!-- ----------------input hidden----------------------- -->

											<input type="hidden" name="productId" value="${item.id}">
											<%-- <input type="hidden" id="productName2" value="${item.titles}"/>
											<input  type="hidden" id="quantity"value="${productDetail.quantity}">
											<input type="hidden" id="price2" value="${item.price}"/>
											 <input type="text" id="discount2" value="${item.discounts.id}"/> --%>
											<!-- --------------------------------------------------------------- -->
											<h3 class="title">
												<a href="#">${item.titles}</a>
											</h3>
											<div class="price">
												$39.00 <span>${item.price }</span>
											</div>
										</div>

										<ul class="social">
											<li><a href="" data-tip="Xem lướt qua"><i
													class="bi bi-eye"></i></a></li>
											<li><a href="" data-tip="Thêm vào danh sách yêu thích"><i
													class="bi bi-heart"></i></a></li>

											<!-------------- Thêm vào giỏ hàng trên trang  shop ------------------------>
											<li><a
												<%-- href="/user/shop?id=${item.id}" --%>
												<%-- href="#id=${item.id}+name=${item.titles}+price=${item.price}+quantity=1" --%>											
												onclick="addToCart(${item.id})"
												data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
										</ul>

									</div>
									<div class="product-item__sale">
										<span class="percent-count sale-txt">-15%</span>
									</div>
								</div>


							</div>
						</c:forEach>

					</div>

					<div div="row">

						<ul class="pagination pagination-lg justify-content-end">
							<li class="page-item disabled"><a
								class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
								href="#" tabindex="-1">1</a></li>
							<li class="page-item"><a
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								href="#">2</a></li>
							<li class="page-item"><a
								class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
								href="#">3</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<!-- End Content -->

		<!-- Start Brands -->
		<section class="bg-light py-5">
			<div class="container my-4">
				<div class="row text-center py-3">
					<div class="col-lg-6 m-auto">
						<h1 class="h1">Our Brands</h1>

					</div>
					<div class="col-lg-9 m-auto tempaltemo-carousel">
						<div class="row d-flex flex-row">
							<!--Controls-->
							<div class="col-1 align-self-center">
								<a class="h1" href="#multi-item-example" role="button"
									data-bs-slide="prev"> <i class="bi bi-chevron-left"></i>
								</a>
							</div>
							<!--End Controls-->

							<!--Carousel Wrapper-->
							<div class="col">
								<div class="carousel slide carousel-multi-item pt-2 pt-md-0"
									id="multi-item-example" data-bs-ride="carousel">
									<!--Slides-->
									<div class="carousel-inner product-links-wap" role="listbox">

										<!--First slide-->
										<div class="carousel-item active">
											<div class="row">
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo6.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo2.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo3.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo4.png" alt="Brand Logo"></a>
												</div>

											</div>
										</div>
										<!--End First slide-->

										<!--Second slide-->
										<div class="carousel-item">
											<div class="row">
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo5.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo1.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo7.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo8.png" alt="Brand Logo"></a>
												</div>
											</div>
										</div>
										<!--End Second slide-->

										<!--Third slide-->
										<div class="carousel-item">
											<div class="row">
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo9.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo11.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo10.png" alt="Brand Logo"></a>
												</div>
												<div class="col-3 p-md-5">
													<a href="#"><img class="img-fluid brand-img"
														src="../images/product-img/logo12.png" alt="Brand Logo"></a>
												</div>
											</div>
										</div>
										<!--End Third slide-->

									</div>
									<!--End Slides-->
								</div>
							</div>
							<!--End Carousel Wrapper-->

							<!--Controls-->
							<div class="col-1 align-self-center">
								<a class="h1" href="#multi-item-example" role="button"
									data-bs-slide="next"> <i class="bi bi-chevron-right"></i>
								</a>
							</div>
							<!--End Controls-->
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>

	<!-- Footer Start -->
	<%@include file="component/_footer.jsp"%>
	<!-- Footer End -->

	<!-- Link To Base JS -->
	<%@include file="component/_linkJS.jsp"%>
	<!-- thư viện query  -->
	<script src="https:code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// sử lí code ajax
		function addToCart( id) {									
			$.ajax({
				url : "/shop/user/addCart",
				type : "POST",
				data : JSON.stringify({
					id : id		
				}),
			contentType : "application/json",
				success : function(data) {
					 alert("Thêm sản phẩm thành công"); 
				},
				error : function(data) {
					 alert("Lỗi thêm sản phẩm thất bại"); 
				}
			});
		}
	</script>
	<%@include file = "component/_header.jsp" %>
	<!-- Header End -->
    
    <main>

        <!-- ========================== BREADCRUMB ========================== -->
        <section class="breadcrumb">
            <ul class="breadcrumb__list d-flex container">
                <li><a href="/user/index" class="breadcrumb__link">Trang chủ</a></li>
                <li><span class="breadcrumb__link">></span></li>
                <li><span class="breadcrumb__link active">Sản phẩm</span></li>
            </ul>
        </section>

        <div class=" py-5">
            <div class="">
                <div class="container">
                    <div class="row products" id="product-list">
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid"
                                                src="../images/product-img/bomlop.png">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Bơm Lốp Ô Tô Tự Ngắt Steelmate P05</a></h3>
                                        <div class="price">$39.00
                                            <span>$60.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
    
                         
                        </div>
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid"
                                                src="../images/product-img/volang.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Bọc Vô Lăng Ô Tô Da Cao Cấp SPARCO Italia</a></h3>
                                        <div class="price">$99.00
                                            <span>$111.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/phukien1.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Đèn Bi Aozoom X Led Pro Domax Light</a></h3>
                                        <div class="price">$55.00
                                            <span>$75.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/manhinh1.png">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Màn hình NaviPlay N360 – Màn hình cao cấp dành cho ô
                                                tô</a></h3>
                                        <div class="price">$19.00
                                            <span>$21.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/thamlot1.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Thảm Lót Sàn Ô Tô 5D, 6D Xe Mazda CX5</a></h3>
                                        <div class="price">$50.00
                                            <!-- <span>$14.00</span> -->
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/camera1.png">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Camera hành trình trước sau Vietmap KC01</a></h3>
                                        <div class="price">$79.00
                                            <!-- <span>$14.00</span> -->
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/pic-51.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Sạc Không Dây Thông Minh Xe Ô Tô Smart Sensor R1 -
                                                Vàng</a></h3>
                                        <div class="price">$50.00
                                            <!-- <span>$14.00</span> -->
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/cambien1.png">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Cảm Biến Áp Suất Lốp ELLISAFE ADI4</a></h3>
                                        <div class="price">$35.00
                                            <span>$55.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
    
    
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/loa1.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Hệ Thống Âm Thanh Ô Tô DB DRIVE ES7 6C</a></h3>
                                        <div class="price">$11.00
                                            <span>$14.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/loa8.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Hệ Thống Âm Thanh Ô Tô DB DRIVE ES7 6C</a></h3>
                                        <div class="price">$11.00
                                            <span>$14.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/manhinh1.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Hệ Thống Âm Thanh Ô Tô DB DRIVE ES7 6C</a></h3>
                                        <div class="price">$11.00
                                            <span>$14.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="card rounded-0">
                                    <div class="product-image6">
                                        <a href="#">
                                            <img class="card-img rounded-0 img-fluid" src="../images/product-img/phukien7.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <a href="shop-single.html" class="h3 text-decoration-none"></a>
    
                                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                                            <li>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="text-warning bi bi-star"></i>
                                                <i class="bi bi-star"></i>
                                            </li>
                                        </ul>
                                        <h3 class="title"><a href="#">Hệ Thống Âm Thanh Ô Tô DB DRIVE ES7 6C</a></h3>
                                        <div class="price">$11.00
                                            <span>$14.00</span>
                                        </div>
                                    </div>
                                    <ul class="social">
                                        <li><a href="" data-tip="Xem lướt qua"><i class="bi bi-eye"></i></a></li>
                                        <li><a href="" data-tip="Thêm vào danh sách yêu thích"><i class="bi bi-heart"></i></a>
                                        </li>
                                        <li><a href="shop-single.html" data-tip="Thêm vào giỏ hàng"><i class="bi bi-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product-item__sale"><span class="percent-count sale-txt">-15%</span></div>
                            </div>
                        </div>
                    </div>
    
                    <div div="row">
                        <ul class="pagination pagination-lg justify-content-end">
                            <li class="page-item disabled">
                                <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#"
                                    tabindex="-1">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
                                    href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>
                            </li>
                        </ul>
                    </div>
    
                </div>
            </div>
        </div>
        <!-- End Content -->
    
        <!-- Start Brands -->
        <section class="bg-light py-5">
            <div class="container my-4">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Our Brands</h1>
    
                    </div>
                    <div class="col-lg-9 m-auto tempaltemo-carousel">
                        <div class="row d-flex flex-row">
                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                    <i class="bi bi-chevron-left"></i>
                                </a>
                            </div>
                            <!--End Controls-->
    
                            <!--Carousel Wrapper-->
                            <div class="col">
                                <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example"
                                    data-bs-ride="carousel">
                                    <!--Slides-->
                                    <div class="carousel-inner product-links-wap" role="listbox">
    
                                        <!--First slide-->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo6.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo2.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo3.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo4.png"
                                                            alt="Brand Logo"></a>
                                                </div>
    
                                            </div>
                                        </div>
                                        <!--End First slide-->
    
                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo5.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo1.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo7.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo8.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Second slide-->
    
                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo9.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo11.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo10.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="../images/product-img/logo12.png"
                                                            alt="Brand Logo"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Third slide-->
    
                                    </div>
                                    <!--End Slides-->
                                </div>
                            </div>
                            <!--End Carousel Wrapper-->
    
                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </div>
                            <!--End Controls-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Modal Quick View -->
        <div class="modal fade modal-xl" id="QuickViewModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body" style="padding: 100px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="box__quickview-image">
                                    <img alt="" style="background-image: url(../images/product-img/bomlop.png);">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h4>Tên sản phẩm</h4>
                                <div class="price d-flex align-items-center gap-2">
                                    <span class="old__price">345.000 VNĐ</span>
                                    <span class="new__price">123.000 VNĐ</span>
                                </div>
                                <div class="my-4">
                                    <ul class="list-unstyled pb-3 description">
                                        <li>Chất liệu : được làm từ chất liệu da PU bên trong là lớp cao su non, bên
                                            ngoài
                                            được
                                            bọc lớp da.
                                        </li>
                                        <li>Kích thước: Đường kính vô lăng từ 37 – 38 cm</li>
                                        <li>Đặc tính : thoải mái, êm, ôm sát vô lăng, dễ dàng lắp đặt. Loại bọc này có
                                            tuổi
                                            thọ
                                            cao hơn so với các loại bọc vô lăng thông thường khác. Được tinh chế chống
                                            bay
                                            màu
                                            theo thời gian sử dụng</li>
                                        <li>Phù hợp với hầu hết các loại xe 4 – 7 chỗ</li>

                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <input type="number" min="1" value="1" class="form-control">
                                    </div>
                                    <div class="col-6">
                                        <a href="#" class="btn btn-dark">Thêm vào giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>

    
    
    
    <!-- Footer Start -->
	<%@include file = "component/_footer.jsp" %>
	<!-- Footer End -->

    <!-- Link To Base JS -->
    <%@include file = "component/_linkJS.jsp" %>
</body>

</html>