
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<h1>${sessionScope.userLogin.user_names}</h1>

	<h1>Trang chủ</h1>

	<c:forEach var="item" items="${listProduct}">
		<tr>
			<form action="/addCart" method="post">
				<input name="id" value="${item.id}" /> <input name="price"
					value="${item.price}" />  
					  <input name="name" value="${item.titles} " />
				<button class="btn btn-info w-100 text-white">
					<i class="fa-solid fa-cart-shopping"></i> <span>ADD TO CART</span>
				</button>
				

			
					<button type="button" class="page-link" onClick="onDown()">
						<i class="fa-solid fa-minus"> giảm </i>
					</button>													
						<input id="quantity" name="quantity" value="1"
							class="form-control" />
													
					<button type="button" class="page-link" onClick="onUp()">
						<i class="fa-solid fa-plus"> tăng lên</i>
					</button>
				
			</form>

		</tr>

	</c:forEach>





</body>
<script>
	var quantity = 1;

	function onDown() {
		if (quantity >= 2) {
			quantity -= 1;
		}
		document.getElementById("quantity").value = quantity;
	};

	function onUp() {
		quantity += 1;
		document.getElementById("quantity").value = quantity;
	};
</script>
</html>
