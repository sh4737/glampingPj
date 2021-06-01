<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- header 파일 불러오기 -->
<%@ include file="../header.jsp"%>

<section class="col-8 container-fluid ">
	<div>
		<form action="${pageContext.request.contextPath }/prolist/pageNum/1">
			지역 <select name="regionS">
				<option value="all"
					<c:if test="${regionS=='all'}">selected="selected" </c:if>>전체</option>
				<option value="Gyeonggi"
					<c:if test="${regionS=='Gyeonggi'}">selected="selected" </c:if>>경기</option>
				<option value="Incheon"
					<c:if test="${regionS=='Incheon'}">selected="selected" </c:if>>인천</option>
				<option value="Chung"
					<c:if test="${regionS=='Chung'}">selected="selected" </c:if>>충청</option>
				<option value="Gyeongsang"
					<c:if test="${regionS=='Gyeongsang'}">selected="selected" </c:if>>경상</option>
				<option value="Busan"
					<c:if test="${regionS=='Busan'}">selected="selected" </c:if>>부산</option>
				<option value="Jeol"
					<c:if test="${regionS=='Jeol'}">selected="selected" </c:if>>전라</option>
				<option value="Jeju"
					<c:if test="${regionS=='Jeju'}">selected="selected" </c:if>>제주</option>
				<option value="Gangwon"
					<c:if test="${regionS=='Gangwon'}">selected="selected" </c:if>>강원</option>
			</select> 
			
			체크인<input type="text" id="checkIn" name="checkInS" value="${checkInS}" readonly="readonly">
			체크아웃<input type="text" id="checkOut" name="checkOutS" value="${checkOutS}" readonly="readonly"> 
			
			인원 <select name="capS">
					<option value="0"
						<c:if test="${cap=='0'}">selected="selected" </c:if>>인원</option>
					<option value="1"
						<c:if test="${cap=='1'}">selected="selected" </c:if>>1</option>
					<option value="2"
						<c:if test="${cap=='2'}">selected="selected" </c:if>>2</option>
					<option value="3"
						<c:if test="${cap=='3'}">selected="selected" </c:if>>3</option>
					<option value="4"
						<c:if test="${cap=='4'}">selected="selected" </c:if>>4</option>
					<option value="5"
						<c:if test="${cap=='5'}">selected="selected" </c:if>>5</option>
					<option value="6"
						<c:if test="${cap=='6'}">selected="selected" </c:if>>6</option>
					<option value="7"
						<c:if test="${cap=='7'}">selected="selected" </c:if>>7</option>
					<option value="8"
						<c:if test="${cap=='8'}">selected="selected" </c:if>>8</option>
					<option value="9"
						<c:if test="${cap=='9'}">selected="selected" </c:if>>9</option>
					<option value="10"
						<c:if test="${cap=='10'}">selected="selected" </c:if>>10</option>
				</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="검색">
		</form>
	</div>
	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<c:set var="size" value="${fn:length(listBest)}"/>
			<c:forEach var="i" begin="1" end="${size}">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="${i}" aria-label="Slide ${i+1}"></button>
			</c:forEach>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath }/images/mainbest.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>추천 상품 목록</h5>
					<p>인기 중인 상품을 알려드립니다</p>
				</div>
			</div>
		<c:forEach var="best" items="${listBest }">
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath }/upload/${best.pro_pic }" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5><a href="#">${best.pro_name }</a></h5>
					<p><a href="#">Some representative placeholder content for the second
						slide.</a></p>
				</div>
			</div>
		</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div>
			<div class="contianer">
				<div class="col-2 col-sm-1">

					<h5>
						<a href="#">${best.pro_name }</a>
					</h5>
					<br>
				</div>
			</div>
	</div>
	<div>
		<c:forEach var="top" items="${listTop }">
			<div class="card">
				<div class="row g-0">
					<div class="col-2 col-sm-1">
						<img
							src="${pageContext.request.contextPath }/upload/${product.pro_pic}"
							height="180" width="180">
					</div>
					<div class="col-10 col-sm-11">
						<h5>
							<a href="#">${top.pro_name }</a>
						</h5>
						<br>
						<p>${top.pro_addr }</p>
						<br>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp"%>

