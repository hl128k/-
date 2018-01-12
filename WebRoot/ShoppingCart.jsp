<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css" >
td{
 text-align:center;
}
</style>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShoppingCarl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/touwei.css" />
	<script src="js/jquery-1.9.1.js" language="javascript"></script>
	<script src="js/touwei.js" language="javascript"></script>
  </head>
  
  <body>
  
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

	<div id="mian">
	<form action="addOrdersBySC" >
   <table class="sp" width="100%">
   	<tr>
   		<th width="5%"><input type="checkbox" class="all"> </th>
   		<th width="35%">商品名</th>
   		<th width="20%">数量</th>
   		<th width="10%">价格</th>
   		<th width="20%">小计</th>
   		<th width="10%">操作</th>
   		
   	</tr>
   		<c:choose>
   		<c:when test="${empty ScartList}">
   			<tr>
   				<th colspan="5">您好，您的购物车暂无商品，请前往商城选购</th>
   			</tr>
   		</c:when>
   		<c:otherwise>
   		<c:forEach items="${ScartList}" var="sc">
   			<tr>
   				<td><input type="checkbox" class="no" name="no" value="${sc.id}"></td>
   				<td><a href="ModelServlet?id=${sc.Cid}"><img src="img/${sc.cover}" alt="${sc.name} " width="126" height="126">${sc.name}</a></td>
   				<td><input class="jian" type="button" value="-"><span class="num">${sc.num}</span>
   					<input type="button" value="+" class="jia">
   				</td>
   				<td class="money">${sc.money}</td>
   				<td ><span class="subtotal">${sc.num*sc.money}</span></td>
   				<td><input type="button" value="删除" class="del"></td>
   			</tr>
   		</c:forEach>
   			<tr><td colspan="2">总合计</td>
   			<td colspan="3"><input type="text" id="combined" readonly="readonly" value="0" style="width:350px"></td>
   			<td ><input type="button" id="submit" value="购买"></td>
   			
   			</tr>
   			
   		</c:otherwise>
   		</c:choose>
   </table>
   </form>
   </div>
   <div id="foot">
		<div id="baozhang">
			<table width="1240" border="0">
				<tr>
					<td>
						<p>
							<img src="img/7.png" alt="7天无理由退货" />
						</p>
						<p>
							<b>7天</b> 无理由退货
						</p>
					</td>
					<td>
						<p>
							<img src="img/15.png" alt="15天换货保障" />
						</p>
						<p>
							<b>15天</b> 换货保障
						</p>
					</td>
					<td>
						<p>
							<img src="img/1.png" alt="1年免费保修" />
						</p>
						<p>
							<b>1年</b> 免费保修
						</p>
					</td>
					<td>
						<p>
							<img src="img/speed.png" alt="百城速达" />
						</p>
						<p>
							<b>百城</b> 速达
						</p>
					</td>
					<td>
						<p>
							<img src="img/baoyou.png" alt="全场包邮" />
						</p>
						<p>
							<b>全场</b> 包邮
						</p>
					</td>
					<td>
						<p>
							<img src="img/map.png" alt="2000多家专卖店" />
						</p>
						<p>
							<b>2000多家</b> 专卖店
						</p>
					</td>
				</tr>
			</table>

		</div>

		<div id="dibuxinxi">
			<div class="dibuxinxiDiv">
				<ul>
					<li>
						<h2>帮助说明</h2>
					</li>
					<li><a href="#">支付方式</a></li>
					<li><a href="#">配送说明</a></li>
					<li><a href="#">售后服务</a></li>
					<li><a href="#">付款帮助</a></li>

				</ul>
			</div>
			<div class="dibuxinxiDiv">
				<ul>
					<li>
						<h2>Flyme</h2>
					</li>
					<li><a href="#">云服务</a></li>
					<li><a href="#">固件下载</a></li>
					<li><a href="#">软件商店</a></li>
					<li><a href="#">查找手机</a></li>

				</ul>
			</div>
			<div class="dibuxinxiDiv">
				<ul>
					<li>
						<h2>关于我们</h2>
					</li>
					<li><a href="#">关于魅族</a></li>
					<li><a href="#">加入我们</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="#">法律声明</a></li>

				</ul>
			</div>
			<div class="dibuxinxiDiv">
				<ul>
					<li>
						<h2>关注我们</h2>
					</li>
					<li><a href="#">新浪微博</a></li>
					<li><a href="#">腾讯微博</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="#">官方微信</a></li>

				</ul>
			</div>
			<div class="dibuxinxiDiv">
				<h4>24小时全国服务热线</h4>
				<a href="tel:400-788-3333">
					<h3>400-788-3333</h3>
				</a> <a id="lanbai" href="#">
					<h4>
						<img src="img/20x21xiaoshi.png" height="21" width="20">24小时在线客服
					</h4>
				</a>
			</div>
		</div>

		<div id="banquan">
			&copy 2016 Meizu Telecom Equipment Co., Ltd. All rights reserved. 备案号：粤ICP备13003602号-2
			经营许可证编号：粤B2-20130198 营业执照 <a href="#"> <img src="img/footer-copy-1.png" />
			</a> <a href="#"> <img src="img/footer-copy-2.png" />
			</a> <a href="#"> <img src="img/trust-icon.png" />
			</a>
		</div>
	</div>
   
  </body>
