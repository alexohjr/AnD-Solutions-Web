$(function() {
	gnbClickEvent(); // gnb 메뉴클릭 이벤트
	gnbScrollEvent(); // 스크롤값에 따라 변경되는 gnb 
	
	bxSlider(); // bxSlider
	
	customFileButton(); // 파일첨부 버튼 커스텀
	
	AOS.init(); // aos 실행
	
	showImageModal(); // prcenter 이미지슬라이드 모달
	
	inquiryFormEvent(); // 견적신청서 이벤트
	
	
	explorerScroll(); // 익스플로러 백그라운드 문제 해결
	
	window.addEventListener('load', AOS.refresh);
	
	kakaoMap(); // 카카오맵 api
	resizeEvent(); // 창크기 리사이즈 이벤트
});

function loading_end() {
	$(".loader-outer").addClass("end"); 
	$("#wrap").addClass("show");
	$("#header").addClass("show");
	$("#footer ").addClass("show");
}

function gnbClickEvent() {
	$("#gnb ul li").on("click", function() {
		var $id = $(this).attr("id");
		var offset = $(".section-inner." + $id).offset();
		$('html, body').animate({scrollTop : offset.top}, 300);
	});
}

function gnbScrollEvent() {
	
	window.addEventListener('scroll', function(e) {
		
		var gnb_pos = $("#gnb").offset().top + $("#gnb").outerHeight() / 2;
		
		if(gnb_pos >= $(".section.solution").offset().top) {
			$("#gnb").addClass("scroll");
			
			if(gnb_pos >= $(".section.solution").offset().top) {
				$("#gnb ul li").removeClass("active");
				$("#gnb ul li").removeClass("activePr");
				$("#gnb ul li:nth-child(1)").addClass("active");
			} 
			
			if(gnb_pos >= $(".section.business").offset().top) {
				$("#gnb ul li").removeClass("active");
				$("#gnb ul li").removeClass("activePr");
				$("#gnb ul li:nth-child(2)").addClass("active");
			}
			  
			if(gnb_pos >= $(".section.product").offset().top) {
				$("#gnb ul li").removeClass("active");
				$("#gnb ul li").removeClass("activePr");
				$("#gnb ul li:nth-child(3)").addClass("activePr");
			}
			
			if(gnb_pos >= $(".section.prcenter").offset().top) {
				$("#gnb ul li").removeClass("active");
				$("#gnb ul li").removeClass("activePr");
				$("#gnb ul li:nth-child(4)").addClass("active");
			} 
			if(gnb_pos >= $(".section.inquiry").offset().top) {
				$("#gnb ul li").removeClass("active");
				$("#gnb ul li:nth-child(5)").addClass("active");
			}
			
		} else {
			$("#gnb").removeClass("scroll");
			$("#gnb ul li").removeClass("active");
			$("#gnb ul li").removeClass("activePr");
		}
	});
}

function bxSlider() {
	var mainVisual = $(".bx_slider").bxSlider({
		mode : 'fade',
		auto : true, // 자동으로 슬라이드
		controls : false, // 좌우 화살표
		autoControls : false, // stop,play
		pager : false, // 페이징
		pause : 8000,
		autoDelay : 0,
		autoHover: false,
		speed : 500,
		stopAutoOnclick : false,
		stopAuto: false,
		touchEnabled:false,
		onSlideAfter: function(currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
			$('.active-slide').removeClass('active-slide');
			$('.bx_slider>div').eq(currentSlideHtmlObject).addClass('active-slide');
		},
		onSliderLoad: function() {
			$(".load_slider").css("visibility", "visible");
			/*$(".load_slider").css("visibility", "visible").animate({opacity:1});*/
			loading_end();
			$('.bx_slider>div').eq(0).addClass('active-slide')
		}
	});
	
	$(document).on('click', '.bx-next, .bx-prev', function() {
		mainVisual.stopAuto();
		mainVisual.startAuto();
	});
	
	$(document).on('mouseover', '.bx-pager', function() {
		mainVisual.stopAuto();
		mainVisual.startAuto();
	});
}

function customFileButton() {
	var fileTarget = $(".inquiry_form-inner .file");
	
	fileTarget.on("change", function() {
		if(window.FileReader) {
			var fileName = $(this)[0].files[0].name;
		} else {
			var fileName = $(this).val().split('/').pop().split('\\').pop(); // 파일명 추출
		}
		$(".inquiry_form-inner .fileName").val(fileName);
	});
}
  
// 카카오지도 api
function kakaoMap() {
	var container = document.getElementById('kakao-map');
	var options = {
		center : new kakao.maps.LatLng(37.47978907019756, 126.88674866305796), // 지도의 중심 좌표
		level: 3 // 지도의 레벨 (확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
	
	// 마커 이미지
	/*var imageSrc = utils.getContextPath() + "/resources/img/common/andsolutions_favicon.png",
	imageSize = new kakao.maps.Size(48,52),
	imageOption = {offset: new kakao.maps.Point(27, 69)};
	
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);*/

	// 마커가 표시될 위치
	var markerPosition = new kakao.maps.LatLng(37.479750, 126.884536);

	// 마커 생성
	var marker = new kakao.maps.Marker({
		position: markerPosition,
		/*image: markerImage*/ // 마커이미지
	});

	// 마커 표시
	marker.setMap(map);
	
	
	// 일반지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤 생성
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됨
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);
	
	// 지도 확대 출소를 제어할 수 있는 줌 컨트롤 생성
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);

	
}

