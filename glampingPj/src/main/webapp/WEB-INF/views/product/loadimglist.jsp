<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button"
				data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<c:set var="size" value="${fn:length(imglist)}"/>
			<c:forEach var="i" begin="1" end="${size}">
				<button type="button"
					data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="${i}" aria-label="Slide ${i+1}"></button>
			</c:forEach>	
		</div>
		<div class="carousel-inner">
			<%-- <div class="carousel-item active">
				<img src="${imglist[0].rp_name}" class="d-block w-25" alt="...">
			</div>
			<c:if test="${size > 1}">
				<c:forEach var="img" begin="1" end="${size-1}">
					<div class="carousel-item">
						<img src="${imglist[img].rp_name}" class="d-block w-25" alt="...">
					</div>
				</c:forEach>
			</c:if> --%>
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath }/upload/${rm.rm_pic}" class="d-block w-25" alt="...">
			</div>
			<c:if test="${size > 1}">
				<c:forEach var="img" items="${imglist}">
					<div class="carousel-item">
						<img src="${img.rp_name}" class="d-block w-25" alt="...">
					</div>
				</c:forEach>
			</c:if>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
</div>

</body>
</html>