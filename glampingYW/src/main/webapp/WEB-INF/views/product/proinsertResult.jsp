<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${proresult != 1}">
	<script>
		alert("입력이 제대로 되지 않았습니다");
		history.go(-1);
	</script>
</c:if>

<c:if test="${proresult == 1}">
	<script>
		alert("사업장 정보 등록완료");
		location.href = "rminsertform";
	</script>
</c:if>






