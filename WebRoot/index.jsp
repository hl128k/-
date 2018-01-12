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
<script src="js/jquery-1.9.1.js" language="javascript"></script>
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

		<div id="fenleidaogang">
        <div id="shengpinfenlei">
            <ul>
                <li id="spfl1">
                    <a href="GetsearchList">全部商品</a></li>
					<c:choose>
						<c:when test="${empty typeList}">
							系统错误
						</c:when>
						<c:otherwise>
							<c:forEach items="${typeList }" var="tidmap">
								<li id="spfl${tidmap.id+1 }">
									<a href="GetsearchList?searchText=${tidmap.type}">${tidmap.type}</a>
									<div id="spfl${tidmap.id+1 }Div">
										<div class="liebiao">
										<ul>
										<c:forEach items="${typemap[tidmap.type] }" var="map" varStatus="i">
											<c:choose>
													<c:when test="${(i.count-1)%5==0&&i.count!=1}">
													</ul>
													<ul>
													<li><a href="ModelServlet?id=${map.id }"> <img width="50px" height="50px" src="img/${map.cover }" alt="${map.name }" />${map.name }</a></li>
													</c:when>
													<c:when test="${fn:length(typemap[tidmap.type])==i.count}"><li><a href="ModelServlet?id=${map.id }"> <img width="50px" height="50px"src="img/${map.cover }" alt="${map.name }" />${map.name }</a></li>
													</ul></c:when>
													<c:when test="${(i.count-1)%5==0&&fn:length(typemap[tidmap.type])==i.count}">
													</ul>
													<ul>
													<li><a href="ModelServlet?id=${map.id }"> <img width="50px" height="50px" src="img/${map.cover }" alt="${map.name }" />${map.name }</a></li>
													</ul>
													</c:when>
													<c:otherwise>
														<li><a href="ModelServlet?id=${map.id }"> <img width="50px" height="50px" src="img/${map.cover }" alt="${map.name }" />${map.name }</a></li>
													</c:otherwise>
											</c:choose>
										</c:forEach>
										<div class="adv">
														<a href="ModelServlet?id=${tidmap.CId }"> <img src="img/${tidmap.photo }" alt="${tidmap.name }" />
														</a>
													</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</ul>
        </div> 
    </div>

	<div id="gdgg">
		<div class="prev">
			<a href="javascript:void(0)">&lt;</a>
		</div>
		<div id="gdggKJ">
			<div id="gdggTp">
				<ul>
					<c:forEach items="${scrolAdvList }" var="sA" varStatus="i">
						<c:choose>
							<c:when test="${i.count==1 }">
								<li id="v${i.count }Ad" class="showAD"><a href="ModelServlet?id=${sA.CId }"> <img
									src="img/${sA.photo }" alt="${sA.name }"  />
								</a></li>
							</c:when>
							<c:otherwise>
								<li id="v${i.count }Ad"><a href="ModelServlet?id=${sA.CId }"> <img
									src="img/${sA.photo }" alt="${sA.name }"  />
								</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="next">
			<a href="javascript:void(0)">&gt;</a>
		</div>

		<ul id="yindao">
			<li id="v1" value="1" class="xuanzhong">&nbsp;</li>
			<li id="v2" value="2">&nbsp;</li>
			<li id="v3" value="3">&nbsp;</li>
			<li id="v4" value="4">&nbsp;</li>
			<li id="v5" value="5">&nbsp;</li>
			<li id="v6" value="6">&nbsp;</li>
		</ul>
	</div>

	<div id="huodongtuixiao">
		<div id="fuwu" class="txDiv">

			<div>
				<a href="#">
					<p>
						<img src="img/1450855246-61162.png" alt="M码通道" />
					</p>
					<p>M码通道</p>
				</a>
			</div>
			<div>
				<a href="#">
					<p>
						<img src="img/1450855279-64872.png" alt="以旧换新" />
					</p>
					<p>以旧换新</p>
				</a>
			</div>
			<div>
				<a href="#">
					<p>
						<img src="img/1450855198-58056.png" alt="补买意外保" />
					</p>
					<p>补买意外保</p>
				</a>
			</div>
			<div>
				<a href="#">
					<p>
						<img src="img/1451960447-93534.png" alt="回购单查询" />
					</p>
					<p>回购单查询</p>
				</a>
			</div>
		</div>
		<div class="txDiv">
			<a href="#"> <img src="img/1451551376-27592.jpg" alt="周一品牌日">
			</a>
		</div>
		<div class="txDiv">
			<a href="#"> <img src="img/1462326173-77183.jpg" alt="">
			</a>
		</div>
		<div class="txDiv">
			<a href="#"> <img src="img/1452236116-63524.jpg" alt="">
			</a>
		</div>
		<div class="txDiv">
			<a href="#"> <img src="img/1462532151-94412.jpg" alt="">
			</a>
		</div>
	</div>

	<div id="lunboguangao">

		<div id="lbggLogo">
			<h2>热品推荐</h2>
			<div id="lbggAnniu">
				<span id="leftBtn">&nbsp;&lt;&nbsp;</span> <span id="rightBtn">&nbsp;&gt;&nbsp;</span>
			</div>
		</div>

		<div id="lbggOut">
			<div id="lbggIn">
				<c:forEach items="${TopList }" var="top">
					<div>
					<a href="ModelServlet?id=${top.id}">
						<p>
							<img src="img/${top.cover}" alt="${top.name}" />
						</p>
						<p>${top.name}</p>
						<p>
							<font>${top.CommonProblems}</font>
						</p>
						<p>
							<span>¥ ${top.money} </span>
						</p>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<c:forEach items="${tciList }" var="tci">
		<div class="ADdiv">
		<a href="ModelServlet?id=${tci.aid }"> <img src="img/${tci.aphoto }" alt="" />
		</a>
		</div>
		<div class="tuijian">
		<div class="tuijianbiaoti">
			<div class="wenzi">
				<div>
					<h2>${tci.name }</h2>
				</div>
				&nbsp;
			</div>
			<div class="gengduo">
				更多<span class="gengduofuhao"></span>
			</div>
		</div>
		<div class="tuijianqu">
			<div class="tuijian1Box">
				<a href="ModelServlet?id=${tci.rid }"> <img src="img/${tci.rphoto }" alt="" />
				</a>
			</div>
			<c:forEach items="${tcimap[tci.name] }" var="map" varStatus="i">
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
			<c:if test="${i.count==4 }"><div class="xian"></div></c:if>
			</c:forEach>
	</div>
	</c:forEach>


	<div id="ReTop">
		<a href="javascript:void(0)">△</a>
	</div>



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
<script type="text/javascript">
$("a").each(function() {
			var href=$(this).attr("href");
			href=encodeURI(href);
			href=encodeURI(href);
			$(this).attr("href",href);
			})

</script>
</body>
</html>