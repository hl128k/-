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
    
    <title>支付结算-魅族商城</title>
<link rel="stylesheet" type="text/css" href="css/touwei.css" />
<script src="js/jquery-1.9.1.js" language="javascript"></script>
<script src="js/touwei.js" language="javascript"></script>

<script src="js/jquery.cookie.js" language="javascript"></script>
<script src="js/payment.js" language="javascript"></script>
<link rel="stylesheet" type="text/css" href="css/payment.css" />
</head>

<body>
<div id="querenzhifu">
    <div id="qrTop">支付提示</div>
    <div id="qrMian">支付完成前请不要关闭该窗口。</div>
    <div id="qrBottom">
        <div id="zhifuchengong">支付完成</div>
        <div id="zhifushibai">支付失败</div>
    </div>
</div>
<div id="overlay"></div>
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
	<div id="paymentHeader">
        <div id="dingdanxinxi">
            <div id="dingdanTop">
                <h2>订单号<b id="no">${oid }</b>,提交成功，应付金额 <span id="jine">${sum[0].sum }</span> 元</h2>
                <p id="tips">该宝贝为付款减库存,拍下并不代表购买成功哦。请您尽快付款，付款后我们将会尽快安排发货。</p>
            </div>
        </div>
    </div>
    <div id="paymentMian">
    	<ul id="zhifuTop">
            <li id="zaixianzhifu" class="xuanzhong">在线支付</li>
            <li id="saomazhifu" class="">扫一扫</li>
		</ul>
        <ul id="zhifuMian">
        	<li id="zaixianzhifuBox" class="xuanzhong">
            	<div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="zfb"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="zgyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="jsyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="nyyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="gsyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="jtyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="zsyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="yzyh"></div></label></div>
                <div class="xuanxiangBox"><label><input type="radio" name="yinhang" /><div class="tupian" id="xyyh"></div></label></div>
                <a class="lijizhifu" href="javascript:void(0)">立即支付</a>
            </li>
            <li id="saomazhifuBox" class="">
            	<img src="img/erweima.png" height="266px"/>
                <a class="lijizhifu" href="javascript:void(0)">扫码完成</a>
            </li>
        </ul>
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