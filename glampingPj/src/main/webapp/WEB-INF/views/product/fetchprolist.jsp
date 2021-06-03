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
					<div class="col-4 col-sm-3">
						<img src="${pageContext.request.contextPath }/upload/${product.pro_pic}" height="180" width="180">
					</div>
					<div class="col-8 col-sm-9 protext">
						<c:if test="${checkInS != null and checkOutS != null}">
							<h4><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_name }</a></h4><br>
							<p><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}/checkInS/${checkInS}/checkOutS/${checkOutS}">${product.pro_addr }</a></p>
						</c:if>
						<c:if test="${checkInS == null and checkOutS == null}">
							<h4><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}">${product.pro_name }</a></h4><br>
							<p><a href="${pageContext.request.contextPath }/proView/pro_no/${product.pro_no}">${product.pro_addr }</a></p>
						</c:if>
						<div class="else_info row">
							<div class="col-9">
								<c:if test="${product.rv_total != 0 }">
									<span>별점: <span class="red_b">${product.star_avg}</span> </span><span class="f14">(후기 ${product.rv_total})</span>
								</c:if>
								<c:if test="${product.rv_total == 0 }">
									<span class="f14">아직 후기가 없습니다</span>
								</c:if>
							</div>
							<div class="col-3">
								<p>최저 <span class="f18"><fmt:formatNumber value="${product.rev_cnt}" pattern="#,###"/>원</span></p> 
							</div>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
</body>
</html>