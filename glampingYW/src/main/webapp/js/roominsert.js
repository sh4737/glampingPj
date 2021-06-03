$(document).ready(function(){	
	
    //업체사진 추가 버튼
    $("#add_pp_name").click(function() {
        var addPicText =     '<tr id="tr_pp_name">'+
        '    <td></td>'+
        '    <td>'+
        '        <input type="file" id="pp_name1" name="pp_name1" />'+  
        '        <button name="del_pp_name">삭제</button>'+
        '    </td>'+
        '</tr>';
        
    var trHtml = $( "tr[id=tr_pp_name]:last" ); //last를 사용하여 tr_pp_name라는 명을 가진 마지막 태그 호출
    
    trHtml.after(addPicText); 
    	
    	
	});
    
    
    //업체사진 삭제 버튼
    $(document).on("click","button[name=del_pp_name]",function(){
        
        var trHtml = $(this).parent().parent();
        
        trHtml.remove(); //tr 테그 삭제
        
    });
	
/*-------------------------------------------------------------------------------------------------------*/	
	
    //객실사진 추가 버튼
    $("#add_rp_name").click(function() {
        var addPicText =     '<tr id="tr_rp_name">'+
        '    <td></td>'+
        '    <td>'+
        '        <input type="file" id="rp_name1" name="rp_name1" />'+  
        '        <button name="del_rp_name">삭제</button>'+
        '    </td>'+
        '</tr>';
        
    var trHtml = $( "tr[id=tr_rp_name]:last" ); //last를 사용하여 tr_pp_name라는 명을 가진 마지막 태그 호출
    
    trHtml.after(addPicText); 
    	
    	
	});
    
    
    //객실사진 삭제 버튼
    $(document).on("click","button[name=del_rp_name]",function(){
        
        var trHtml = $(this).parent().parent();
        
        trHtml.remove(); //tr 테그 삭제
        
    });	
	
/*-------------------------------------------------------------------------------------------------------*/	

	// 객실항목추가시 번호증가
/*	var xnum = 1;
	$("#add_room").click(function() {		
		xnum += 1;
		$("#xnum").text(xnum+"번 객실");
	});*/

/*-------------------------------------------------------------------------------------------------------*/		
		
	// 유효성 검사
	$("form").submit(function(){	
		
		if($("#rm_tname").val()==""){
			alert("객실명을 입력하세요");
			$("#rm_tname").focus();
			return false;
		}
		if($("#rm_pno").val()==""){
			alert("객실당 인원수를 입력하세요");
			$("#rm_pno").focus();
			return false;
		}
		if(isNaN($("#rm_pno").val())){
			alert("객실당 인원수는 숫자만 입력하세요");
			$("#rm_pno").val("").focus();
			return false;
		}
		if($("#rm_rno").val()==""){
			alert("객실 수량을 입력하세요");
			$("#rm_rno").focus();
			return false;
		}
		if(isNaN($("#rm_rno").val())){
			alert("객실 수량은 숫자만 입력하세요");
			$("#rm_rno").val("").focus();
			return false;
		}
		if($("#rm_price").val()==""){
			alert("객실 가격을 입력하세요");
			$("#rm_price").focus();
			return false;
		}
		if(isNaN($("#rm_price").val())){
			alert("객실 가격은 숫자만 입력하세요");
			$("#rm_price").val("").focus();
			return false;
		}
		if($("#rm_pic1").val()==""){
			alert("객실 대표사진을 입력하세요");
			$("#rm_pic1").focus();
			return false;
		}
		if($("#rp_name1").val()==""){
			alert("객실사진을 입력하세요");
			$("#rp_name1").focus();
			return false;
		}
		

	
	});
	
	
}); // ready end
	
