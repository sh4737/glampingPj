<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<title>글램핑</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/primary.css">
</head>
<body>

	<!-- source start -->
	<header class="col-8 container-fluid main">
		<div class="top">
			<div>
				<a href="${pageContext.request.contextPath }/main">logo</a>
			</div>
			<div class="dropdown">
			
				<button class="dropdown-button"><img class="log" src="${pageContext.request.contextPath }/images/log.png"></button>
				<div class="dropdown-content">
					<a href="#">로그인</a> <a href="#">공지사항</a> <a href="#">Q&A</a>
				</div>
			</div>
		</div>
	</header>