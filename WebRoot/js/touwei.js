// JavaScript Document

$(document).ready(function() {
	$("#daohangcd li").hover(function() {
		if ($(this).parent().parent().get(0).className !== "daohangcdDiv") {
			$(this).css("color", "#00C3F5");
		}
		$("#" + $(this).get(0).id + "Div").show();
	}, function() {
		$("#" + $(this).get(0).id + "Div").hide();
		if ($(this).parent().parent().get(0).className !== "daohangcdDiv") {
			$(this).css("color", "#000");
		}
	});

	$("#denglugrxx").on("mouseover", "#shop", function() {
		$("#" + $(this).get(0).id + "Div").show();
	});
	$("#denglugrxx").on("mouseout", "#shop", function() {
		$("#" + $(this).get(0).id + "Div").hide();
	});
	$("#denglugrxx").on("click", "#outlogn", function() {
		window.location.href = "cancellation";
	});

	$("#daohangcd").hover(function() {
		$(".daohangcdDiv").animate({
			height : '250px'
		}, 200);
		$(".daohangcdDiv").css("border", "1px solid #000");
	}, function() {
		$(".daohangcdDiv").animate({
			height : '0px'
		}, 0);
		$(".daohangcdDiv").css("border", "0px solid #000");
	});
});
