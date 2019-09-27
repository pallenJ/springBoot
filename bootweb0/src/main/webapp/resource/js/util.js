$(function () {

	$(".summernote-trs").each(function() {
		
		var content = $(this).html()
		.replace(/&lt;/gi, "<")
		.replace(/&gt;/gi, ">")
		.replace(/&quot;/gi, "\"")
		.replace(/&#034;/gi,"\"")
		.replace(/&#039;/gi,"\'")
		.replace(/&nbsp;/gi," ")
		;
		$(this).html(content);	
	}); //summernote에 html로 쓰인 내용의 변환을 되돌리기 위한것.	
	
	 $(".pw-form-custom").on("change keyup paste", function() {
		    var pw_eq = $("#brd_pw").val() == $("#brd_pw_ck").val();
		    var pw_length = $(this).val().length >=4;
		    var pw_ck = pw_eq && pw_length;
			if(pw_ck){
				$("input[type=password]").parent("div").removeClass("has-danger");
				$("input[type=password]").removeClass("is-invalid");
				$("input[type=password]").parent("div").addClass("has-success");
				$("input[type=password]").addClass("is-valid");
			}else{
				$("input[type=password]").parent("div").removeClass("has-success");
				$("input[type=password]").removeClass("is-valid");
				$("input[type=password]").parent("div").addClass("has-danger");
				$("input[type=password]").addClass("is-invalid");
				$(".invalid-feedback").text(pw_length?"비밀번호가 일치하지 않습니다":"비밀번호는 최소 4자리 이상이어야 합니다")
			}	    
		    
		    
	});
	
});
