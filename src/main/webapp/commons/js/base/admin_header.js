$(function() {
	$("#header-inner img").on("click", function() {
		location.href = utils.getContextPath() + "/admin/list";
	});
});