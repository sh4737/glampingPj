$(document).ready(function(){	
	
		
	// 유효성 검사
	$("form").submit(function(){
		
		if($("#pro_ceo").val() == ""){
			alert("대표자명을 입력하세요");
			$("#pro_ceo").focus();
			return false;
		}	
		if($("#pro_name").val()==""){
			alert("상품명을 입력하세요");
			$("#pro_name").focus();
			return false;
		}
		if($("#pro_post").val()==""){
			alert("우편번호를 입력하세요");
			$("#pro_post").focus();
			return false;
		}	
		if($("#pro_addr").val()==""){
			alert("주소를 입력하세요");
			$("#pro_addr").focus();
			return false;
		}			
		if($("#pro_n1").val()==""){
			alert("사업자번호 앞자리를 입력하세요");
			$("#pro_n1").focus();
			return false;
		}
		if(isNaN($("#pro_n1").val())){
			alert("사업자번호는 숫자만 입력하세요");
			$("#pro_n1").val("").focus();
			return false;
		}
		if($("#pro_n2").val()==""){
			alert("사업자번호 뒷자리를 입력하세요");
			$("#pro_n2").focus();
			return false;
		}
		if(isNaN($("#pro_n2").val())){
			alert("사업자번호는 숫자만 입력하세요");
			$("#pro_n2").val("").focus();
			return false;
		}
		if($("#pro_pic").val()==""){
			alert("업체 대표사진은 반드시 필요합니다");
			$("#pro_pic").focus();
			return false;
		}
		if($("#pro_intro").val()==""){
			alert("업체 소개글을 작성하세요");
			$("#pro_intro").focus();
			return false;
		}

		
	
	});
	
	
}); // ready end
	
