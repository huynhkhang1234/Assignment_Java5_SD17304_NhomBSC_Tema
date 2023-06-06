<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<form action="/addCart" method="post">
		<input name="id" type="hidden" value="1" /> <input
			name="price" type="hidden" value="200" /> <input
			name="quantity" type="hidden" value="1" />
			 <input
			name="name" type="hidden" value="San pham den " />
		<button class="btn btn-info w-100 text-white">
			<i class="fa-solid fa-cart-shopping"></i> <span>ADD TO CART</span>
		</button>
		
		
				
	</form>
	
	<form action="/addCart2" method="post">
		<input name="id2" type="hidden" value="2" /> <input
			name="price2" type="hidden" value="300" /> <input
			name="quantity2" type="hidden" value="1" />
			 <input
			name="name2" type="hidden" value="San pham den 2" />
		<button class="btn btn-info w-100 text-white">
			<i class="fa-solid fa-cart-shopping"></i> <span>ADD TO CART 2</span>
		</button>
		
		
				
	</form>
	
		
</body>
</html>