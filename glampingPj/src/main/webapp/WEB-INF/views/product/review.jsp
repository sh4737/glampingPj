<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/product/review.css">
<script src="${pageContext.request.contextPath }/js/product/review.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty relist}">
		<div class="container">
			<div>아직 후기가 없습니다</div>
		</div>
	</c:if>
	<c:if test="${not empty relist}">
		<div class="container">
			<div id="str_div">
				<p>${star_avg}/5 <span>(후기 ${retotal}개)</span></p>
			</div>
			<div id="rev1">
				<button type="button" id="showB" class="btn btn-primary">후기 전체 보기</button>
				<table>
					<tr>
						<td>
							<p class="bold">${relist[0].mem_id}</p>
							<p class="date_size">${relist[0].rev_date}</p>
						</td>
					</tr>
					<tr>
						<td><p>${relist[0].rev_con}</p></td>			
					</tr>
				</table>
			</div>
			<div id="rev_all">
					<button type="button" id="hideB" class="btn btn-primary">후기 숨기기</button>
				<c:forEach var="re" items="${relist}">
					<table>
						<tr>
							<td>
								<p class="bold">${re.mem_id}</p>
								<p class="date_size">${re.rev_date}</p>
							</td>
						</tr>
						<tr>
							<td><p>${re.rev_con}</p></td>			
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
	</c:if>

	
</body>
</html>