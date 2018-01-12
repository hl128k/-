// JavaScript Document
$(document).ready(function() {
	$("#denglugrxx").on("mouseover", "#shop", function() {
		$("#" + $(this).get(0).id + "Div").show();
	});
	$("#denglugrxx").on("mouseout", "#shop", function() {
		$("#" + $(this).get(0).id + "Div").hide();
	});
});

// 导航二级菜单
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
	$("#daohangcd").hover(function() {
		$(".daohangcdDiv").animate({
			height : '260px'
		}, 200);
		$(".daohangcdDiv").css("border", "1px solid #000");
	}, function() {
		$(".daohangcdDiv").animate({
			height : '0px'
		}, 0);
		$(".daohangcdDiv").css("border", "0px solid #000");
	});
});

// 滚动广告
var id = 1;
function tongbu() {
	var showDiv = $("#v" + id);
	var showAdDiv = $("#v" + id + "Ad");
	$("#yindao li").removeClass("xuanzhong");
	showDiv.addClass("xuanzhong");

	$("#gdggTp li").removeClass("showAD");
	showAdDiv.addClass("showAD");
}
var autogundong
function shijian() {
	tongbu();
	if (id < 6) {
		id++;
	} else {
		id = 1;
	}
	autogundong = setTimeout('shijian()', 3000);

}
$(document).ready(function() {
	$("#fenleidaogang:first ul li").hover(function() {
		$("#" + $(this).get(0).id + "Div").show();// .fadeIn("100")
		if ($(this).parent().parent().get(0).className !== "liebiao") {
			$(this).css("opacity", 1);
		}
	}, function() {
		$("#" + $(this).get(0).id + "Div").hide();// .fadeOut("100")
		if ($(this).parent().parent().get(0).className !== "liebiao") {
			$(this).css("opacity", 0.6);
		}
	});

	autogundong = setTimeout('shijian()', 0);
	$(".next a").click(function() {
		if (id < 6) {
			id++;
		} else {
			id = 1;
		}
		tongbu();
	});
	$(".prev a").click(function() {
		if (id > 1) {
			id--;
		} else {
			id = 6;
		}
		tongbu();
	});
	$("#yindao li").click(function() {
		id = $(this).get(0).value;
		tongbu();
	});

	$("#gdgg").hover(function() {
		clearTimeout(autogundong);
		$(".next").show();
		$(".prev").show();
	}, function() {
		autogundong = setTimeout('shijian()', 3000);
		$(".next").hide();
		$(".prev").hide();
	});

});

// 滚轮广告
$(function() {
	var lbggWidth = $("#lbggOut").width();
	$("#rightBtn").click(function() {
		if ($("#lbggIn").position().left >= lbggWidth * -1) {
			$("#lbggIn").animate({
				left : "-=" + lbggWidth
			}, 500, function() {
				if ($("#lbggIn").position().left < lbggWidth * -2) {
					$("#lbggIn").animate({
						left : lbggWidth * -2
					}, 2);
				}
			});
		}
	});
	$("#leftBtn").click(function() {
		if ($("#lbggIn").position().left < 0) {
			$("#lbggIn").animate({
				left : "+=" + lbggWidth
			}, 500, function() {
				if ($("#lbggIn").position().left > 0) {
					$("#lbggIn").animate({
						left : 0
					}, 2)
				}
			});
		}
	});
	$('#lbggIn div').hover(function() {
		// if ($(this).find('img:animated').length) return;
		$(this).animate({
			marginTop : '0px'
		}, 100);
		$(this).find('img').animate({
			width : '204px'
		}, 100);
	}, function() {
		$(this).animate({
			marginTop : '24px'
		}, 100);
		$(this).find('img').animate({
			width : '180px'
		}, 100);
	});
});

// 推荐区域
$(function() {
	$('.tuijianBox').hover(function() {
		$(this).animate({
			marginTop : '0px'
		}, 100);
		$(this).find('img').animate({
			width : '204px'
		}, 100);
	}, function() {
		$(this).animate({
			marginTop : '24px'
		}, 100);
		$(this).find('img').animate({
			width : '180px'
		}, 100);
	});
});

// 返回顶部
var retopSet = 1200;
$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > retopSet) {
			$("#ReTop").show(300);
		} else {
			$("#ReTop").hide(100);
		}
	});
	$("#ReTop").click(function() {
		$('body,html').animate({
			scrollTop : 0
		});
	});
});
