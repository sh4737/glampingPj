<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 파일 불러오기 -->
<%@ include file="../header.jsp" %>

<!-- jquery ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath }/js/product/prolist.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/product/prolist.css">


<section class="col-8 container-fluid ">
	<div id="null_sec"></div>
	<div id="search_box">
		<form action="${pageContext.request.contextPath }/prolist/pageNum/1" method="post">
			<div class="row">
				<div class="col-2">
					<span class="f14">지역</span>
					<div class="input-group mb-3">
						<select name="regionS" id="regionS" class="form-control">
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
					</div>
				</div>
				<div class="col-4">
					<span class="f14">날짜</span>
					<div class="input-group mb-3">
						<input type="text" id="checkIn" class="form-control" name="checkInS" value="${checkInS}" readonly="readonly">
						<input type="text" id="checkOut" class="form-control" name="checkOutS" value="${checkOutS}" readonly="readonly">
					</div>
				</div>
				<div class="col-2">
					<span class="f14">인원</span>
					<div class="input-group mb-3">
						<select name="capS" id="capS" class="form-control">
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
				</div>
				<div class="col-4">
					<span class="f14">키워드</span>
					<div class="input-group mb-3">
						<input type="text" name="keyword" class="form-control" id="keyword" value="${keyword}">
						<input type="submit" class="btn btn-outline-secondary" value="검색">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="sec_nav">
		<h4>선택 지역 
			<c:if test="${regionS=='all'}">- 전체</c:if>
			<c:if test="${regionS=='Gyeonggi'}">- 경기</c:if>
			<c:if test="${regionS=='Incheon'}">- 인천</c:if>
			<c:if test="${regionS=='Chung'}">- 충청</c:if>
			<c:if test="${regionS=='Gyeongsang'}">- 경상</c:if>
			<c:if test="${regionS=='Busan'}">- 부산</c:if>
			<c:if test="${regionS=='Jeol'}">- 전라</c:if>
			<c:if test="${regionS=='Jeju'}">- 제주</c:if>
			<c:if test="${regionS=='Gangwon'}">- 강원</c:if>
		</h4>
	</div>
	<div class="container">
		<c:if test="${empty list}">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty list}">
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
		</c:if>
		<input type="hidden" id="pageCount" value="${pageCount}">
		<div id="fetchMore"></div>
	</div>
</section>

<!-- footer 파일 불러오기 -->
<%@ include file="../footer.jsp" %>

