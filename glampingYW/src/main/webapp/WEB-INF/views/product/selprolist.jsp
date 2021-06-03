<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 파일 불러오기 -->
<%@ include file="/WEB-INF/views/header.jsp" %>


<!-- 외부스크립트 불러오기 -->	

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/yw.css">

<section class="col-8 container-fluid ">
	<br>
	<div><h3>${sel_id}의 등록신청 상품</h3></div>
	<br>	
	
		<c:forEach var="p" items="${prolist }">
								
			<c:if test="${p.pro_s eq 0 }">				
	
				<div class="yw_listdiv">
					<div id="prolist_ra" class="card mb-3" style="max-width: 1050px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <a href="selprodetail?pro_no=${p.pro_no }">
					     <%--  <img src="<%=request.getContextPath() %>/upload/${p.pro_pic}" title="이미지 없어" height="100" width="100"/> --%>
					      <img src="${pageContext.request.contextPath}/upload/${p.pro_pic}" title="이미지 없어" height="220" width="350"/>
					      </a>
					    </div>
					    
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title" id="proname">상품명 :&nbsp ${p.pro_name}</h5>
					        <p class="card-text">주소 : &nbsp ${p.pro_addr}</p>
					        <br>
					        <p class="card-text" id="rmsize">객실 :&nbsp</p>			        
					        <c:forEach var="r" items="${s_rmlist }">
					        	<c:if test="${p.pro_no == r.pro_no }">
					     		   <p class="card-text" id="rmsize">${r.rm_tname}&nbsp/&nbsp</p>
				     		   </c:if>	     				      			
					        </c:forEach>	
							
							<br>
							<br>
						
							<c:forEach var="st" items="${star }">
								<c:if test="${p.pro_no == st.pro_no}">
									<p class="card-text" id="resize">별점 : ${st.star_avg}</p>
								</c:if>								
							</c:forEach>	
							<br>
							
							<c:forEach var="rv" items="${revcl }">
								<c:if test="${p.pro_no == rv.pro_no}">
									<p class="card-text" id="revsize">(후기 : ${rv.rev_cnt}개)</p>
								</c:if>								
							</c:forEach>
							
							<c:forEach var="rp" items="${rprice }">
								<c:if test="${p.pro_no == rp.pro_no}">
									<h5 class="card-text" id="frisize">￦&nbsp<fmt:formatNumber value="${rp.rm_price}" pattern="#,###"/>원</h5>
								</c:if>
							</c:forEach>
							
					      </div>
					    </div>
					  </div>
					</div>
				</div>		
	
			</c:if>	
	
		</c:forEach>	
	
		<hr>

		
	<br>
	<div><h3>${sel_id}의 영업중 상품</h3></div>
	<br>
		
		<c:forEach var="p" items="${prolist }">
						
			
			<c:if test="${p.pro_s eq 1 }">				
	
				<div class="yw_listdiv">
					<div id="prolist_ra" class="card mb-3" style="max-width: 1050px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <a href="selprodetail?pro_no=${p.pro_no }">
					     <%--  <img src="<%=request.getContextPath() %>/upload/${p.pro_pic}" title="이미지 없어" height="100" width="100"/> --%>
					      <img src="${pageContext.request.contextPath}/upload/${p.pro_pic}" title="이미지 없어" height="220" width="350"/>
					      </a>
					    </div>
					    
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title" id="proname">상품명 :&nbsp ${p.pro_name}</h5>
					        <p class="card-text">주소 : &nbsp ${p.pro_addr}</p>
					        <br>
					        <p class="card-text" id="rmsize">객실 :&nbsp</p>			        
					        <c:forEach var="r" items="${s_rmlist }">
					        	<c:if test="${p.pro_no == r.pro_no }">
					     		   <p class="card-text" id="rmsize">${r.rm_tname}&nbsp/&nbsp</p>
				     		   </c:if>	     				      			
					        </c:forEach>	
							
							<br>
							<br>
						
							<c:forEach var="st" items="${star }">
								<c:if test="${p.pro_no == st.pro_no}">
									<p class="card-text" id="resize">별점 : ${st.star_avg}</p>
								</c:if>								
							</c:forEach>	
							<br>
							
							<c:forEach var="rv" items="${revcl }">
								<c:if test="${p.pro_no == rv.pro_no}">
									<p class="card-text" id="revsize">(후기 : ${rv.rev_cnt}개)</p>
								</c:if>								
							</c:forEach>
							
							<c:forEach var="rp" items="${rprice }">
								<c:if test="${p.pro_no == rp.pro_no}">
									<h5 class="card-text" id="frisize">￦&nbsp<fmt:formatNumber value="${rp.rm_price}" pattern="#,###"/>원</h5>
								</c:if>
							</c:forEach>
							
					      </div>
					    </div>
					  </div>
					</div>
				</div>		
	
			</c:if>	
	
		</c:forEach>	
	
		<hr>

	<br>
	<div><h3>${sel_id}의 반려된 상품</h3></div>
	<br>
	
		<c:forEach var="p" items="${prolist }">
						
			
			<c:if test="${p.pro_s eq 2 }">				
	
				<div class="yw_listdiv">
					<div id="prolist_ra" class="card mb-3" style="max-width: 1050px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <a href="selprodetail?pro_no=${p.pro_no }">
					     <%--  <img src="<%=request.getContextPath() %>/upload/${p.pro_pic}" title="이미지 없어" height="100" width="100"/> --%>
					      <img src="${pageContext.request.contextPath}/upload/${p.pro_pic}" title="이미지 없어" height="220" width="350"/>
					      </a>
					    </div>
					    
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title" id="proname">상품명 :&nbsp ${p.pro_name}</h5>
					        <p class="card-text">주소 : &nbsp ${p.pro_addr}</p>
					        <br>
					        <p class="card-text" id="rmsize">객실 :&nbsp</p>			        
					        <c:forEach var="r" items="${s_rmlist }">
					        	<c:if test="${p.pro_no == r.pro_no }">
					     		   <p class="card-text" id="rmsize">${r.rm_tname}&nbsp/&nbsp</p>
				     		   </c:if>	     				      			
					        </c:forEach>	
							
							<br>
							<br>
						
							<c:forEach var="st" items="${star }">
								<c:if test="${p.pro_no == st.pro_no}">
									<p class="card-text" id="resize">별점 : ${st.star_avg}</p>
								</c:if>								
							</c:forEach>	
							<br>
							
							<c:forEach var="rv" items="${revcl }">
								<c:if test="${p.pro_no == rv.pro_no}">
									<p class="card-text" id="revsize">(후기 : ${rv.rev_cnt}개)</p>
								</c:if>								
							</c:forEach>
							
							<c:forEach var="rp" items="${rprice }">
								<c:if test="${p.pro_no == rp.pro_no}">
									<h5 class="card-text" id="frisize">￦&nbsp<fmt:formatNumber value="${rp.rm_price}" pattern="#,###"/>원</h5>
								</c:if>
							</c:forEach>
							
					      </div>
					    </div>
					  </div>
					</div>
				</div>		
	
			</c:if>	
	
		</c:forEach>	
	
		<hr>
	
</section>

<!-- footer 파일 불러오기 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

