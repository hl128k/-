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


<script src="js/addressManage.js" language="javascript"></script>
<link rel="stylesheet" type="text/css" href="css/addressManage.css" />
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
        <a href="GetAddManage" class="active">地址管理</a>
    </div>
    <div id="left-nav">
    	<div id="nav-main"> 
            <h4 class="nav-first">订单中心</h4> 
            <a href="GetMyOrder" >我的订单</a> <br><h4 class="nav-title">个人中心</h4> 
            <a href="GetAddManage" class="active">地址管理</a> 
        </div>
    </div>
	<div id="right-content">
    	<div id="content-mian">
        	<div id="content-nav">
            	<a id="qbdd" class="active" href="javascript:javascript:void(0)">我的收货地址</a>
            </div>
        </div>
        <div id="content-order">
        	<div id="orderItem">
            	 <div id="shouhuoxinxi">
    	<div><h3>收货人信息</h3></div>
        <div class="xian">
        </div>
        <div id="yonghudizhi">
        	<!--用户地址列表-->
        	<c:choose>
				<c:when test="${empty addressesList}">
				</c:when>
				<c:otherwise>
					<c:forEach items="${addressesList }" var="address">
							<div class="addUser">
								<input type="hidden" class="no" value="${address.id}">
								<div class="userTop">
									<span class="userName">${address.Name}</span> <span class="userPhone">${address.Phone}</span>
								</div>
								<div class="userBottom">${address.address}</div>
								<span class="xuanzhong">√</span>
								<div class="userControl">
									<span class="del">删除</span>
								</div>
							</div>
						</c:forEach>
				</c:otherwise>
			</c:choose>
        </div>
        
        <div id="tianjiadizhiTit">
          <div id="tubiao">+</div>
          <div>添加新地址</div>
        </div>
			<div id="tianjiadizhi">
				<div id="tianjiadizhiBox">
					<div id="tijiashouhuoxinxi">
						<table width="100%" border="0">
							<tr>
								<th width="120">收件人</th>
								<td><input class="" id="addName" maxlength="12" placeholder="长度不超过12个字" type="text"><span>必填请认真输入</span></td>
							</tr>
							<tr>
								<th>手机</th>
								<td><input class="" id="addTel" maxlength="11" placeholder="请输入11位手机号" type="text"><span>必填请认真输入</span></td>
							</tr>
							<tr>
								<th>地址</th>
								<td>省：<select id="province">
										<option value="-1">-----请选择-----</option>
										<c:forEach items="${provinceList }" var="province">
											<option value="${province.CodeId}">${province.Name }</option>
										</c:forEach>
								</select> 市：<select id="city">
										<option value="-1" selected='selected'>-----请选择-----</option>
								</select> 区/街：<select id="street">
										<option value="-1" selected='selected'>-----请选择-----</option>
								</select><br /> <input class="" id="addAdd" maxlength="50" placeholder="请输入详细地址" type="text"><span>请选择省市以及写明详细信息</span>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div id="shdzbaocun">保存并使用</div>
									<div id="shdzquxiao">取消</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
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
