$(function() {
	footerBtnClickEvent();
});

function footerBtnClickEvent() {
	$("#footer-inner .inquiryBtn").on("click", function() {
		var offset = $(".section-inner.inquiry-inner").offset();
		$('html, body').animate({scrollTop : offset.top}, 300);
		$(".inquiry_form-inner .input-outer .inputName").focus();
	});
}