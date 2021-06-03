<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
어서와 ${sel_id }
<a href="proinsertform?sel_id=${sel_id}">
<input type="button" value="상품등록으로 이동">
</a>

<a href="selprolist?sel_id=${sel_id}">
<input type="button" value="상품목록 이동">
</a>

<a href="main?sel_id=${sel_id}">
<input type="button" value="상품목록 이동(메인)">
</a>
</body>
</html>