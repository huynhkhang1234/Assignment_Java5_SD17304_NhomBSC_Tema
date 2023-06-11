<%@page import="com.poly.Entities.Users"%>
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
	<%@include file="component/_linkCSS.jsp" %>
	
    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="../css/slick/slick.min.css">
    <link rel="stylesheet" type="text/css" href="../css/slick/slick-theme.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link rel="stylesheet" href="../css/detail.css">
    
    <style>
        .content__preview-image {
            height: 50px;
            width: 50px;
            overflow: hidden;
            position: relative;
            border-radius: 50%;
        }

        .content__preview-image img {
            height: 100%;
            width: 100%;
            background-position: 50%;
            background-size: cover;
            background-repeat: no-repeat;
        }

        i.bi-star {
            color: var(--first-color);
        }

        .date-rate {
            font-size: 13px;
        }
    </style>
    
    
</head>

<body>


	<!-- Header Start -->
	<%@include file="component/_header.jsp"%>
	<!-- Header End -->

	<main>

		<!-- ========================== BREADCRUMB ========================== -->
		<section class="breadcrumb">
			<ul class="breadcrumb__list d-flex container">
				<li><a href="../html/index.html" class="breadcrumb__link">Trang
						chủ</a></li>
				<li><span class="breadcrumb__link">></span></li>
				<li><span class="breadcrumb__link">Sản phẩm</span></li>
				<li><span class="breadcrumb__link">></span></li>
				<li><span class="breadcrumb__link active">Sản phẩm chi
						tiết</span></li>
			</ul>
		</section>

		<%-- <c:forEach var="item" items="${productDetail}"> --%>

		<div class="container pb-5">
			<div class="row">
				<div class="col-lg-5 mt-5">
					<div class="card mb-3">
						<img class="card-img img-fluid"
							src="../images/product-img/${productDetail.images}"
							alt="Card image cap" id="product-detail">
					</div>
					<div class="row">
						<!--Start Controls-->
						<div class="col-1 align-self-center">
							<a href="#multi-item-example" role="button" data-bs-slide="prev">
								<i class="bi bi-chevron-left"></i> <span class="sr-only">Previous</span>
							</a>
						</div>
						<!--End Controls-->
						<!--Start Carousel Wrapper-->
						<div id="multi-item-example"
							class="col-10 carousel slide carousel-multi-item"
							data-bs-ride="carousel">
							<!--Start Slides-->
							<div class="carousel-inner product-links-wap" role="listbox">

								<!--First slide-->
								<div class="carousel-item active">
									<div class="row">
										<c:forEach var="item" items="${galleriesList}" begin="0"
											end="2">
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="../images/product-img/${item.images}"
													alt="Product Image 3">
												</a>
											</div>
										</c:forEach>


									</div>
								</div>
								<!--/.First slide-->

								<!--Second slide-->
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="item" items="${galleriesList}" begin="2"
											end="4">
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="../images/product-img/${item.images}"
													alt="Product Image 3">
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<div class="col-1 align-self-center">
							<a href="#multi-item-example" role="button" data-bs-slide="next">
								<i class="bi bi-chevron-right"></i> <span class="sr-only">Next</span>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
				<!-- col end -->
				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2">${productDetail.titles}</h1>

							<p class="h3 py-2">${productDetailPrice}</p>

							<div class="rate">
								<input type="radio" id="star5" name="rate" value="5" /> <label
									for="star5" title="text">5 stars</label> <input type="radio"
									id="star4" name="rate" value="4" /> <label for="star4"
									title="text">4 stars</label> <input type="radio" id="star3"
									name="rate" value="3" /> <label for="star3" title="text">3
									stars</label> <input type="radio" id="star2" name="rate" value="2" />
								<label for="star2" title="text">2 stars</label> <input
									type="radio" id="star1" name="rate" value="1" /> <label
									for="star1" title="text">1 star</label>
							</div>

							<h5>Thông tin sản phẩm:</h5>
							<ul class="list-unstyled pb-3">
								<li>${productDetail.description}</li>
							</ul>

							<form>
								<div class="row pb-3">
									<div class="col d-grid">
										<button class="btn btn-success btn-lg" name="submit"
											value="buy">Buy</button>
									</div>
									<div class="col d-grid">
										<button class="btn btn-success btn-lg" onclick="addToCart()">Add
											To Cart</button>
											
										<!-- //----------- mình sẽ set giá trị lấy -------------------------->
										<input type="hidden" id="productId"
											value="${productDetail.id}"> <input type="hidden"
											id="productName" value="${productDetail.titles}">
										<input  type="hidden" id="images"value="${productDetail.images}"> 
										<input type="hidden" id="price" value="${productDetail.price}">
										
										
										
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>

			</div>
		</div>


		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active text-uppercase fw-bold"
								id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">Mô Tả Sản Phẩm</a>
							<a class="nav-item nav-link text-uppercase fw-bold"
								id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
								role="tab" aria-controls="nav-profile" aria-selected="false">Đánh
								Giá Sản Phẩm</a>

						</div>
					</nav>
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<ul class="list-unstyled pb-3">
								<!-- <li>Chất liệu : được làm từ chất liệu da PU bên trong là
										lớp cao su non, bên ngoài được bọc lớp da.</li>
									<li>Kích thước: Đường kính vô lăng từ 37 – 38 cm</li>
									<li>Đặc tính : thoải mái, êm, ôm sát vô lăng, dễ dàng lắp
										đặt. Loại bọc này có tuổi thọ cao hơn so với các loại bọc vô
										lăng thông thường khác. Được tinh chế chống bay màu theo thời
										gian sử dụng</li> -->
								<li>${productDetail.description}</li>

							</ul>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<form>
								<div class="form-group">
									<label for="exampleInputPassword1">Name</label> <input
										type="text" class="form-control" id="Username"
										placeholder="Username">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="Email1"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Review title</label> <input
										type="text" class="form-control" id="reviewTitle"
										placeholder="Give your review a title">
								</div>

								<div class="form-group">
									<label for="writeReview">Body of review(1500)</label>
									<textarea class="form-control" id="" rows="3"
										placeholder="Write your comments here"></textarea>
								</div>

							</form>
						</div>

					</div>
				</div>

			</div>
		</div>

		<!-- Close Content -->

		<!-- Start Article -->
		<section class="py-5">
			<div class="container">
				<div class="row text-left p-2 pb-3 text-center">
					<h4>Có Thể Bạn Thích</h4>
				</div>

				<!--Start Carousel Wrapper-->
				<div id="carousel-related-product">

					<c:forEach items="${listProductLike}" var="item">

						<div class="p-2 pb-3">
							<div class="product-grid6">
								<div class="card rounded-0">
									<div class="product-image6">
										<a href="#"> <img class="card-img rounded-0 img-fluid"
											src="../images/product-img/${item.images}">
										</a>
									</div>
									<div class="product-content">
										<a href="shop-single.html" class="h3 text-decoration-none"></a>
										<ul class="list-unstyled d-flex justify-content-center mb-1">
											<li><i class="bi bi-star"></i> <i class="bi bi-star"></i>
												<i class="bi bi-star"></i> <i class="bi bi-star"></i> <i
												class="bi bi-star"></i></li>
										</ul>
										<h3 class="title">
											<a href="#">${item.titles}</a>
										</h3>
										<div class="price">
											<span class="new__price">${item.price}</span> <span
												class="old__price">$60.00</span>
										</div>
									</div>
									<ul class="social">
										<li><a href="" data-tip="Xem lướt qua"><i
												class="bi bi-eye"></i></a></li>
										<li><a href="" data-tip="Thêm vào danh sách yêu thích"><i
												class="bi bi-heart"></i></a></li>
										<li><a href="shop-single.html"
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
			</div>
		</section>
		<!-- End Article -->
	</main>


	<!-- Footer Start -->
	<%@include file="component/_footer.jsp"%>
	<!-- Footer End -->

	<!-- Start Script -->

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<!-- Link To Base JS -->
	<%@include file="component/_linkJS.jsp"%>

	<script src="../js/detail/jquery-1.11.0.min.js"></script>
	<script src="../js/detail/jquery-migrate-1.2.1.min.js"></script>
	<script src="../js/detail/templatemo.js"></script>
	<!-- End Script -->

	<!-- Start Slider Script -->
	<script src="../js/detail/slick.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		// sử lí code ajax
		function addToCart() {
			event.preventDefault();			
			var id = $("#productId").val();
			var name = $("#productName").val();
			var quantity = 1;
			var price = $("#price").val();
			var images = $("#images").val();						
			$.ajax({
				url : "/user/addCart",
				type : "POST",
				data : JSON.stringify({
					id : id,
					name : name,
					price : price,
					quantity : quantity,
					images: images
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
	<script>
		$('#carousel-related-product').slick({
			infinite : true,
			arrows : false,
			slidesToShow : 4,
			slidesToScroll : 3,
			dots : true,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			} ]
		});
	</script>
	<!-- End Slider Script -->
</body>

</html>