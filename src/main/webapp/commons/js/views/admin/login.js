$(function() {
	adminLoginCheck();
	iconClickEvent();
	
	$(".inputId").focus();
});

function adminLoginCheck() {
	
	var id = $(".inputId");
	var pwd = $(".inputPwd");
	
	$(".loginBtn").on("click", function() {
		if(id.val().trim().length < 1) {
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}
		   
		if(pwd.val().trim().length < 1) {
			alert("비밀번호를 입력해주세요.");  
			pwd.focus();
			return false;
		}
		
		var data = {
			"id" : id.val(),
			"pwd" : pwd.val()
		};
		
		var result;
		
		$.ajax({
			url: utils.getContextPath() + "/log/in",
			type: "post",
			data: data,
			async: false,
			dataType: "json",
			success: function(data) {
				result = data.result;
				if(!result) {
					alert("일치하는 로그인 정보가 없습니다.");
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생 \n" + textStatus + " : " + errorThrown);
	            console.log("textStatus : " , textStatus );
	            console.log("errorThrown : " , errorThrown );
	        }
		});
		return result;
	});
}

function iconClickEvent() {
	$(".fa-arrow-circle-left").on("click", function() {
		history.go(-1);
	});
	
	$(".fa-home").on("click", function() {
		location.href = utils.getContextPath() + "/main";
	});
}