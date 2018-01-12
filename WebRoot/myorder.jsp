<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员中心-我的订单 魅族商城</title>
<link rel="stylesheet" type="text/css" href="css/touwei.css" />
<script src="js/jquery-1.9.1.js" language="javascript"></script>
<script src="js/touwei.js" language="javascript"></script>
<script src="js/jquery.cookie.js" language="javascript"></script>


<script src="js/myorder.js" language="javascript"></script>
<link rel="stylesheet" type="text/css" href="css/myorder.css" />
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
    <div id="nav">
        <a href="GetindexList">首页&gt;</a>
        <a href="GetindexList">我的商城&gt;</a>
        <a href="GetMyOrder" class="active">我的订单</a>
    </div>
    <div id="left-nav">
    	<div id="nav-main">
            <h4 class="nav-first" class="active">订单中心</h4>
            <a href="GetMyOrder" >我的订单</a> <br><h4 class="nav-title">个人中心</h4> 
            <a href="GetAddManage" >地址管理</a> 
        </div>
    </div>
	<div id="right-content">
    	<div id="content-mian">
        	<div id="content-nav">
            	<a id="qbdd" class="active" href="javascript:javascript:void(0)">全部订单</a>
            	
            </div>
        </div>
        <div id="content-head">
        	<ul>
                <li class="w50">订单明细</li>
                <li class="w166">商品物流</li>
                <li class="w166">实付金额</li>
                <li class="w166">状态</li>
            </ul>
        </div>
        <div id="content-order">
        	<div id="orderItem">
            	<div id="qbddDiv" class="active">
            		<c:choose>
            			<c:when test="${empty oidlist }"><h2>暂时没有订单<a href=basePath>去商城挑选</a></h2></c:when>
            			<c:otherwise>
            				<c:forEach items="${oidlist }" var="oid">
            					<ul class="orderbox">
			                        <li class="w50 w50br">
			                        <div>
			                        	<c:forEach items="${ordmap[oid.id] }" var="ord">
			                        		<p><a href="ModelServlet?id=${ord.id }"><b>${ord.name}${ord.color}&nbsp;&nbsp;￥${ord.mmoney}&nbsp;&nbsp;x&nbsp;&nbsp;${ord.num}&nbsp;&nbsp;共${ord.omoney}</b></a></p>
			                        	</c:forEach>
			                        </div>
			                        </li>
			                        <li class="w166 br">待发货</li>
			                        <li class="w166 br"><b>￥${ordsum[oid.id] }</b></li>
			                        <li class="w166 br">${oid.status }<c:if test="${oid.Sid==2 }"><a href="payOrders?oid=${oid.id }">去付款</a></c:if></li>
			                    </ul>
            				</c:forEach>
            				
            			</c:otherwise>
            		</c:choose>
                </div>
            </div>
            
        </div>
    </div>
</div>
<div id="foot">
	<div id="baozhang">
      <table width="1240" border="0">
            <tr>
             <td><p><img src="img/7.png" alt="7天无理由退货"/></p><p><b>7天</b> 无理由退货</p></td>
              <td><p><img src="img/15.png" alt="15天换货保障"/></p><p><b>15天</b> 换货保障</p></td>
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
    	&copy 2016 Meizu Telecom Equipment Co., Ltd. All rights reserved. 备案号：粤ICP备13003602号-2 经营许可证编号：粤B2-20130198 营业执照<a href="#"><img src="img/footer-copy-1.png"/></a><a href="#"><img src="img/footer-copy-2.png"/></a><a href="#"><img src="img/trust-icon.png"/></a>
    </div>
</div>
</body>
</html>
