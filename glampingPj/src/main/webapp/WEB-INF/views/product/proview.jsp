<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/product/proview.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05274b64af0d95b6ced6532db8a1d75c"></script>


<!-- header 파일 불러오기 -->
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#review').load('${pageContext.request.contextPath}/relist/pro_no/${product.pro_no}')
		$('#roomlist').load('${pageContext.request.contextPath}/rmlist/pro_no/${product.pro_no}')
	});
</script>

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
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="..." class="d-block w-25" alt="...">
								</div>
								<div class="carousel-item">
									<img src="..." class="d-block w-25" alt="...">
								</div>
								<div class="carousel-item">
									<img src="..." class="d-block w-25" alt="...">
								</div>
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
						<div id="map" style="width: 500px; height: 400px;"></div>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(${product.pro_x}, ${product.pro_y}),
								level: 3
							};
					
							var map = new kakao.maps.Map(container, options);
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

			<div id="reserv" class="col-sm-4 col-md-3">
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
						<div>가격 정보 표시 부분</div>
						<input type="submit" id="rev_button" value="예약하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp"%>