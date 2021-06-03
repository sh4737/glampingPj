<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/product/proview.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05274b64af0d95b6ced6532db8a1d75c"></script>


<!-- header 파일 불러오기 -->
<%@ include file="../header.jsp"%>

<!-- jquery ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$('#review').load('${pageContext.request.contextPath}/relist/pro_no/${product.pro_no}')
		$('#roomlist').load('${pageContext.request.contextPath}/rmlist/pro_no/${product.pro_no}')
	});	
</script>
<script src="${pageContext.request.contextPath }/js/product/proview.js"></script>

<section class="col-8 container-fluid">
	<div class="container">
		<div id="title" class="col-12">
			<h2>${product.pro_name}</h2>
			<p>${product.pro_addr}</p>
		</div>
		<div class="row">
			<div id="info" class="col-sm-8 col-md-9">
				<div id="cont_sec">
					<div>
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<c:set var="size" value="${fn:length(pplist)}"/>
								<c:forEach var="i" begin="1" end="${size}">
									<button type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide-to="${i}" aria-label="Slide ${i+1}"></button>
								</c:forEach>	
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${pageContext.request.contextPath }/upload/${product.pro_pic }" class="d-block w-25" alt="...">
								</div>
								<c:forEach var="pp" items="${pplist}">
									<div class="carousel-item">
										<img src="${pageContext.request.contextPath }/upload/${pp.pp_name}" class="d-block w-25" alt="...">
									</div>
								</c:forEach>
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
					<div>
						<h5 class="bold">상세정보</h5>
						<p>${intro}</p>
					</div>
					<div>
						<h5 class="bold">주요 편의 시설</h5>
						<ul>
							<c:forEach var="con" items="${con}">
								<li>${con}</li>
							</c:forEach>
						</ul>
					</div>
					<div>
						<h5 class="bold">객실 정보</h5>
						<div id="roomlist"></div>
					</div>
					<div>
						<h5 class="bold">후기</h5>
						<div id="review"></div>
					</div>
					<div id="loc">
						<h5 class="bold">위치</h5>
						<p>주소 : ${product.pro_addr}</p>
						<div id="map" style="width: 500px; height: 400px;"></div>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(${product.pro_x}, ${product.pro_y}),
								level: 3
							};
						
							var map = new kakao.maps.Map(container, options);
							
							var markerPosition  = new kakao.maps.LatLng(${product.pro_x}, ${product.pro_y}); 
						
							// 마커 생성
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
						
							// 마커 지도 위에 표시
							marker.setMap(map);
						</script>
					</div>
					<div id="cmp_info">
						<h5 class="bold">사업장 정보</h5>
						<p>상호명: ${product.pro_name} / 대표자: ${product.pro_ceo}</p>
						<p>사업자 등록번호: ${product.pro_n1}-${product.pro_n2} / 사업장 주소: ${product.pro_addr}</p>

					</div>
				</div>
			</div>

			<div id="reserv" class="col-sm-4 col-md-3 ">
				<div id="rev_sec">
					<h5>예약 가격 정보</h5>
					<form>
						<div class="row">
							<div class="col-sm-6 col-md-6">체크인</div>
							<div class="col-sm-6 col-md-6">체크아웃</div>
						</div>
						<div class="row">
							<input class="col-sm-6 col-md-6 input-sm" type="text" id="checkIn" name="checkInS"
										value="${checkInS}" readonly="readonly">
							<input class="col-sm-6 col-md-6 input-sm" type="text" id="checkOut" name="checkOutS"
										value="${checkOutS}" readonly="readonly">
						</div>
						<div>
							인원 <select name="capS" id="capS">
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
						</div>
						<div id="rm_price" class="row">
							<span id="sel_name" class="col-sm-12 col-md-12 bold"></span><br>				
						</div>
						<div class="row">
							<span class="col-sm-4 col-md-4" id="sel_count"></span><span class="col-sm-8 col-md-8" id="sel_price"></span>					
						</div>
						<hr>
						<input type="hidden" id="tname" name="res_tname">
						<input type="submit" class="btn btn-primary col-sm-12 col-md-12" value="예약하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp"%>