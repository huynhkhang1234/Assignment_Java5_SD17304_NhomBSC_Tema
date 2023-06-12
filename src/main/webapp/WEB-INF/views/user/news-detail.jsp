
<%-- <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B.S.C.Team - CarService</title>
	
	<!-- Link To Base CSS -->
	<%@include file="component/_linkCSS.jsp" %>
	
	<!-- Link To News CSS -->
    <link rel="stylesheet" href="../css/news.css">
</head>

<body>
	<!--  đọc dữ liệu từ trang khi mà người dùng click chuột vào giỏ hàng
	kiểm tra -->

	<!-- Header Start -->
	<%@include file = "component/_header.jsp" %>
	<!-- Header End -->
    
    <main>

        <!-- ========================== BREADCRUMB ========================== -->
        <section class="breadcrumb">
            <ul class="breadcrumb__list d-flex container">
                <li><a href="/user/index" class="breadcrumb__link">Trang chủ</a></li>
                <li><span class="breadcrumb__link">></span></li>
                <li><a href="/user/news" class="breadcrumb__link">Tin tức</a></li>
                <li><span class="breadcrumb__link">></span></li>
                <li><span class="breadcrumb__link active">Tiêu đề bài viết</span></li>
            </ul>
        </section>

        <section class="news-hot mt-5">
        <c:forEach var="item" items="${list}">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="fw-bold text-uppercase my-4">Tin tức</h3>
                        <h1 class="fw-bold text-uppercase my-4" style="font-size: 60px;">Tiêu đề bài viết
                        </h1>
                    </div>
                    <div class="col-md-12">
                        <a href="#">
                            <img src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/news/2023/05_23_emilia_donation/emilia_donation_cover.jpg"
                                alt="">
                        </a>
                    </div>
                    <div class="col-md-12 mt-5">
                        <div>
                            <span style="font-size: 18px;">dd-MM-yyyy</span>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                            <div class="content__news-author px-2 py-1">
                                <a href="#">
                                    <p>Người đăng</p>
                                </a>
                            </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </section>

        <section class="container__news mt-5">
            <div class="container">
                 <!-- Để nội dung vào trong đây -->
                 Để nội dung bài viêt vào đây nè
            </div>
        </section>

        <section class="container__hot my-4">
            <div class="container">
                <div class="container__hot-title">
                    <h2 class="text-uppercase fw-bold">Bài viết mới nhất</h2>
                </div>
                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="thumbnail-image">
                            <img alt="" style="background-image: url(https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/news/2023/05_17_revuelto_dream/revuelto_dream_cover_01.jpg);">
                        </div>
                        <div class="content__news">
                            <div class="content__news d-flex flex-column h-100">
                                <div class="content__news-date my-3" style="font-size: 14px;">dd-MM-yyyy</div>
                                <div class="my-auto">
                                    <div class="content__news-author px-2 py-1 mb-2 d-flex align-items-center">
                                        <a href="#">
                                            <p>Người đăng</p>
                                        </a>
                                    </div>
                                    <div class="content__news-title" >
                                        <h3 class="fw-bold text-uppercase">Tiêu đề bài viết</h3>
                                    </div>
                                </div>
                                <div class="content__news-btn mt-2">
                                    <a href="#" class="btn btn-outline-dark text-uppercase">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail-image">
                            <img alt="" style="background-image: url(https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/news/2023/05_17_revuelto_dream/revuelto_dream_cover_01.jpg);">
                        </div>
                        <div class="content__news">
                            <div class="content__news d-flex flex-column h-100">
                                <div class="content__news-date my-3" style="font-size: 14px;">dd-MM-yyyy</div>
                                <div class="my-auto">
                                    <div class="content__news-author px-2 py-1 mb-2 d-flex align-items-center">
                                        <a href="#">
                                            <p>Người đăng</p>
                                        </a>
                                    </div>
                                    <div class="content__news-title" >
                                        <h3 class="fw-bold text-uppercase">Tiêu đề bài viết</h3>
                                    </div>
                                </div>
                                <div class="content__news-btn mt-2">
                                    <a href="#" class="btn btn-outline-dark text-uppercase">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail-image">
                            <img alt="" style="background-image: url(https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/news/2023/05_17_revuelto_dream/revuelto_dream_cover_01.jpg);">
                        </div>
                        <div class="content__news">
                            <div class="content__news d-flex flex-column h-100">
                                <div class="content__news-date my-3" style="font-size: 14px;">dd-MM-yyyy</div>
                                <div class="my-auto">
                                    <div class="content__news-author px-2 py-1 mb-2 d-flex align-items-center">
                                        <a href="#">
                                            <p>Người đăng</p>
                                        </a>
                                    </div>
                                    <div class="content__news-title" >
                                        <h3 class="fw-bold text-uppercase">Tiêu đề bài viết</h3>
                                    </div>
                                </div>
                                <div class="content__news-btn mt-2">
                                    <a href="#" class="btn btn-outline-dark text-uppercase">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    
    <!-- Footer Start -->
	<%@include file = "component/_footer.jsp" %>
	<!-- Footer End -->

    <!-- Link To Base JS -->
    <%@include file = "component/_linkJS.jsp" %>

	
</body>

</html>