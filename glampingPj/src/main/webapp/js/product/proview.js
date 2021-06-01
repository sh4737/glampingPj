/*datepicker*/
$(function() {

	$("#checkIn").datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: 0,
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
		onClose: function( selectedDate ) {
			var sdate = new Date(selectedDate);
			sdate.setDate(sdate.getDate()+1);
			$("#checkOut").datepicker( "option", "minDate", sdate );
		}
	});

	$("#checkOut").datepicker({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
		onClose: function( selectedDate ) {
			$("#checkIn").datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	//일수 계산
	let start = $("#checkIn").datepicker('getDate');
   	let end = $("#checkOut").datepicker('getDate');
	let days = (end - start)/1000/60/60/24;
	let count = days + "박";
	
	if(days > 0){
	    $("#sel_count").text(count);
	} else {
		$("#sel_count").text("1박");
	}   
	
	$("#checkOut").change(function(){
		start = $("#checkIn").datepicker('getDate');
   		end = $("#checkOut").datepicker('getDate');
		days = (end - start)/1000/60/60/24;
		count = days + "박";
		
		if(days > 0) {
			$("#sel_count").text(count);
		}
		
	});
	$("#checkIn").change(function(){
		start = $("#checkIn").datepicker('getDate');
   		end = $("#checkOut").datepicker('getDate');
		days = (end - start)/1000/60/60/24;
		count = days + "박";
		
		if(days > 0) {
			$("#sel_count").text(count);
		}
		
	});


})

// 가격 정보 출력
function getRmInfo(event) {
	
	var i = event.target.value;
	var setN = 'set_name_'+i;
	var setP = 'set_price_'+i;
		
	document.getElementById('sel_name').innerText = 
		document.getElementById(setN).innerText;
	
	document.getElementById('tname').value = 
		document.getElementById(setN).innerText;
	
	document.getElementById('sel_price').innerText = 
		(document.getElementById(setP).innerText) * (document.getElementById('sel_count').innerText).slice(0,-1);
		
}