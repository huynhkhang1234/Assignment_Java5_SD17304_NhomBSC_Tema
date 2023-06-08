
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
                <li><span class="breadcrumb__link active">Giỏ hàng</span></li>
            </ul>
        </section>

        <div class="container mt-5 d-flex justify-content-center gap-4">
            <div class="table-cart col-md-8">
                <table class="table caption-top align-middle">
                    <caption>Danh sách sản phẩm</caption>
                    <thead class="table-dark text-center">
                      <tr>
                        <th scope="col" class="col-md-2">Hình</th>
                        <th scope="col" class="col-md-2">Tên</th>
                        <th scope="col" class="col-md-2">Giá</th>
                        <th scope="col" class="col-md-2">Số lượng</th>
                        <th scope="col" class="col-md-2">Tổng</th>
                        <th scope="col" class="col-md-2">Xóa</th>
                      </tr>
                    </thead>
                    <tbody class="text-center">
                      <tr>
                        <td class="pro-thumbnail">
                            <a href="#">
                                <img src="/images/product-01.png" alt="" height="70px;">
                            </a>
                        </td>
                        <td>Động cơ hơi nước quá trời nước</td>
                        <td>300.000 VNĐ</td>
                        <td class="me-2 ms-2">
                            <div class="input-group">
                                <button class="btn btn-outline-warning" id="quantityBtn">+</button>
                                <input type="text" class="form-control text-center" min="1" placeholder="1" aria-describedby="quantityBtn">
                                <button class="btn btn-outline-warning" id="quantityBtn">-</button>
                              </div>
                        </td>
                        <td>300.000 VNĐ</td>
                        <td>
                            <a href="#" class="btn btn-danger">
                                <i class="bi bi-trash3" style="color: #fff;"></i>
                            </a>
                        </td>
                      </tr>
                      <tr>
                        <td class="pro-thumbnail">
                            <a href="#">
                                <img src="/images/product-01.png" alt="" height="70px;">
                            </a>
                        </td>
                        <td>Động cơ hơi nước quá trời nước</td>
                        <td>300.000 VNĐ</td>
                        <td class="me-2 ms-2">
                            <div class="input-group">
                                <button class="btn btn-outline-warning" id="quantityBtn">+</button>
                                <input type="text" class="form-control text-center" min="1" placeholder="1" aria-describedby="quantityBtn">
                                <button class="btn btn-outline-warning" id="quantityBtn">-</button>
                              </div>
                        </td>
                        <td>300.000 VNĐ</td>
                        <td>
                            <a href="#" class="btn btn-danger">
                                <i class="bi bi-trash3-fill"></i>
                            </a>
                        </td>
                      </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-4">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Mã giảm giá" aria-label="Mã giảm giá" aria-describedby="discountBtn">
                    <a href="#" class="btn btn-outline-warning" id="discountBtn">Áp dụng</a>
                </div>
                <div class="box-bill col-md-12">
                    <div class="card border-secondary mb-3">
                        <div class="card-header">Hóa đơn</div>
                        <div class="card-body text-secondary">
                            <div class="d-flex justify-content-between" style="color: #333;">
                                <p class="card-text" style="font-weight: 500;">Tạm tính:</p>
                                <span>123.000 VNĐ</span>
                            </div>
                            <div class="d-flex justify-content-between" style="color: #333; border-bottom: 1px solid #ccc;">
                                <p class="card-text" style="font-weight: 500; ">Giảm giá:</p>
                                <span>0 VNĐ</span>
                            </div>
                            <div class="d-flex justify-content-between mt-3" style="color: #333;">
                                <h5 class="card-title" style="font-weight: 500;">Tổng cộng:</h5>
                                <span>123.000 VNĐ</span>
                            </div>
                            <a href="#" class="btn btn-warning w-100 mt-4 fw-bolder">Tiến hành đặt hàng</a>
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