<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/yw.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05274b64af0d95b6ced6532db8a1d75c&libraries=services"></script>


<!-- header 파일 불러오기 -->
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#review').load('${pageContext.request.contextPath}/relist/pro_no/${product.pro_no}')
	});
</script>

<script type="text/javascript">
 function roomdetail(rm_no){
	 alert(rm_no);
	 window.open("roomdetail",rm_no,"width=450,height=500");
 }
</script>

<section class="col-8 container-fluid">

<!-- 	<div class="container"> -->
		<div id="title" class="col-12">
			<h2>${pro.pro_name}</h2>
			<p>${pro.pro_addr}</p>
		</div>
		
		
<!-- 		<div class="row"> -->
<!-- 			<div id="info" class="col-sm-8 col-md-9">
				<div id="cont_sec"> -->
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
									<img src="${pageContext.request.contextPath}/upload/${pro.pro_pic}" class="d-block w-25" alt="..." width="600" height="400"/>
								</div>
								
								<c:forEach var="pp" items="${pplist}">
									<div class="carousel-item">
										<img src="${pageContext.request.contextPath}/upload/${pp.pp_name}" class="d-block w-25" alt="..." width="600" height="400"/>
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
						<p>${pro.pro_intro}</p>
					</div>
					
					<hr>
					
					<div>
						<h5>주요 편의 시설</h5>
						<ul>
							<c:forEach var="con" items="${con}">
								<li>${con}</li>
							</c:forEach>
						</ul>
					</div>
					
					<hr>
					
					<div>
						<div>
							<h5>객실 정보</h5>
						</div>
						<c:forEach var="rm" items="${rmlist}">
							<div class="card" style="width: 200px; height: 250px;">
								<img src="${pageContext.request.contextPath}/upload/${rm.rm_pic}" class="card-img-top" alt="룸 대표이미지" width="200" height="150" onclick="roomdetail('${rm.rm_no}')">
								 <div class="card-body">
								  	<p class="card-text" style="font-weight: bold;">${rm.rm_tname}</p>
								  	<p class="card-text" style="font-weight: bold;">￦&nbsp<fmt:formatNumber value="${rm.rm_price}" pattern="#,###"/>원</p>
								</div>
							</div>
						</c:forEach>
					</div>
					
				
					
					<hr>
					
					<div>
						<h5>후기</h5>
						<div id="review"></div>
					</div>
					
					<hr>
					
					<div>
						<h5>위치</h5>
						<div id="map" style="width: 500px; height: 400px;"></div>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(${pro.pro_y}, ${pro.pro_x}),
								level: 3
							};
					
							var map = new kakao.maps.Map(container, options);
													
							var markerPosition  = new kakao.maps.LatLng(${pro.pro_y}, ${pro.pro_x}); 

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						</script>
					</div>
					
					<hr>
					
					<div>
						<h5>사업장 정보</h5>
						<p>상호명: ${pro.pro_name}</p>
						<p>대표자: ${pro.pro_ceo}</p>
						<p>사업자 등록번호: ${pro.pro_n1}-${pro.pro_n2}</p>
						<p>사업장 주소: ${pro.pro_addr}</p>
					</div>
<!-- 				</div>
			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
</section>



<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp"%>