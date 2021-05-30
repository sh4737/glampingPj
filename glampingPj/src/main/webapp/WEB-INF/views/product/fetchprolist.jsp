<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:forEach var="product" items="${list }">
		<div class="card">
			<div class="row g-0">
				<div class="col-2 col-sm-1">
					<img src="${pageContext.request.contextPath }/upload/${product.pro_pic}" height="180" width="180">
				</div>
				<div class="col-10 col-sm-11 protext">
					<h4><a href="${pageContext.request.contextPath }/view/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_name }</a></h4><br>
					<p><a href="${pageContext.request.contextPath }/view/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_addr }</a></p>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>