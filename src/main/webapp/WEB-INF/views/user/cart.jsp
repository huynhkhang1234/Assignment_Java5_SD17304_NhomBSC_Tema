
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<!--  đọc dữ liệu từ trang khi mà người dùng click chuột vào giỏ hàng
	kiểm tra -->

	<c:forEach items="${sessionScope.cart}" var="detail">
		<tr>
			<td>${detail.key}</td>
			<td>${detail.value.quantity}</td>
			<td>${detail.value.price}</td>
			<td>${detail.value.name}</td>
			
		<%-- 	<td>${detail.value}</td>
			<td>${ detail.price }</td>
			<td>${ detail.quantity }</td>

			<td>${ detail.orderDetail.price*detail.orderDetail.quantity }</td> --%>
			<%-- <td>
				<button class="btn btn-danger" data-bs-toggle="modal"
					d	ata-bs-target="#modalDelte_${detail.orderDetail.id}_${detail.order.id}">
					<i class="fa-solid fa-trash-can"></i>
				</button> // khi xóa <!-- Modal delete -->
				<div class="modal fade"
					id="modalDelte_${detail.orderDetail.id}_${detail.order.id}"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<h5 class="modal-title text-white" id="staticBackdropLabel">Delete
									a cart !</h5>
								<button type="button" class="btn" data-bs-dismiss="modal"
									aria-label="Close">
									<i class="fa-solid fa-xmark fs-5 text-white"></i>
								</button>
							</div>
							<div class="modal-body" style="background-color: #fff2df">
								<p>Warning : You are trying a cart. This cart will be
									permanently deleted !</p>
								<a type="button" class="btn  btn-danger w-100"
									href="/user/delete/${detail.order.id}"> Delete </a>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr> --%>
	</c:forEach>
	<form action="saveCart" method="post">
	
		<button > Thêm vào database</button>
	</form>
</body>
</html>