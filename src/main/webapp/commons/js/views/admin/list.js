$(function() {
	
	// 글 내용 토글
	toggleContent();
	
	// 리스트 타입 선택
	changeListType();
	
	// 검색 이벤트
	searchEvent();
	
	// 첨부파일 다운로드
	downloadFile();
	
	// 서머노트 위즈윅 적용
	summernote();
	
	// 견적요청 삭제
	deleteInquiry();
	
	// 페이징처리 이벤트
	pagingEvent();
	
	// 버튼 이벤트
	buttonEvent();
	
});

function toggleContent() {

	$(".list_title").on("click", function() {
		if($(this).hasClass("active")) {
			$(this).removeClass("active");
			$(this).next(".list_content").removeClass("show");
			$(this).siblings(".list_answer_area").removeClass("show");
		} else {
			$(".list_title").removeClass("active");
			$(this).addClass("active");
			$(".list_content").removeClass("show");
			$(this).next(".list_content").addClass("show");
			$(".list_answer_area").removeClass("show");
			$(this).siblings(".list_answer_area").removeClass("show");
		}
	});
	
	$(".list_content .answerBtn").on("click", function() {
		$(this).parent().next(".list_answer_area").addClass("show");
		$(this).parent(".list_content").removeClass("show");
		$(this).parent(".list_content").next().find(".note-editable").focus();
	});
	
	$(".list_answer_area .cancelBtn").on("click", function() {
		console.log("ㅎㅇㅎㅇ");
		$(this).parents(".list_answer_area").removeClass("show");
		$(this).parents(".list_answer_area").prev(".list_content").addClass("show");
	});
}

// 리스트 타입 이벤트
function changeListType() {
	$(".sub_title .listSelect").mouseup(function() {
		var open = $(this).data("isopen");
		if(open) {
			location.href = utils.getContextPath() + "/admin/list?type="+$(this).val()
		}
		$(this).data("isopen", !open);
	});
}

// 검색 이벤트
function searchEvent() {
	
	$(".search_form").submit(function() {
		if($(".searchInput").val().trim().length < 1) {
			
			alert("검색어를 입력해주시기 바랍니다.");
			$(".searchInput").focus();
			return false;
		} else {
			$(".searchInput").val($(".searchInput").val().trim());
			return true;
		}
	});
}

// 서머노트 위즈윅
function summernote() {
	$(".answer_editor").summernote({
		height: 400,
		lang: 'ko-KR',
		disableResizeEditor: true,
		defaultFontName: 'Arial', 
		toolbar: [
			  ['style', ['style']],
			  ['font', ['bold', 'underline', 'clear']],
			  ['fontname', ['NanumSquare']],
			  ['color', ['color']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['table', ['table']],
			  ['insert', ['link', 'picture', 'video']],
			  ['view', ['fullscreen', 'codeview', 'help']],
			],
	});
}

// 문의 첨부파일 다운로드
function downloadFile() {
	$(".download_btn").on("click", function() {
		var code = $(this).closest(".list_elem").attr("data-code");
		location.href = utils.getContextPath() + "/download/"+code;
	});
}

// 견적요청 삭제
function deleteInquiry() {
	$(".list_content .deleteBtn").on("click", function() {
		var $this = $(this);
		var code = $(this).attr("data-code");
		console.log("code :: " + code);
		
		var pageNum = $this.attr("data-pageNum");
		var code = $this.attr("data-code");
		var type = $this.attr("data-type");
		var option = $this.attr("data-option");
		var keyword = $this.attr("data-keyword");
		
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result) {
			/*location.href = utils.getContextPath() + "/admin/delete/"+code;*/
			location.href = utils.getContextPath() + "/admin/delete?code="+code+"&pageNum="+pageNum+"&type="+type+"&option="+option+"&keyword="+keyword;
		} 
	})
}


// 페이징 이벤트
function pagingEvent() {
	$(".pageNum.false").on("click", function() {
		if($(this).hasClass("prevPage")) {
			alert("첫 페이지 입니다.");
		}
		
		if($(this).hasClass("nextPage")) {
			alert("마지막 페이지입니다.");
		}
	});
}

// 버튼 이벤트
function buttonEvent() {
	/*$(".logoutBtn").on("click", function() {
		location.href = utils.getContextPath() + "/log/out";
	});
	
	$(".homeBtn").on("click", function() {
		location.href = utils.getContextPath() + "/main";
	});*/
	
	$(".title .btn_area .btn").on("click", function() {
		var path;
		if($(this).hasClass("logoutBtn")) {
			path = "/log/out";
		} else {
			path = "/main";
		}
		location.href = utils.getContextPath() + path;
	});
}


/*//네이버 스마트 에디터
$(function(){
    //전역변수
    var obj = [];              
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "answer_editor",
        sSkinURI: utils.getContextPath() + "/resources/smartEditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false,
        }
    });
    
    //전송버튼
    $(".submitBtn").click(function(){

    	if( $("#title").val() == null || $("#title").val() == "") {
    		alert("제목을 입력해주세요.");
    		$("#title").focus();
    		return false;
    	}
    	
    	var title = $("#title").val();
    	var titleLen = title.length;
    	var totalByte = 0;
        var len = 0;
        var oneChar = "";
        var str2 = "";

        for(var i=0; i<titleLen; i++) {
        	oneChar = title.charAt(i);
        	if(escape(oneChar).length > 4) {
        		totalByte += 2;
        	} else {
        		totalByte++;
        	}
        }
        if(totalByte > 50) {
        	alert("제목은 25자 이내로 입력가능합니다.");
        	$("#title").focus();
        	return false;
        }
    	if( $("#email").val() == null || $("#email").val() == "") {
    		alert("이메일주소를 입력해주세요.");
    		$("#email").focus();
    		return false;
    	}
    	
    	// 이메일 정규식
    	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

    	if(!regEmail.test($("#email").val())) {
    		alert("이메일을 정확히 입력해주세요.");
    		$("#email").focus();
    		return false;
    	}
    	if( $("#name").val() == null || $("#name").val() == "") {
    		alert("성함/자사명을 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
    	var regNumber = /^[0-9]*$/;
    	var r_tel2= $(".r_tel2").val();
    	var r_tel3= $(".r_tel3").val();
    	var m_tel2= $(".m_tel2").val();
    	var m_tel3= $(".m_tel3").val();
    	
    	if( !regNumber.test(r_tel2) || !regNumber.test(r_tel3) || !regNumber.test(m_tel2) || !regNumber.test(m_tel3)) {
    		alert("연락처에 숫자만 입력해주세요.");
    		return false;
    	}
    	
    	if(r_tel2.length > 4 || r_tel3.length > 4 || m_tel2.length > 4 || m_tel3.length > 4) {
    		alert("연락처를 정확히 입력해주세요.");
    		return false;
    	}
    	
    	//id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["answer_editor"].exec("UPDATE_CONTENTS_FIELD", []);
    });
});*/


