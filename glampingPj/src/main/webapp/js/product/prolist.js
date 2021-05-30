
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
	
	/*지연*/
	function sleep(ms) {
		const wakeUpTime = Date.now() + ms;
		while (Date.now() < wakeUpTime) {}
	};
		
	/*무한 스크롤*/
	window.onscroll =  function() {
		if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			$('#fetchMore').load('/glamping/fetchprolist',
			{"pageNum" : $("#no").val(),
			 "regionS" : $("#regionS").val(),
			 "checkInS" : $("#checkIn").val(),
			 "checkOutS" : $("#checkOut").val(),
			 "capS" : $("#capS").val(),
			 "keyword" : $("#keyword").val()});		
			
		};
		sleep(200);
	};

	
});






/*if(parseInt($("#pageCount").val()) >= parseInt($("#no").val()) ) {
	window.onscroll =  function() {
		if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			sleep(200);
			$('#fetchMore').load('/glamping/fetchprolist',
			{"pageNum" : $("#no").val(),
			 "regionS" : $("#regionS").val(),
			 "checkInS" : $("#checkIn").val(),
			 "checkOutS" : $("#checkOut").val(),
			 "capS" : $("#capS").val(),
			 "keyword" : $("#keyword").val()});		
		};
	};
}*/
