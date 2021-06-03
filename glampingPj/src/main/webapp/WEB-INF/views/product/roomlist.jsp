<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$(".m_ac").click(function(){
			
			var attrNm = $(this).attr("data-bs-target").split('_');
			var divName = "#img_load_" + attrNm[1];
			var url = $(this).data('url');
			console.log(attrNm[1]);
			console.log(divName);
			console.log(url);
			
			$(divName).load(url);
			
		});
	});	
</script>
</head>
<body>
	<div class="container">
		<c:forEach var="rm" items="${rmlist}">
			<div class="rm_row row">
				<div class="col-md-3">
					<a href="#" class="m_ac" data-bs-toggle="modal" data-bs-target="#i_${rm.rm_no}" data-url="${pageContext.request.contextPath }/loadimglist/rm_no/${rm.rm_no}">
						<img src="${pageContext.request.contextPath }/upload/${rm.rm_pic}" height="100" width="100"></a>
				</div>
				<div class="col-md-8">
					<h6 id="set_name_${rm.rm_type}" class="bold">${rm.rm_tname}</h6><br>
					<div class="row">
						<div class="col-6">
							<span>인원 수 : </span><span class="bold">최대 ${rm.rm_pno}명</span>
						</div>
						<div class="col-6">
							<span class="">가격 : 1박 </span><span class="bold"><fmt:formatNumber value="${rm.rm_price}" pattern="#,###"/>원</span>
						</div>
					</div>
					<span id="set_price_${rm.rm_type}" hidden="hidden">${rm.rm_price}</span>
				</div>
				<div class="col-md-1 align-self-center">
					<input type="radio" class="form-check-input" name="rm_select" value="${rm.rm_type}" onclick='getRmInfo(event)'>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="i_${rm.rm_no}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-lg" >
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">${rm.rm_tname}</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div id="img_load_${rm.rm_no}"></div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
