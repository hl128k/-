<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="css/touwei.css" />
<link rel="stylesheet" type="text/css" href="css/MZmx5.CSS">
<script src="js/jquery-1.9.1.js" language="javascript"></script>
<script src="js/touwei.js" language="javascript"></script>
<script src="js/jquery.cookie.js" language="javascript"></script>
<html>
<head>
<meta charset="utf-8">
<title>魅族商城 魅族MX5</title>
</head>

<body>
<%
 int id=Integer.parseInt(request.getParameter("id"));
  %>

<div id="head">
		<div id="dengluOut">
			<div id="denglu">
				<div id="denglutz">
					<ul>
						<li><a href="GetindexList">魅族官网</a></li>
						<li>&nbsp;</li>
						<li><a href="GetindexList">魅族商城</a></li>
						<li>&nbsp;</li>
						<li><a href="#">Flyme</a></li>
						<li>&nbsp;</li>
						<li><a href="GetindexList">专卖店</a></li>
						<li>&nbsp;</li>
						<li><a href="#">服务</a></li>
						<li>&nbsp;</li>
						<li><a href="#">社区</a></li>
					</ul>
				</div>

				<div id="denglugrxx">
					<ul>
						<li><a href="GetsearchList">搜索</a></li>
						<li>&nbsp;</li>
						<c:choose>
							<c:when test="${empty user}">
								<li><a href="login.jsp">登录</a></li>
								<li>&nbsp;</li>
								<li><a href="register.jsp">注册</a>
							</c:when>
							<c:otherwise>
								<li id='shop'> <b id='userName'>${user.name }</b>的商场
									<div id='shopDiv'>
										<ul>
											<li><a href='ShoppingCart'>我的购物车</a></li>
											<li><a href='GetMyOrder'>我的订单</a></li>
											<li><a href='GetAddManage'>地址管理</a></li>
											<li><a href='cancellation'>退出</a></li>
										</ul>
									</div></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>
		</div>
		<div id="daohangOut">

			<div id="daohang">
				<div id="dhlog">
					<a href="GetindexList"> <img width="115" height="20" alt="魅族科技（中国）有限公司"
						src="img/logo-header.png" />
					</a>
				</div>
				<div id="daohangcd">
					<ul>
						<c:choose>
							<c:when test="${empty headIdList}">
								<h2>系统错误</h2>
							</c:when>
							<c:otherwise>
								<c:forEach items="${headIdList }" var="Hidmap" varStatus="hi">
									<li id="dh${hi.count }">${Hidmap.name }
										<div class="daohangcdDiv" id="dh${hi.count }Div">
											<ul>
												<c:forEach items="${headmap[Hidmap.name] }" var="map">
													<li><a href="ModelServlet?id=${map.id }">
															<p>
																<img src="img/${ map.cover}" alt="${ map.name}" width="126" height="126" />
															</p>
															<p>${ map.name}</p>
															<p>
																<span>¥ ${ map.money}</span>
															</p>
													</a></li>
												</c:forEach>
											</ul>
										</div>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
			</div>
		</div>
	</div>
    
    <div class="tom" id="tom">
    <div class="tt">
	<div class="tomm">
	<a href="GetindexList">首页</a>&nbsp;&gt;&nbsp;
    <a class="MZmx5">${map.name}</a>
    </div></div>
    <div id="tom-left">
  	<div class="tom1" id="tom1">
    	<div class="photobox">
        <a id="datupian" class="jqzoom">
        <img src="${map.zm}" width="660" height="660" id="zuocedatu" />
        </a>
        </div>
        <ul id="xiaophotoid" class="xiaophotoclass">
        	<li id="xiaotu-zhengmian" class="current"><a href="javascript:void(0)">
            <img src="${map.zm}" width="110" height="110" id="zhengmian" />
            </a></li>
            <li id="xiaotu-cemian"><a href="javascript:void(0)">
            <img src="${map.cm}" width="110" height="110" id="cemian" />
            </a></li>
            <li id="xiaotu-beimian"><a href="javascript:void(0)">
            <img src="${map.bm}" width="110" height="110" id="beimian" />
            </a></li>
            <li id="xiaotu-shouchi"><a href="javascript:void(0)">
            <img src="${map.t}" width="110" height="110" id="shouchi" />
            </a></li>
        </ul>    
    </div></div>
    <div id="tomright" class="tomright">
    <div id="tomright1" class="tomright1">
    <h1 name="shouji">${map.name}</h1>
    	<p>快充金属旗舰 花呗分期 分期月供低至135元</p>
        <p class="mony-price">¥<span id="mony" class="price">${map.money}</span></p></div>
        <div class="SJcolor">
        <dt class="vm-metatit" name="yanse">颜色分类：</dt>
        	<ul class="clearfix" id="yanse">
                <li data-value="3:18"><a class="vm-sale-img xuanzhong" href="javascript:void(0)">
                <img src="img/huise.png" width="16" height="16" /><span id="huise">${map.color}</span></a></li>
            </ul>
    	</div>
     	<div class="SJshuliang">
  			<dt class="vm-metatit">数量:</dt>
            <dd class="clearfix">
          <div class="SJshuliang1">
            <a class="vm-minus" id="vm-minus" href="javascript:void(0);">-</a>
            <input id="J_quantity" value="1" readonly="readonly" type="text" maxlength="2" onKeyUp="this.value=this.value.replace(/\D/g,'')"
           		 onafterpaset="this.value=this.value.replace(/\D/g,'')" >
            <a class="vm-plus" id="vm-plus"  href="javascript:void(0);">+</a>
          </div></dd>
     	</div>
        <div id="propertyInfo" class="property-info">
        <dt class="mod-total">您已选择以下商品：</dt>
        	<dd class="mod-summary">
            	<span id="shangpinming">${map.name}</span>
                <span id="shoujiY">${map.color}</span>
                <span id="">¥${map.money}</span>
              <p id="J_summaryPackageName"></p>
              <p id="J_sumaryPackageItemNames"></p>
 
              <div class="content"></div></div>
              <span id="J_siteStatus" class="site-status"></span>
      </div>
            <p><span id="J_installmentInfo"></span>本商品由 魅族 负责发货，并由 魅族 提供售后服务</p>
        <dd id="zongji" class="zongji">
        总计:￥<span id="J_totalPrice" class="vm-price">${map.money}</span>
    <div id="lijigoumai" class="lijigoumai">
    	<input id="J_btnBuy" class="btn-lg " type="button" value="立即购买">
    	<input id="btnBuy" class="btn-lg " type="button" value="加入购物车">
    </div>
    </div></div>
    <!--手机详细信息-->
    <section id="detail" class="row detail">    
    <div style="height: 62px;">
	<div id="xinxi" class="xinxi">
