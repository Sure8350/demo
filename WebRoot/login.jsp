<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎进入商城</title>
<link href="${pageContext.request.contextPath}/resource/uimaker/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>

<script language="javascript">
	$(function(){
		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		})  
	});
	window.onload = function() {
		document.getElementById("IbtnEnter").onclick = function() {
			document.getElementById("frmLogin").submit();
		};
		
		document.getElementById("IbtnRegister").onclick = function() {
			window.location.href="register.jsp"
		};
	}
	
	$(document).keydown(function(e){
	if(e.keyCode == 13) {
		$('#frmLogin').submit();
		}
	});
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath}/resource/uimaker/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

<div class="logintop">    
    <span>欢迎进入商城</span>    
    </div>

    <div class="loginbody">
    
	    <div class="loginbox">
	    
	    <form id="frmLogin" action="${pageContext.request.contextPath }/login" method="post">
	    <ul>
	   	<div style="color:red;margin: 5px;font-weight: bold;font-size: 14px">${errormessage}</div>
	    <li><input name="username" type="text" class="loginuser" id="TxtUserName" placeholder="请输入用户名"/></li>
	    <li><input name="password" type="password" class="loginpwd" id="TxtPassword" placeholder="请输入密码"/></li>
	    <li><input name="IbtnEnter" type="button" class="loginbtn" id="IbtnEnter" value="登录" />
	    <input name="IbtnRegister" type="button" class="Regbtn" id="IbtnRegister" value="注册" /></li>
	    </ul>
	    </form>
	    </div>
    </div>
 
		<div class="loginbm">版权所有  2018  XXXX  </div>
    
</body>

</html>
