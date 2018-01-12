// JavaScript Document

	//图片轮换
	$(".p").hover(
		function(){
			$("#"+$(this).get(0).id+"1").get(0).style.display="block";
			},
			function(){
				$("#"+$(this).get(0).id+"1").get(0).style.display="none";
				}
			)	
$("#xiaotu-zhengmian").click(function(){
	$("#xiaotu-zhengmian img").css("border","1px solid #ff8066");
	$("#xiaotu-cemian img").css("border","none");
	$("#xiaotu-beimian img").css("border","none");
	$("#xiaotu-shouchi img").css("border","none");
	$("#zuocedatu").attr("src","img/魅族MX5正面@680x680.jpg");
	$(".jqzoom").attr("href","img/魅族MX5正面@680x680.jpg");
})
$("#xiaotu-cemian").click(function(){
	$("#xiaotu-cemian img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-beimian img").css("border","none");
	$("#xiaotu-shouchi img").css("border","none");
	$("#zuocedatu").attr("src","img/魅族MX5侧面.jpg");
	$(".jqzoom").attr("href","img/魅族MX5侧面@120x120.jpg");
})
$("#xiaotu-beimian").click(function(){
	$("#xiaotu-beimian img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-cemian img").css("border","none");
	$("#xiaotu-shouchi img").css("border","none");
	$("#zuocedatu").attr("src","img/魅族MX5背面.jpg");
	$(".jqzoom").attr("href","img/魅族MX5背面@120x120.jpg");
})
$("#xiaotu-shouchi").click(function(){
	$("#xiaotu-shouchi img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-cemian img").css("border","none");
	$("#xiaotu-beimian img").css("border","none");
	$("#zuocedatu").attr("src","img/魅族MX5手持.jpg");
	$(".jqzoom").attr("href","img/手持@120x120.jpg");
})