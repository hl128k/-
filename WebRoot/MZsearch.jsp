<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>魅族商城-提供魅族PRO系列、魅族MX系列和魅蓝系列产品的预约和购买</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/search.css" />
<script src="js/jquery-1.9.1.js" language="javascript"></script>
 	<script type="text/javascript">
	$(function() {
		$("#searchText").keyup(
				function() {
					$.ajax({
						url : 'Getsearch',
						type : 'post',
						data :{ key:$("#searchText").val()},
						dataType : 'html',
						success : function(data) {
							if(data!==""){
							$("#searchTextBox").html(data);
							$("#searchTextBox").css("display","block");
							}else{
							$("#searchTextBox").css("display","none");
							}
						},
						error : function(xhr, msg) {
							alert(msg);
						}
					});
				});
				$("#searchTextBox").on("click", ".searchTextBox", function() {
					$("#searchText").val($(this).html())
					$("#searchTextBox").css("display","none");
				});
				$("a").each(function() {
			var href=$(this).attr("href");
			href=encodeURI(href);
			href=encodeURI(href);
			$(this).attr("href",href);
			})
	});
	
 	</script>
<script src="js/index.js" language="javascript"></script>

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
	<form action="GetsearchList" method="post">
		<div id="search">
		
			<input type="text" id="searchText" name="searchText" value="${key}"><input type="submit" id="searchBtn" value="搜索" onclick="">
			<div id="searchTextBox"></div>
		
		</div>
	</form>
		<div id="searchBox">
		<c:choose>
			<c:when test="${empty searchLsit}">
				没有商品
			</c:when>
			<c:otherwise>
				<c:forEach items="${searchLsit }" var="map" varStatus="i">
					<div class="tuijianBox">
					<a href="ModelServlet?id=${map.id }">
						<p>
							<img src="img/${map.cover }" alt="${map.name }" />
						</p>
						<p>${map.name }</p>
						<p>
							<font>${map.CommonProblems }</font>
						</p>
						<p>
							<span>¥ ${map.money } </span>
						</p>
					</a>
					</div>
				<c:if test="${i.count%5==0&&i.count>1 }"><div class="xian"></div></c:if>
				</c:forEach>
				<div class="xian"></div>
				<div align="center" id="pege">
					<a href="GetsearchList?searchText=${key}&index=1">首页</a> <a
						href="GetsearchList?searchText=${key}&index=${index-1 }">上一页</a> <a
						href="GetsearchList?searchText=${key}&index=${index+1 }">下一页</a> <a
						href="GetsearchList?searchText=${key}&index=${totalPages}">末页</a>
				</div>
			</c:otherwise>
		</c:choose>
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
</html>