<script type="text/javascript">
	$(".sp").on(
			"click",
			".jia",
			function() {

				var thisHtml = $(this);
				if(thisHtml.parent().parent().find(".no").get(0).checked){
					var sun=parseInt($("#combined").val());
					sun-=parseInt(thisHtml.parent().parent().find(".subtotal").html());
					$("#combined").val(sun);
				}
				$.ajax({

					url : 'addShoppingCart',
					method:'post',
					data : {
						no : $(this).parent().parent().find(".no").val(),
						num : $(this).parent().find(".num").html()

					},

					dataType : 'html',

					success : function(data) {

						thisHtml.parent().find(".num").html(data)
						var num = data;
						var money = thisHtml.parent().parent().find(".money")
								.html();
						thisHtml.parent().parent().find(".subtotal").html(
								(num * money).toFixed(2));
						if(thisHtml.parent().parent().find(".no").get(0).checked){
							var sun=parseInt($("#combined").val());
							sun+=parseInt(thisHtml.parent().parent().find(".subtotal").html());
							$("#combined").val(sun);
						}
					},

					error : function(xhr, msg) {

						alert("服务器出错了！请稍后重试！");

					}

				});

			});
			
	$(".sp").on(
			"click",
			".jian",
			function() {

				var thisHtml = $(this);
				if(thisHtml.parent().parent().find(".no").get(0).checked){
					var sun=parseInt($("#combined").val());
					sun-=parseInt(thisHtml.parent().parent().find(".subtotal").html());
					$("#combined").val(sun);
				}
				$.ajax({

					url : 'subShoppingCart',
					method:'post',
					data : {
						no : $(this).parent().parent().find(".no").val(),
						num : $(this).parent().find(".num").html()

					},

					dataType : 'html',

					success : function(data) {
						thisHtml.parent().find(".num").html(data)
						var num = data;
						var money = thisHtml.parent().parent().find(".money")
								.html();
						thisHtml.parent().parent().find(".subtotal").html(
								(num * money).toFixed(2));
						if(thisHtml.parent().parent().find(".no").get(0).checked){
							var sun=parseInt($("#combined").val());
							sun+=parseInt(thisHtml.parent().parent().find(".subtotal").html());
							$("#combined").val(sun);
						}
					},

					error : function(xhr, msg) {

						alert("服务器出错了！请稍后重试！");

					}

				});
			});
			
	$(".sp").on("click", ".del", function() {

		var thisHtml = $(this);

		$.ajax({

			url : 'delShoppingCart',
			method:'post',
			data : {

				no : $(this).parent().parent().find(".no").val()

			},

			dataType : 'html',

			success : function(data) {
				if(thisHtml.parent().parent().find(".no").get(0).checked){
					var sun=parseInt($("#combined").val());
					sun-=parseInt(thisHtml.parent().parent().find(".subtotal").html());
					$("#combined").val(sun);
				}
				thisHtml.parent().parent().remove();

			},

			error : function(xhr, msg) {

				alert("服务器出错了！请稍后重试！");

			}

		});

	});
	
	$(".sp").on("change", ".all", function() {
		$(".no").each(function() {
			var thisHtml = $(this);
			$(this).get(0).checked = $('.all').get(0).checked;
			if($('.all').get(0).checked){
				var sun=parseInt($("#combined").val());
				sun+=parseInt(thisHtml.parent().parent().find(".subtotal").html());
				$("#combined").val(sun);
			}else{
				var sun=parseInt($("#combined").val());
				sun-=parseInt(thisHtml.parent().parent().find(".subtotal").html());
				$("#combined").val(sun);
			}
			
		})
	});
	
	$(".sp").on("change", ".no", function() {
		var dianji = 0;
		$(".no").each(function() {
		var thisHtml = $(this);
			if ($(this).get(0).checked) {
				dianji++;
				var sun=parseInt($("#combined").val());
				sun+=parseInt(thisHtml.parent().parent().find(".subtotal").html());
				$("#combined").val(sun);
				if (dianji === $(".no").length) {
					$('.all').get(0).checked = $(this).get(0).checked;
				} else {
					$('.all').get(0).checked = false;
				}
			} else {
				$('.all').get(0).checked = false;
				var sun=parseInt($("#combined").val());
				sun-=parseInt(thisHtml.parent().parent().find(".subtotal").html());
				$("#combined").val(sun);
			}
		});
		
	});
	
	$(".sp").on("click", "#submit", function() {
		var sc=0;
		$(".no").each(function(){
			if($(this).get(0).checked){
				sc+=1;
			}
		})
		if(sc<1){
			alert("请选择一个商品！");
		}else{
			$(this).prop("type","submit")
		}
		

		});
</script>
</html>
