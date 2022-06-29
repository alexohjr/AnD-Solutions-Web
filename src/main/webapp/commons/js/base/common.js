$(function() {
	scrollTopBtn();
});

// top 버튼 클릭
function scrollTopBtn() {
	window.addEventListener('scroll', function(e) {
		var distanceY = window.pageYOffset || document.documentElement.scrollTop; // 내려간 세로거리
		var shrinkOn = 60; // 기준점인 y 픽셀.
		
		if (distanceY > shrinkOn) { // 내려간 경우
			$("#top_btn").addClass("show");
		} else { // 내려가지 않은 경우
			$("#top_btn").removeClass("show");
		}
	});
	
	$("#top_btn").on("click", function() {
		$('html, body').animate({scrollTop: 0}, 200);
		$("#gnb ul li").removeClass("active");
		$("#gnb ul li").removeClass("activePr");
	});
}

