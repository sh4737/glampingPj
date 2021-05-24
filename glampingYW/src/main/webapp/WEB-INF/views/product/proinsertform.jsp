<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header 파일 불러오기 -->
<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- 카카오API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('pro_post').value = data.zonecode;
                document.getElementById("pro_addr").value = data.address;
            }
        }).open();
    }
</script>


<!-- 외부스크립트 불러오기 -->	
<script src="./js/productinsert.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/yw.css">

<section class="col-8 container-fluid ">

	<form method="post" action="<%=request.getContextPath() %>/proinsert" enctype="multipart/form-data">
	<input type="hidden" name="sel_id" value="${sel_id }">
	<table class="yw_table">
	<div>
	<h2>${sel_id }님의 상품등록 페이지</h2>

		<tr>
			<td>대표자명:</td>
			<td><input id="pro_ceo" name="pro_ceo" size="10"></td>
		</tr>
		<tr>
			<td>상품명:</td>
			<td><input id="pro_name" name="pro_name" size="50"></td>
		</tr>
		<tr>
			<td>사업장 주소:</td>
			<td><input id="pro_post" name="pro_post" size="10" readonly><input type="button" value="우편검색" onclick="execDaumPostcode()"></td>
		</tr>
		<tr>
			<td></td>
			<td><input id="pro_addr" name="pro_addr" size="50"></td>
		</tr>
		
		<tr>
			<td>사업자 번호:</td>
			<td><input id="pro_n1" name="pro_n1" size="10">-<input id="pro_n2" name="pro_n2" size="10"></td>
		</tr>
		<tr>
			<td>편의 시설:</td>
			<td>
				<input type="checkbox" id="con1" name="pro_con" value="와이파이">와이파이
				<input type="checkbox" id="con2" name="pro_con" value="주차시설">주차시설
				<input type="checkbox" id="con3" name="pro_con" value="금연시설">금연시설
				<input type="checkbox" id="con4" name="pro_con" value="야외풀장">야외풀장
				<input type="checkbox" id="con5" name="pro_con" value="바베큐장">바베큐장
				<input type="checkbox" id="con6" name="pro_con" value="캠프파이어">캠프파이어
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<input type="checkbox" id="con7" name="pro_con" value="전용욕실">전용욕실
				<input type="checkbox" id="con8" name="pro_con" value="세탁시설">세탁시설
				<input type="checkbox" id="con9" name="pro_con" value="주방시설">주방시설
				<input type="checkbox" id="con10" name="pro_con" value="세면용품">세면용품
				<input type="checkbox" id="con11" name="pro_con" value="스포츠가능">스포츠가능
				<input type="checkbox" id="con12" name="pro_con" value="애견동반">애견동반
			</td>
		</tr>
	
	    <tr>
     		<td>업체 대표사진</td>
     		<td><input type="file" id="pro_pic" name="pro_pic1" /></td>
   		</tr>
   		
   		<tr>
     		<td>업체사진</td>
     		<td>
     			<input type="file" id="pp_name1" name="pp_name" />
     			<input type="file" id="pp_name2" name="pp_name" />
     			<input type="file" id="pp_name3" name="pp_name" />
     			<input type="file" id="pp_name4" name="pp_name" />
     			<input type="file" id="pp_name5" name="pp_name" />
     			<input type="file" id="pp_name6" name="pp_name" />
     		</td>
   		</tr>
   		
	    <tr>
     		<td>소개글:</td>
     		<td><textarea id="pro_intro" name="pro_intro" rows="8" cols="100"></textarea></td>
   		</tr>
 		
 		<tr>
 			<td colspan="2"><hr></td>
 		</tr>
 		
		</div>
		
		
		<div>
		<tr>
   			<td><h4>1번타입 룸</h4></td>
 		</tr>
 		
		<tr>
			<td>객실명:</td>
			<td><input id="rm_tname" name="rm_tname" size="50"></td>
		</tr>
		
		<tr>
			<td>인원수(객실당):</td>
			<td><input id="rm_pno" name="rm_pno" size="2">명</td>
		</tr>
		
   		<tr>
			<td>객실수:</td>
			<td><input id="rm_rno" name="rm_rno" size="2">개</td>
		</tr>
		
   		<tr>
			<td>가격(1박):</td>
			<td><input id="rm_price" name="rm_price" size="10">원</td>
		</tr>
		
	    <tr>
     		<td>객실프로필사진</td>
     		<td><input type="file" id="rm_pic" name="rm_pic" /></td>
   		</tr>
   		
   		<tr>
     		<td>객실사진</td>
     		<td>
     			<input type="file" id="rp_name1" name="rp_name" />
     			<input type="file" id="rp_name2" name="rp_name" />
     			<input type="file" id="rp_name3" name="rp_name" />
     			<input type="file" id="rp_name4" name="rp_name" />		
     		</td>
   		</tr>
   		
 		<tr>
 			<td colspan="2"><hr></td>
 		</tr>
		</div>
		

		
		<div>
		<tr>
   			<td><h4>2번타입 룸</h4></td>
 		</tr>
 
		<tr>
			<td>객실명:</td>
			<td><input id="rm_tname" name="rm_tname" size="50"></td>
		</tr>
		
		<tr>
			<td>인원수(객실당):</td>
			<td><input id="rm_pno" name="rm_pno" size="2">명</td>
		</tr>
		
   		<tr>
			<td>객실수:</td>
			<td><input id="rm_rno" name="rm_rno" size="2">개</td>
		</tr>
		
   		<tr>
			<td>가격(1박):</td>
			<td><input id="rm_price" name="rm_price" size="10">원</td>
		</tr>
		
	    <tr>
     		<td>객실프로필사진</td>
     		<td><input type="file" id="rm_pic" name="rm_pic" /></td>
   		</tr>
   		
   		<tr>
     		<td>객실사진</td>
     		<td>
     			<input type="file" id="rp_name1" name="rp_name" />
     			<input type="file" id="rp_name2" name="rp_name" />
     			<input type="file" id="rp_name3" name="rp_name" />
     			<input type="file" id="rp_name4" name="rp_name" />		
     		</td>
   		</tr>	
   		
 		<tr>
 			<td colspan="2"><hr></td>
 		</tr>
 		
		</div>
		
		<div>
		<tr>
   			<td><h4>3번타입 룸</h4></td>
 		</tr>
 
		<tr>
			<td>객실명:</td>
			<td><input id="rm_tname" name="rm_tname" size="50"></td>
		</tr>
		
		<tr>
			<td>인원수(객실당):</td>
			<td><input id="rm_pno" name="rm_pno" size="2">명</td>
		</tr>
		
   		<tr>
			<td>객실수:</td>
			<td><input id="rm_rno" name="rm_rno" size="2">개</td>
		</tr>
		
   		<tr>
			<td>가격(1박):</td>
			<td><input id="rm_price" name="rm_price" size="10">원</td>
		</tr>
		
	    <tr>
     		<td>객실프로필사진</td>
     		<td><input type="file" id="rm_pic" name="rm_pic" /></td>
   		</tr>
   		
   		<tr>
     		<td>객실사진</td>
     		<td>
     			<input type="file" id="rp_name1" name="rp_name" />
     			<input type="file" id="rp_name2" name="rp_name" />
     			<input type="file" id="rp_name3" name="rp_name" />
     			<input type="file" id="rp_name4" name="rp_name" />		
     		</td>
   		</tr>	
   		
 		<tr>
 			<td colspan="2"><hr></td>
 		</tr>
 		
		</div>
		
		<div>
		<tr>
   			<td><h4>4번타입 룸</h4></td>
 		</tr>
 
		<tr>
			<td>객실명:</td>
			<td><input id="rm_tname" name="rm_tname" size="50"></td>
		</tr>
		
		<tr>
			<td>인원수(객실당):</td>
			<td><input id="rm_pno" name="rm_pno" size="2">명</td>
		</tr>
		
   		<tr>
			<td>객실수:</td>
			<td><input id="rm_rno" name="rm_rno" size="2">개</td>
		</tr>
		
   		<tr>
			<td>가격(1박):</td>
			<td><input id="rm_price" name="rm_price" size="10">원</td>
		</tr>
		
	    <tr>
     		<td>객실프로필사진</td>
     		<td><input type="file" id="rm_pic" name="rm_pic" /></td>
   		</tr>
   		
   		<tr>
     		<td>객실사진</td>
     		<td>
     			<input type="file" id="rp_name1" name="rp_name" />
     			<input type="file" id="rp_name2" name="rp_name" />
     			<input type="file" id="rp_name3" name="rp_name" />
     			<input type="file" id="rp_name4" name="rp_name" />		
     		</td>
   		</tr>	
   		
 		<tr>
 			<td colspan="2"><hr></td>
 		</tr>
 		
		</div>
		
		<div>
		<tr>
			<td colspan=2 align=center>
				<input type=submit value="상품등록신청"><input type=reset value="취소">
			</td>	
		</tr>
		</div>
			
		</table>	
		
	</form>

</section>

<!-- footer 파일 불러오기 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

