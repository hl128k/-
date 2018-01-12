<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/register.css" rel="Stylesheet" type="text/css">
<script src="js/jquery-1.9.1.js" language="javascript"></script>
<script src="js/jquery.cookie.js" language="javascript"></script>
<script src="js/register.js" language="javascript"></script> 
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
    
    
  <form id="mainForm" novalidate>
    <div class="number">
    	<a class="zhanghuming" id="zhanghuming" href="javascript:void(0);">魅族用户注册</a>
    </div>
    <div class="normalInput">
    	<input name="name" id="name" type="text" placeholder="用户名"
    	onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')" onafterpaset="this.value=this.value.replace(/\D/g,'')" 
    	maxlength="11" onblur="yonghuming()" >
      <span id="yonghuyanzheng" style="color:#FF6699;"></span>
	</div>
    <div class="normalInput">
    	<input name="phone" id="phone" type="text" placeholder="手机号码" value=""
    	 onKeyUp="this.value=this.value.replace(/\D/g,'')" maxlength="11" onblur="yanzheng()" >
      <span id="shoujiyanzheng" style="color:#FF6699;"></span>
	</div>
    <div class="normalInput">
    	<input type="text" id="kapkey" placeholder="验证码" readonly onblur="huoqu()" >
        <a class="linkABlue" id="getKey" href="javascript:void(0)" onblur="huoqu()">获取验证码</a>
        <span class="yanzhengma" id="yanzhengma" style="color:#FF6699;"></span>
    </div>
    <div class="normalInput">
    	<input name="password" id="password" type="password" autocomplete="off" placeholder="密码" maxlength="16" value=""onblur="btnyanzheng()" >
        <span id="shoujibtn" style="color:#FF6699;"></span>
      <a class="pwdBtnShow noselect" id="pwdBtn" onselectstart="return false"><i class="i_icon"></i></a>				 
    <div class="clear">
    </div></div>
    
    
    <div class="rememberField" id="rememberField">
    	<span><input name="acceptFlyme" id="tongyi" type="checkbox" onchange="tongyiC()"></span>
    	<label tabindex="1">我已阅读并接受</label><a class="tiaokuan" href="xieyi.jsp">《Flyme服务协议条款》</a>
        
    </div>
    	<span id="tiaokuan" style="color:#FF6699;"></span>
    	<a class="fullBtnBlue" id="zhuce"  onclick="check()" >注册</a>
	</form></div>
    
    
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
</html>
<script language="javascript">
	$(function(){
	$("#getKey").click(
		function(){
			var i=parseInt((Math.random()*1000000+1));
			$("#kapkey").val(i);
			}
	)
	});
</script>
<script language="javascript">
	var nameflag=false;
	var phoneflag=false;
	var pwdflag=false;
	var kapkeyflag=false;
	var tongyiflag=false;
	function yonghuming(){
		if($.trim($("#name").val())==""){
			$("#yonghuyanzheng").html("请输入用户名！");
			nameflag=false;
		}else{
		$.post("zhuceServlet",{name:$("#name").val()},
			function(data,textStatus){
				if(data=="true"){
					$("#yonghuyanzheng").html("用户名已存在");
					$("#yonghuyanzheng").css("color","#f63");
					$("#name").css("backgroundColor","#f63");
					nameflag=false;
				}else{
					if($.trim($("#name").val())==""){
						$("#yonghuyanzheng").html("请输入用户名！");
						$("#yonghuyanzheng").css("color","#f63");
						$("#name").css("backgroundColor","#f63");
						nameflag=false;
					}else{
						$("#yonghuyanzheng").html("用户名可以使用");
						$("#yonghuyanzheng").css("color","#3f6");
						$("#name").css("backgroundColor","#3f6");
					nameflag=true;
					}
				};
	});
		return true;
		}}
	function yanzheng(){ 
	if(!$("#phone").val().match(/^1\d{10}$/)!=""){ 
		$("#shoujiyanzheng").html("手机号码格式不正确！请重新输入！"); 
		$("#shoujiyanzheng").css("color","#f63");
		$("#phone").css("backgroundColor","#f63");
		phoneflag=false; 
	   }else{
		$.post("zhucePhoneServlet",{phone:$("#phone").val()},
			function(data,textStatus){
				if(data=="true"){
					$("#shoujiyanzheng").html("手机号已存在");
					$("#shoujiyanzheng").css("color","#f63");
					$("#phone").css("backgroundColor","#f63");
					phoneflag=false;
				}else{
					if(!$("#phone").val().match(/^1\d{10}$/)!=""){
						$("#shoujiyanzheng").html("手机号码为空格式不正确！请重新输入！"); 
						$("#shoujiyanzheng").css("color","#f63");
						$("#phone").css("backgroundColor","#f63");
						phoneflag=false;
					}else{
						$("#shoujiyanzheng").html("手机号可以使用");
						$("#shoujiyanzheng").css("color","#3f6");
						$("#phone").css("backgroundColor","#3f6");
					phoneflag=true;
					}
				}
			}
		);
	}
	   phoneflag=true; 
	}
	function btnyanzheng(){ 
	if($("#password").val().length<5){ 
		$("#shoujibtn").html("密码最少输入6位！请重新输入！"); 
		pwdflag=false;
	   }else{
	   $("#shoujibtn").html("");
	   pwdflag=true;
	   }
	}
	
	function huoqu(){
	if($("#kapkey").val()==""){
		$("#yanzhengma").html("请点击获取验证码！");
		kapkeyflag=false;
	}else{
		$("#yanzhengma").html("");
		kapkeyflag=true;
		}
	}
	
	function tongyiC(){
	if(!$("#tongyi").get(0).checked){
		$("#tiaokuan").html("请确认已阅读并同意Flyme服务协议条款");
		tongyiflag=false;
	}else{
		$("#tiaokuan").html("");
		tongyiflag=true;
		}
	}
	function check(){
	if(nameflag&&phoneflag&&pwdflag&&kapkeyflag&&tongyiflag)
		$.ajax({
  					url:'zhuceyanzheng',
  					method:'post',
  					data:{
  						username:$("#name").val(),
  						userphone:$("#phone").val(), 
  						userpwd:$("#password").val()						
  					},
  					dataType:'text',
  					success:function(data){
  						if(data=="true"){
  							alert("注册成功,请登录！")
  							window.location.href="login.jsp";
  						}else{
  							alert("注册失败");
  						}
  					},
  					error:function(xhr,msg){
  						alert("服务器出错了！");
  					}
  				});
		}
</script>