</div></div>
    
   <div id="foot">
	<div id="baozhang">
      <table width="1240" border="0">
            <tr>
             <td><p><img src="img/7.png" alt="7天无理由退货"/></p><p><b>7天</b> 无理由退货</p></td>
              <td><p><img src="img/15.png"alt="15天换货保障"/></p><p><b>15天</b> 换货保障</p></td>
              <td><p><img src="img/1.png" alt="1年免费保修"/></p><p><b>1年</b> 免费保修</p></td>
              <td><p><img src="img/speed.png" alt="百城速达"/></p><p><b>百城</b> 速达</p></td>
              <td><p><img src="img/baoyou.png" alt="全场包邮"/></p><p><b>全场</b> 包邮</p></td>
              <td><p><img src="img/map.png" alt="2000多家专卖店"/></p><p><b>2000多家</b> 专卖店</p></td>
            </tr>
      </table>
  
    </div>
    
    <div id="dibuxinxi">
    	<div class="dibuxinxiDiv">
            <ul>
                <li><h2>帮助说明</h2></li>
                <li><a href="#">支付方式</a></li>
                <li><a href="#">配送说明</a></li>
                <li><a href="#">售后服务</a></li>
                <li><a href="#">付款帮助</a></li>
                
            </ul>
        </div>
    	<div class="dibuxinxiDiv">
            <ul>
                <li><h2>Flyme</h2></li>
                <li><a href="#">云服务</a></li>
                <li><a href="#">固件下载</a></li>
                <li><a href="#">软件商店</a></li>
                <li><a href="#">查找手机</a></li>
            </ul>
        </div>
    	<div class="dibuxinxiDiv">
            <ul>
                <li><h2>关于我们</h2></li>
                <li><a href="#">关于魅族</a></li>
                <li><a href="#">加入我们</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">法律声明</a></li>
            </ul>
        </div>
    	<div class="dibuxinxiDiv">
            <ul>
                <li><h2>关注我们</h2></li>
                <li><a href="#">新浪微博</a></li>
                <li><a href="#">腾讯微博</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">官方微信</a></li>
            </ul>
        </div>
    	<div class="dibuxinxiDiv">
            <h4>24小时全国服务热线</h4><a href="tel:400-788-3333"><h3>400-788-3333</h3></a><a id="lanbai" href="#"><h4><img src="img/20x21xiaoshi.png" height="21" width="20">24小时在线客服</h4></a>
        </div>
    </div>
    
    <div id="banquan">
    	&copy 2016 Meizu Telecom Equipment Co., Ltd. All rights reserved. 备案号：粤ICP备13003602号-2 经营许可证编号：粤B2-20130198 营业执照
        <a href="#"><img src="img/footer-copy-1.png"/></a>
        <a href="#"><img src="img/footer-copy-2.png"/></a>
        <a href="#"><img src="img/trust-icon.png"/></a>
    </div>
