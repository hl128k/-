// JavaScript Document
$(function() {
	$("#content-nav a").click(function() {
		$("#content-nav a").removeClass("active");
		$(this).addClass("active");

		$("#orderItem div").removeClass("active");
		$("#" + $(this).attr("id") + "Div").addClass("active");
	});

});