function resizeEvent() {
	$(window).resize(function() {
		kakaoMap();
	});
}

// 익스플로러 background-attachment: fixed 문제 해결
function explorerScroll() {
	if(navigator.userAgent.match(/Trident\/7\./)) {
	    $('body').on("mousewheel", function () {
	        event.preventDefault();

	        var wheelDelta = event.wheelDelta;

	        var currentScrollPosition = window.pageYOffset;
	        window.scrollTo(0, currentScrollPosition - wheelDelta);
	    });

	    $('body').keydown(function (e) {
	    	//e.preventDefault(); // prevent the default action (scroll / move caret)
	        var currentScrollPosition = window.pageYOffset;

	        switch (e.which) {

	            case 38: // up
	                window.scrollTo(0, currentScrollPosition - 120);
	                break;

	            case 40: // down
	                window.scrollTo(0, currentScrollPosition + 120);
	                break;

	            default: 
	            	return; // exit this handler for other keys
	        } 
	    });
	}
}

// pr-center 이미지모달창 띄우기
function showImageModal() {

	var modal = document.getElementById('pr-modal');
	var modalInner = document.getElementById('pr-modal-inner');
	  
	var modalSlider = $(".modal-slider").bxSlider({
		pagerCustom: '.modal-slider-pager',
	});
	
	$(".prcenter-inner .img_area ul li").on("click", function() {
		var img_idx = $(this).attr("data-img-idx");
		
		modalSlider.reloadSlider({
			startSlide: img_idx,
			auto : false, // 자동으로 슬라이드
			controls : false, // 좌우 화살표
			autoControls : false, // stop,play
			/*pager : true, // 페이징
*/			speed : 500,
			touchEnabled: true,
			pagerCustom: '.modal-slider-pager',
			
			/*prevSelector: ".prev-btn",
			nextSelector: ".next-btn",*/
			
			/*nextText: '<img src="resources/img/main/pin.png" height="25" width="25" />',
			prevText: '<img src="resources/img/main/pin.png" height="25" width="25" />',*/
			
			/*nextText: '<span class="modal-next-btn" />',
			prevText: '<span class="modal-prev-btn" />', */
		});
		$("#pr-modal").addClass("show");
		
		$('#wrap').on('scroll touchmove mousewheel', function(event) {
			  event.preventDefault();
			  event.stopPropagation();
			  return false;
		}); 
	});
	
	$("#pr-modal .modal-slide-btn").on("click", function() {
		if($(this).hasClass("prev")) {
			modalSlider.goToPrevSlide();
		} else {
			modalSlider.goToNextSlide();
		}
	});
	
	
	// 모달창 닫기 버튼 클릭
	$(".modal-content .close").on("click", function() {
		$("#pr-modal").removeClass("show");
		$('#wrap').off('scroll touchmove mousewheel');
		/*$(".modal-text").hide();*/
	});  
	
	// 모달창 배경 클릭 시 모달창 닫음
	window.onclick = function(event) {
        if (event.target == modalInner || event.target == modal) {
        	$("#pr-modal").removeClass("show");
        	$('#wrap').off('scroll touchmove mousewheel');
        }
    }
}



function inquiryFormEvent() {
	
	$(".inquiry_form-inner .inputText, .inquiry_form-inner textarea").focus(function() {
		$(this).closest(".input-outer").addClass("focus");
	});
	
	$(".inquiry_form-inner .inputText, .inquiry_form-inner textarea").focusout(function() {
		$(this).closest(".input-outer").removeClass("focus");
	});
	
	$(".inquiry_form-inner .input-outer, .inquiry_form-inner .label").on("click", function() {
		$(this).children(".inputText").focus();
	});
	
	$(".inquiry_form-inner .input-file-outer").on("click", function() {
		$("#upload_file").trigger("click");
	});
	
	//숫자 정규식
	var regNumber = /^[0-9]*$/;
	// 핸드폰 번호 정규식
	var regPhoneNumber = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/;
	// 이메일 주소 정규식
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	$(".inquiry_form-inner .btn").on("click", function() {
		var name = $(".inquiry_form-inner .input-outer .inputName");
		var phone = $(".inquiry_form-inner .input-outer .inputPhone");
		var mail = $(".inquiry_form-inner .input-outer .inputMail");
		var content = $(".inquiry_form-inner .input-outer .inputContent");
		
		if(name.val().trim().length < 1) {
			alert("성함을 입력해주시기 바랍니다.");
			name.focus();
			return false;
		}
		
		if(phone.val().trim().length < 1) {
			alert("연락처를 입력해주시기 바랍니다.");
			phone.focus();
			return false;
		} else {
			
			if(!regNumber.test(phone.val())) {
				alert("연락처에 숫자만 입력해주세요.");
				phone.focus();
				return false;
			} else if(phone.val().length < 10 || phone.val().length > 11) {
				alert("올바른 휴대폰 번호를 입력해주세요.");
				phone.focus();
				return false;
			} 
		}
		
		if(mail.val().trim().length < 1) {
			alert("이메일을 입력해주시기 바랍니다.");
			mail.focus();
			return false;
		} else {
			
			if(!regEmail.test(mail.val())) {
				alert("올바른 이메일주소를 입력해주시기 바랍니다.");
				mail.focus();
				return false;
			}
		}
		
		if(content.val().trim().length < 1) {
			alert("문의내용을 입력해주시기 바랍니다.");
			content.focus();
			return false;
		}
		
	});
	
}  
