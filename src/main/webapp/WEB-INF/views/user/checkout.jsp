
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
	
	<style>
        .pro-thumbnail {
            width: 80px;
        }
    </style>

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
                <li><span class="breadcrumb__link">Giỏ hàng</span></li>
                <li><span class="breadcrumb__link">></span></li>
                <li><span class="breadcrumb__link active">Đặt hàng</span></li>
            </ul>
        </section>

        <form class="container mt-5 d-flex justify-content-center gap-4">
            <div class="table-cart col-md-8">
                <div class="card border-secondary mb-3">
                    <div class="card-header fw-bold text-uppercase">Địa chỉ giao hàng</div>
                    <div class="card-body text-secondary row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName" class="form-label">Họ:</label>
                            <input type="text" class="form-control" id="firstName" value="Huỳnh" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName" class="form-label">Tên:</label>
                            <input type="text" class="form-control" id="lastName" value="Bảo Khang" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="text" class="form-control" id="email" value="khanghbpc04012@fpt.edu.vn" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="numberPhone" class="form-label">Số điện thoại:</label>
                            <input type="text" class="form-control" id="numberPhone" value="0387808694" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ:</label>
                            <textarea class="form-control" id="address" style="height: 100px;" placeholder="Nhập địa chỉ đê bạn hiền" required ></textarea>
                          </div>
                    </div>
                  </div>
            </div>
            <div class="col-md-4">
                <div class="card border-secondary mb-3">
                    <div class="card-header fw-bold text-uppercase">Hóa đơn chi tiết</div>
                    <div class="card-body text-secondary">
                        <div style="color: #333;">
                            <p class="card-text" style="font-weight: 500;">Sản phẩm:</p>
                            <ul class="mb-3">
                                <li class="d-flex justify-content-between mb-2">
                                    - Bọc vô lăng ô tô da cao cấp(x1) <span>349.000 VNĐ</span>
                                </li>
                                <li class="d-flex justify-content-between">
                                    - Bọc vô lăng ô tô da cao cấp(x1) <span>349.000 VNĐ</span>
                                </li>
                            </ul>
                        </div>

                        <div class="d-flex justify-content-between pt-3" style="color: #333; border-top: 1px solid #ccc;">
                            <p class="card-text" style="font-weight: 500;">Tạm tính:</p>
                            <span>123.000 VNĐ</span>
                        </div>
                        <div class="d-flex justify-content-between" style="color: #333;">
                            <p class="card-text" style="font-weight: 500;">Khuyến mãi:</p>
                            <span>123.000 VNĐ</span>
                        </div>
                        <div class="d-flex justify-content-between" style="color: #333; border-bottom: 1px solid #ccc;">
                            <p class="card-text" style="font-weight: 500; ">Phí ship: </p>
                            <span>30.000 VNĐ</span>
                        </div>
                        <div class="d-flex justify-content-between mt-3" style="color: #333;">
                            <h5 class="card-title" style="font-weight: 500;">Tổng cộng:</h5>
                            <h5 class="fw-bold">123.000 VNĐ</h5>
                        </div>
                    </div>
                </div>
                <div class="box-bill col-md-12">
                    <div class="card border-secondary mb-3">
                        <div class="card-header fw-bold text-uppercase">Thanh toán</div>
                        <div class="card-body text-secondary">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1" style="color: #333;">
                                  Trực tiếp (Tiền mặt)
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2" style="color: #333;">
                                  Chuyển khoản (Thẻ ngân hàng online)
                                </label>
                              </div>
                            <a href="#" class="btn btn-warning w-100 mt-4 fw-bolder">Tiến hành đặt hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
       
    </main>
    
    
    <!-- Footer Start -->
	<%@include file = "component/_footer.jsp" %>
	<!-- Footer End -->

    <!-- Link To Base JS -->
    <%@include file = "component/_linkJS.jsp" %>

	
</body>

</html>