$(function() {
	$("#header img").on("click", function() {
		/*$('html, body').animate({scrollTop: 0}, 200);*/
		
		
		location.href = utils.getContextPath() + "/main";
	});
});
