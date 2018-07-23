<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>index.html</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3"></meta>
    <meta name="description" content="this is my page"></meta>
    <meta name="content-type" content="text/html; charset=UTF-8"></meta>
    <!-- jquery.min.js要在最前面声明 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/easyui/jquery.easyui.min.js"></script>
  	<link href="${pageContext.request.contextPath}/resource/easyui/default/easyui.css" type="text/css" rel="stylesheet"></link>
  	<link href="${pageContext.request.contextPath}/resource/easyui/icon.css" type="text/css" rel="stylesheet"></link>
  	<link href="${pageContext.request.contextPath}/resource/uimaker/top.css" type="text/css" rel="stylesheet"></link>
  	
  	<script type="text/javascript">
  		$(function(){
  			$(".easyui-tree").tree({
  				onClick:function(node){
  					if(node.attributes ==null || node.attributes.url == null){
  						console.info(node.text+" 未设置URL不执行建立页签");
  						return;
  					}
  					console.info(node);
  					var isExists = $("#tabsMain").tabs("exists" , node.text);
  					if(isExists == false){
	  					$("#tabsMain").tabs("add" , {
	  						title : node.text,
		  					closable : true , 
		  					content : "<iframe src='" + node.attributes.url + "' style='height:100%;width:100%;border:0px'></iframe>"
		  				});
	  				}else{
	  					$("#tabsMain").tabs("select" , node.text);
	  				}
  				}
  			});
  		})
  	</script>
  
  </head>
  
<body class="easyui-layout">   
    <div data-options="region:'north'" style="background-image: url('${pageContext.request.contextPath}/resource/easyui/topbar.jpg');background-size: 90% 100%;background-repeat: no-repeat">
	    <div class="topright" fit="true">    
	    <ul>
	    <li style="list-style-type:none"><span><img src="${pageContext.request.contextPath}/resource/uimaker/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
	    <li style="list-style-type:none"><a href="#">关于</a></li>
	    <li style="list-style-type:none"><a href="${pageContext.request.contextPath}/logout" target="_parent">退出</a></li>
	    </ul>
	    </div>
	    <div class="user">
	    <span>${sessionScope.loginuser.name}</span>
	    <i>消息</i>
	    </div>    
    </div> 
    <div data-options="region:'west'" title="系统列表" split="true" style="width:200px;">
    	<div class="easyui-accordion" fit="true" border="false">
    		<!-- var="m"指代items每次循环得到的模块 -->
    		<c:forEach items="${loginuser.promission}" var="m">
    		<div title="${m.module_name}">
	    		  <ul id="treeFunc" class="easyui-tree" checkbox="false" lines="true">
	  				<li><span>${m.module_name}</span>
	  					<c:forEach items="${m.functions}" var="f">
	  					<ul>
		  					<li iconCls="icon-set" data-options="attributes:{url:'${pageContext.request.contextPath}${f.url}'}"><span>${f.function_name}</span></li>
	  					</ul>
	  					</c:forEach>
	  				</li>
	  			</ul>
    		</div>
    		</c:forEach>
    	</div>
    </div>
    <div data-options="region:'center'">
    	<div class="easyui-tabs" id="tabsMain" fit="true" border="false">
  			<div title="首页" style="background-image: url('${pageContext.request.contextPath}/resource/easyui/welcome.jpg');background-repeat: no-repeat;background-size:100% 100%"></div>
    	</div>
    </div>  
</body>  
</html>
