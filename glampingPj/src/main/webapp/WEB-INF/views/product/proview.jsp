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
			<div id="info" class="col-sm-8 col-md-9" style="float:left">
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
									<img src="${product.pro_pic }" class="d-block w-25" alt="...">
								</div>
								<c:forEach var="pp" items="${pplist}">
									<div class="carousel-item">
										<img src="${pp.pp_name}" class="d-block w-25" alt="...">
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
						<h5>상세정보</h5>
						<p>${intro}</p>
					</div>
					<div>
						<h5>주요 편의 시설</h5>
						<ul>
							<c:forEach var="con" items="${con}">
								<li>${con}</li>
							</c:forEach>
						</ul>
					</div>
					<div>
						<h5>객실 정보</h5>
						<div id="roomlist"></div>
					</div>
					<div>
						<h5>후기</h5>
						<div id="review"></div>
					</div>
					<div>
						<h5>위치</h5>
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
					<div>
						<h5>사업장 정보</h5>
						<p>상호명: ${product.pro_name}</p>
						<p>대표자: ${product.pro_ceo}</p>
						<p>사업자 등록번호: ${product.pro_n1}-${product.pro_n2}</p>
						<p>사업장 주소: ${product.pro_addr}</p>
					</div>
				</div>
			</div>

			<div id="reserv" class="col-sm-4 col-md-3" style="float:right">
				<div id="rev_sec">
					<h5>예약 가격 정보</h5>
					<form>
						<table>
							<tr>
								<td>체크인 <input type="text" id="checkIn" name="checkInS"
									value="${checkInS}" readonly="readonly">
								</td>
								<td>체크아웃 <input type="text" id="checkOut" name="checkOutS"
									value="${checkOutS}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td colspan="2">인원 <select name="capS" id="capS">
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
								</td>
							</tr>
						</table>
						<div id="rm_price">
							<span id="sel_name"></span><br>
							<span id="sel_count"></span><span id="sel_price"></span>							
						</div>
						<input type="hidden" id="tname" name="res_tname">
						<input type="submit" id="rev_button" value="예약하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp"%>