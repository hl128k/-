// JavaScript Document

$(function() {
	$("#zhifuTop li").click(function() {
		$("#zhifuTop li").removeClass("xuanzhong");
		$(this).addClass("xuanzhong");

		$("#zhifuMian li").removeClass("xuanzhong");
		$("#" + $(this).get(0).id + "Box").addClass("xuanzhong");
	});
	$(".lijizhifu").click(function() {
		if ($(this).parent().is("#saomazhifuBox")) {
			location.href = "payOver";
		} else {
			if ($("input[name='yinhang']:checked").length > 0) {
				$("#overlay").show();
				$("#querenzhifu").show();
			} else {
				alert("请选择一个网银支付方式");
			}
		}
	});
	$("#zhifuchengong").click(function() {
		location.href = "payOver";
	});
	$("#zhifushibai").click(function() {
		$("#overlay").hide();
		$("#querenzhifu").hide();
	});
});