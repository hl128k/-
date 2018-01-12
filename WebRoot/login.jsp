<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/register.css" rel="Stylesheet" type="text/css">
<script src="js/jquery-1.9.1.js" language="javascript"></script>
<script src="js/jquery.cookie.js" language="javascript"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="content" id="content">
    <div id="zc">
    	<a class="linkAGray" id="denglu" href="login.jsp">登录</a>
    	<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
        <a class="linkAGray" id="zhuce" href="register.jsp">注册</a>     
    </div>
    <form id="mainForm" novalidate action="loginServlet">
    <div class="normalInput">
    	<input name="phone" id="zhanghuming" type="text" maxlength="11" autocomplete="off" placeholder="手机号/ Flyme 账户名"
        onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')" onafterpaset="this.value=this.value.replace(/\D/g,'')" 
        value=""  >
        <span id="shoujiyanzheng" style="color:#FF6699;"></span>
	</div>
	<div class="normalInput">
		<input name="password" id="password" type="password" autocomplete="off" placeholder="密码" maxlength="16" value="" >
        <span id="shoujibtn" style="color:#FF6699;"></span> 
        <a class="pwdBtnShow noselect" id="pwdBtn" onselectstart="return false"><i class="i_icon"></i></a>
	<div class="clear">
    </div></div>
    
    <div class="rememberField" id="rememberField">
    <span><input name="remember" id="remember" type="checkbox" value="1"></span>
    	<label tabindex="0" for="remember">记住登录状态</label>
        <a class="linkABlue" id="/forgetpwd" href="#">忘记密码?</a>
    </div>
    <a class="fullBtnBlue" id="dengluanniu" >登录</a>
	<div class="transferField">
    	<a name="btnArea" class="linkAGray" id="transfer" href="javascript:void(0);">社区账户转换为 Flyme 账户</a>
	</div></form></div>
	<div class="footerWrap" id="flymeFooter">
    <div class="footerInner">
    <div class="footer-layer1">
    <div class="footer-innerLink">
    		<a title="关于魅族" href="#">关于魅族</a><img class="foot-line" >
			<a title="工作机会" href="#">工作机会</a><img class="foot-line" >
            <a title="联系我们" href="#">联系我们</a><img class="foot-line" >
            <a title="法律声明" href="#">法律声明</a><img class="foot-line" >
			<a title="简体中文" class="footer-language" id="globalName" href="#">简体中文&nbsp;&nbsp;&nbsp;</a>
	</div>
	<div class="footer-service">
    	<span class="kefu-label">客服热线</span>
       	<span class="kefu-num">400-788-3333</span> 
		<a title="在线客服" class="service-online" id="service-online" href="javascript:void(0);">在线客服</a></div></div>
    <div class="clear"></div>
    <div class="copyrightWrap" id="flymeCopyright">
    <div class="copyrightInner">
    	<span>©2016 Meizu Telecom Equipment Co., Ltd. All rights reserved.</span>
        <a class="linkAGray" href="#" target="_blank">备案号: 粤ICP备13003602号-4</a>
        <a class="linkAGray" href="#" target="_blank">经营许可证编号: 粤B2-20130198</a>
        <a class="linkAGray" hidefocus="true" href="#" target="_blank">营业执照</a>
			 </div></div></div>
</div>
	
  </body>
  <script type="text/javascript">
  		$(function(){
  			$("#dengluanniu").click(function(){
  				$.ajax({
  					url:'loginServlet',
  					method:'post',
  					data:{
  						username:$("#zhanghuming").val(),
  						userpwd:$("#password").val()  						
  					},
  					dataType:'json',
  					success:function(data){
  						if(data.name){
  							window.location.href="GetindexList";
  						}else{
  							alert("用户名密码错误");
  						}
  					},
  					error:function(xhr,msg){
  						alert("服务器出错了！");
  					}
  				});
  			});
  		});	
	</script>
</html>
<script language="javascript">

	$("#zhanghuming").blur(function yanzheng(){ 
	   $("#shoujiyanzheng").html("");
	   return true; 
	});
	$("#password").blur(function btnyanzheng(){ 
	if($("#password").val().length<6){ 
		$("#shoujibtn").html("密码最少输入6位！请重新输入！");  
		return false; 
	   }else{
	   $("#shoujibtn").html("");
	   return true;
	   }
	});
</script>