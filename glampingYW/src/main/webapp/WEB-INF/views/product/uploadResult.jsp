<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result == 1 }">
	<script>
		alert("사진파일은 10MB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("사진첨부파일은 jpg, jpeg, gif, png파일만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${pp_result == 1 }">
	<script>
		alert("업체사진파일은 10MB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${pp_result == 2 }">
	<script>
		alert("업체사진 첨부파일은 jpg, jpeg, gif, png파일만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${rp_result == 1 }">
	<script>
		alert("객실사진파일은 10MB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${rp_result == 2 }">
	<script>
		alert("객실사진 첨부파일은 jpg, jpeg, gif, png파일만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>