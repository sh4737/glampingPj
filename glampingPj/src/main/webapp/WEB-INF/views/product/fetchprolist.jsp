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
					<c:if test="${checkInS != null and checkOutS != null}">
						<h4><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_name }</a></h4><br>
						<p><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_addr }</a></p>
					</c:if>
					<c:if test="${checkInS == null and checkOutS == null}">
						<h4><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}">${product.pro_name }</a></h4><br>
						<p><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}">${product.pro_addr }</a></p>
					</c:if>
				</div>
				<div>
					<c:if test="${product.rv_total != 0 }">
						<span>별점: ${product.star_avg} </span><span>(후기 ${product.rv_total})</span>
					</c:if>
					<c:if test="${product.rv_total == 0 }">
						아직 후기가 없습니다
					</c:if>
				</div>
				<div>
					<span>최저가 </span><span>${product.rev_cnt}</span> 
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>