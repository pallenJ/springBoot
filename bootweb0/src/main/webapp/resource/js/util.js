$(function () {

	$(".summernote-trs").each(function() {
		
		var content = $(this).html()
		.replace(/&lt;/gi, "<")
		.replace(/&gt;/gi, ">")
		.replace(/&quot;/gi, "\"")
		.replace(/&#034;/gi,"\"")
		.replace(/&#039;/gi,"\'")
		;
		$(this).html(content);	
	}); //summernote에 html로 쓰인 내용의 변환을 되돌리기 위한것.	
	
});