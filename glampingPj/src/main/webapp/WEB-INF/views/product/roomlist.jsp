<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach var="rm" items="${rmlist}">
			<div class="row">
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath }/upload/${rm.rm_pic}" height="100" width="100">
				</div>
				<div class="col-md-7">
					<h6 id="set_name_${rm.rm_type}">${rm.rm_tname}</h6>
					<span>인원 수 : 최대 ${rm.rm_pno}명</span>
					<span>가격 : 1박 <span id="set_price_${rm.rm_type}">${rm.rm_price}</span>원</span>
				</div>
				<div class="col-md-1">
					<input type="radio" name="rm_select" value="${rm.rm_type}" onclick='getRmInfo(event)'>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