</div>
</body>
</html>
<script language="javascript">
$(function(){
	var pric=parseFloat($("#mony").html());
	var num=parseFloat($("#J_quantity").val());
	$("#J_quantity").val(num);
	$("#J_totalPrice").html(pric*num);
	$("#J_total").html(pric*num);
});


	
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
	$("#zuocedatu").attr("src","${map.zm}");
	$(".jqzoom").attr("href","${map.zm}");
})
$("#xiaotu-cemian").click(function(){
	$("#xiaotu-cemian img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-beimian img").css("border","none");
	$("#xiaotu-shouchi img").css("border","none");
	$("#zuocedatu").attr("src","${map.cm}");
	$(".jqzoom").attr("href","${map.cm}");
})
$("#xiaotu-beimian").click(function(){
	$("#xiaotu-beimian img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-cemian img").css("border","none");
	$("#xiaotu-shouchi img").css("border","none");
	$("#zuocedatu").attr("src","${map.bm}");
	$(".jqzoom").attr("href","${map.bm}");
})
$("#xiaotu-shouchi").click(function(){
	$("#xiaotu-shouchi img").css("border","1px solid #ff8066");
	$("#xiaotu-zhengmian img").css("border","none");
	$("#xiaotu-cemian img").css("border","none");
	$("#xiaotu-beimian img").css("border","none");
	$("#zuocedatu").attr("src","${map.t}");
	$(".jqzoom").attr("href","${map.t}");
})
</script>
<script language="javascript">
	
	
	//手机信息页面上浮
	$(window).scroll(
		function(){
			if($(this).scrollTop()>1000){
				$("#xinxi").css("position","fixed");
				$("#xinxi").css("top","-5px");
				}else{
				$("#xinxi").css("position","absolute");
				$("#xinxi").css("top","1000px");
				}
			}
	)
	//上浮后右边的价钱跟购买
	$(window).scroll(
		function(){
			if($(this).scrollTop()>1000){
				$(".shortcut").css("position","absolute");
				$(".shortcut").css("top","7px");
				}else{
				$(".shortcut").css("position","none");
				$(".shortcut").css("top","1000px");
				}
			}
	)

	//数量的加减和总价的变换
	$("#vm-minus").click(function(){
		var pric=parseFloat($("#mony").html());
		var num=parseFloat($("#J_quantity").val());
		if(num>1){
			num--;
			}
		$("#J_quantity").val(num);
		$("#J_totalPrice").html(pric*num);
		$("#J_total").html(pric*num);
		}
	)
	$("#J_quantity").keyup(function(){
		var pric=parseFloat($("#mony").html());
		var num=parseFloat($("#J_quantity").val());
		$("#J_quantity").val(num);
		$("#J_totalPrice").html(pric*num);
		$("#J_total").html(pric*num);
		})
	$("#vm-plus").click(function(){
		var pric=parseFloat($("#mony").html());
		var num=parseFloat($("#J_quantity").val());
		if(num>=1){
			num++;
			}
		$("#J_quantity").val(num);
		$("#J_totalPrice").html(pric*num);
		$("#J_total").html(pric*num);
		}
	)
	
	
	//手机型号选择效果
	$("#wangluo li a").click(function(){
		$("#wangluo li a").removeClass("xuanzhong");
		$(this).addClass("xuanzhong");
		$("#shoujiB").html($(this).children("span").html());
		})
	$("#yanse li a").click(function(){
		$("#yanse li a").removeClass("xuanzhong");
		$(this).addClass("xuanzhong");
		$("#shoujiY").html($(this).children("span").html());
		})
		
	//手机信息页面字体的颜色
	$("#clearfix li a").click(function(){
		$("#clearfix li a").removeClass("lanse");
		$(this).addClass("lanse");
		})
		

	/*手机信息页面切换*/
	$("#shangpin,#guige,#wenti").click(function(){ 
	if($(this).attr("id")=='shangpin'){
		$("#shangpinDiv").css("display","block");
		$("#guigeDiv").css("display","none");
		$("#wentiDiv").css("display","none");
	}else if($(this).attr("id")=='guige'){
		$("#shangpinDiv").css("display","none");
		$("#guigeDiv").css("display","block");
		$("#wentiDiv").css("display","none");
	}else if($(this).attr("id")=='wenti'){
		$("#shangpinDiv").css("display","none");
		$("#guigeDiv").css("display","none");
		$("#wentiDiv").css("display","block");
	}
	
})
$("#J_btnBuy").click(function(){
		var num=$("#J_quantity").val()
		var no=${map.id};
		location.href = "addOrdersByMode?no="+no+"&num="+num;
	})
	$("#btnBuy").click(function(){
		var num=$("#J_quantity").val()
		var no=${map.id};
		if(${empty user})
		{
			alert("请登录");
		}else{
		$.ajax({
  					url:'AddShoppingCartByModel',
  					method:'post',
  					data:{
  						no:no,
  						num:num  						
  					},
  					dataType:'Text',
  					success:function(data){
  						if(data=="true")
  							alert("添加成功");
  						else
  							alert("请登录！")
  					},
  					error:function(xhr,msg){
  						alert("添加失败");
  					}
  				});
  			}
	})
	$("#J_btnBuyShortcut").click(function(){
		var num=$("#J_quantity").val()
		var no=${map.id};
		location.href = "addOrdersByMode?no="+no+"&num="+num;
	})
</script>
