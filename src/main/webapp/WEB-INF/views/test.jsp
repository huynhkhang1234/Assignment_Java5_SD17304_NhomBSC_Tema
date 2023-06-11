<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort Price</title>
</head>
<body>
	<h1>SORTING BY ${field}</h1>
	<br>
	<table border="1">
		<tr>
			<td><a href="/product/sort?field=id">Id</a></td>
			<td><a href="/product/sort?field=price">Tiêu đề</a></td>
			<td><a href="/product/sort?field=create_date">Người đăng</a></td>
		</tr>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.id}</td>
				<td>${item.titles}</td>
				<td>${item.users.user_names}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>