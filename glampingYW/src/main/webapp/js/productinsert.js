$(document).ready(function() {

	//좌표구하기

	$('#myad').click(function() {

		var geocoder = new kakao.maps.services.Geocoder();

		geocoder.addressSearch($("#pro_addr").val(), function(result, status) {
			
		$("#pro_x").val(result[0].x);
		$("#pro_y").val(result[0].y);
		});
		
	});
	
	$('#spost').click(function() {
		$("#pro_x").val("");
		$("#pro_y").val("");
	});


	//업체사진 추가 버튼
	$("#add_pp_name").click(function() {
		var addPicText = '<tr id="tr_pp_name">' +
			'    <td></td>' +
			'    <td>' +
			'        <input type="file" id="pp_name1" name="pp_name1" />' +
			'        <button name="del_pp_name" class="bt-deco1">삭제</button>' +
			'    </td>' +
			'</tr>';

		var trHtml = $("tr[id=tr_pp_name]:last"); //last를 사용하여 tr_pp_name라는 명을 가진 마지막 태그 호출

		trHtml.after(addPicText);


	});


	//업체사진 삭제 버튼
	$(document).on("click", "button[name=del_pp_name]", function() {

		var trHtml = $(this).parent().parent();

		trHtml.remove(); //tr 테그 삭제

	});

	/*-------------------------------------------------------------------------------------------------------*/

	//객실사진 추가 버튼
	$("#add_rp_name").click(function() {
		var addPicText = '<tr id="tr_rp_name">' +
			'    <td></td>' +
			'    <td>' +
			'        <input type="file" id="rp_name1" name="rp_name1" />' +
			'        <button name="del_rp_name" class="bt-deco1">삭제</button>' +
			'    </td>' +
			'</tr>';

		var trHtml = $("tr[id=tr_rp_name]:last"); //last를 사용하여 tr_pp_name라는 명을 가진 마지막 태그 호출

		trHtml.after(addPicText);


	});


	//객실사진 삭제 버튼
	$(document).on("click", "button[name=del_rp_name]", function() {

		var trHtml = $(this).parent().parent();

		trHtml.remove(); //tr 테그 삭제

	});

	/*-------------------------------------------------------------------------------------------------------*/
	// 객실항목추가시 번호증가
	/*	var xnum = 0;
		if($("#add_room").click(function() {
			xnum += 1;
			$("#xnum").text(xnum);
		}));
		if($(document).on("click","button[name=del_room]",function(){
			xnum -= 1;
			$("#xnum").text(xnum);
		}));	*/
	/*-------------------------------------------------------------------------------------------------------*/

	//객실항목 추가 버튼 및 유효성검사
	/*    $("#add_room").click(function() {
					
			
			var addPicText =     '<tbody id="tbody_add_room">'+
			'<tr>'+'<td>'+'<h4>객실정보</h4>'+'</td>'+'<td>'+'<button name="del_room">삭제</button>'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'객실명:'+'</td>'+'<td>'+'<input id="rm_tname" name="rm_tname" size="50">'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'인원수(객실당):'+'</td>'+'<td>'+'<input id="rm_pno" name="rm_pno" size="2">명'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'객실수:'+'</td>'+'<td>'+'<input id="rm_rno" name="rm_rno" size="2">개'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'가격(1박):'+'</td>'+'<td>'+'<input id="rm_price" name="rm_price" size="10">원'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'객실대표사진'+'</td>'+'<td>'+'<input type="file" id="rm_pic1" name="rm_pic1" />'+'</td>'+'</tr>'+
			'<tr>'+'<td>'+'객실사진'+'</td>'+'<td>'+'<input type="button" value="사진추가" id="add_rp_name"/>'+'</td>'+'</tr>'+
			'<tr id="tr_rp_name">'+'</tr>'+
			'<tr>'+'<td colspan="2">'+'<hr>'+'</td>'+'</tr>'+
			'</tbody>';
		   
	 
	
	
		var trHtml = $( "tbody[id=tbody_add_room]:last" ); 
	    
		trHtml.after(addPicText); 
			
			
		});
	    
	    
		//객실항목 삭제 버튼
		$(document).on("click","button[name=del_room]",function(){
		    
			var trHtml = $(this).parent().parent().parent();
		    
			trHtml.remove(); //tr 테그 삭제
		    
		});	*/



	/*-------------------------------------------------------------------------------------------------------*/

	// 유효성 검사
	$("form").submit(function() {

		if ($("#pro_ceo").val() == "") {
			alert("대표자명을 입력하세요");
			$("#pro_ceo").focus();
			return false;
		}
		if ($("#pro_name").val() == "") {
			alert("상품명을 입력하세요");
			$("#pro_name").focus();
			return false;
		}
		if ($("#pro_post").val() == "") {
			alert("우편번호를 입력하세요");
			$("#pro_post").focus();
			return false;
		}
		if ($("#pro_addr").val() == "") {
			alert("주소를 입력하세요");
			$("#pro_addr").focus();
			return false;
		}
		if ($("#pro_x").val() == "") {
			alert("좌표를 입력 버튼을 클릭하세요");
			$("#pro_x").focus();
			return false;
		}
		if ($("#pro_y").val() == "") {
			alert("좌표를 입력 버튼을 클릭하세요");
			$("#pro_y").focus();
			return false;
		}
		if ($("#pro_n1").val() == "") {
			alert("사업자번호 앞자리를 입력하세요");
			$("#pro_n1").focus();
			return false;
		}
		if (isNaN($("#pro_n1").val())) {
			alert("사업자번호는 숫자만 입력하세요");
			$("#pro_n1").val("").focus();
			return false;
		}
		if ($("#pro_n2").val() == "") {
			alert("사업자번호 뒷자리를 입력하세요");
			$("#pro_n2").focus();
			return false;
		}
		if (isNaN($("#pro_n2").val())) {
			alert("사업자번호는 숫자만 입력하세요");
			$("#pro_n2").val("").focus();
			return false;
		}
		if ($("input:checkbox[name='pro_con']:checked").length < 1) {
			alert("편의시설은 1개 이상 선택하세요");
			return false;
		}
		if ($("#pro_pic1").val() == "") {
			alert("업체대표사진을 입력하세요");
			$("#pro_pic").focus();
			return false;
		}
		if ($("#pp_name1").val() == "") {
			alert("업체사진을 입력하세요");
			$("#pro_pic").focus();
			return false;
		}
		if ($("#pro_intro").val() == "") {
			alert("업체 소개글을 작성하세요");
			$("#pro_intro").focus();
			return false;
		}

		
/*		var geocoder = new kakao.maps.services.Geocoder();

		geocoder.addressSearch($("#pro_addr").val(), function(result, status) {


			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].x, result[0].y);

				$("#id").val(coords);


			}
		});*/
		
		

	});


}); // ready end

