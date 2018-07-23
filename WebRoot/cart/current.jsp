<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>current.html</title>
    <meta name="keywords" content="keyword1,keyword2,keyword3"></meta>
    <meta name="description" content="this is my page"></meta>
    <meta name="content-type" content="text/html; charset=UTF-8"></meta>
    
    <!-- jquery.min.js要在最前面声明 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/easyui/easyui-lang-zh_CN.js"></script>
  	<link href="${pageContext.request.contextPath}/resource/easyui/default/easyui.css" type="text/css" rel="stylesheet"></link>
  	<link href="${pageContext.request.contextPath}/resource/easyui/icon.css" type="text/css" rel="stylesheet"></link>
  	
  	<script type="text/javascript">
		function _showPhoto(value,rowData,rowIndex){
			if(rowData.goods_photo_file){
				return "<img src='${pageContext.request.contextPath}/goods/upload_goods?filepath="+rowData.goods_photo_file+"' alt='加载失败'style='width:200px;height:200px'/>";
			}else{
				return null;
			}
		}
  	</script>
  	
   	<script type="text/javascript">
  		$(function(){
  			$("#pay_no_money").click(function(){
  			  	$("#pay").show();
  			  	$("#pay").dialog({
					title : "赊账结算" , 
					width : 250,
					height: 200,
					modal :true
				});
				
  			  	var rows=$("#tab").datagrid("getRows");
  			  	var allTotal=0;
  			  	if(rows == ""){
  			  		console.info("pay_no_money:订单为空设置总消费为0");
  			  	}else{
	  			  	for(var i=0;i<rows.length;i++){
	  			  		allTotal += parseFloat(rows[i].total);
	  			  		console.info("allTotal:"+allTotal);
	  			  	}
  			  	}
  			  	document.getElementById("allTotal").value = allTotal;
  			});
  			
			$("#btnSubmit").click(function(){
				$("#frmPay").form("submit" , {
					url : "${pageContext.request.contextPath}/cart/pay", 
					success : function(data){
						console.info("btnSubmit:"+data);
				        var data = eval('(' + data + ')');
				        if(data.message !=""){
					    	$.messager.alert("消息:",data.message );
					    	$("#tab").datagrid("reload");
				        }
					}
				});
				//清空输入内容并且关闭
				$("#pay").form("clear");
				$("#pay").dialog("close");
			});
  		});
		
		function reload(){
			$("#tab").datagrid("reload");
		}
  	</script>
  </head>
  
  <body>
  	<table id="tab" class="easyui-datagrid" toolbar="#tb" striped="true" url="${pageContext.request.contextPath}/cart/current" fit=true title="当前订单">
  		<thead>
  			<tr>
  				<th data-options="field:'goods_photo_file',align:'center',formatter:_showPhoto">图片预览</th>
  				<th data-options="width:100,field:'goodsname'">商品名</th>
  				<th data-options="width:100,field:'price'">价格</th>
  				<th data-options="width:100,field:'number'">购买数量</th>
  				<th data-options="width:100,field:'total'">总价</th>
  			</tr>
  		</thead>
  	</table>
  	
  	<div id="tb">
  		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reload()" iconCls="icon-reload">刷新</a>
  		<a id="pay_no_money" class="easyui-linkbutton" iconCls="icon-custom-cart">赊账结算</a>
  		<a id="remove" class="easyui-linkbutton"  iconCls="icon-remove">删除商品</a>
  	</div>
  	<div id="pay" style="display:none; padding: 10px">
    	<form id="frmPay" method="post">
	    	消费金额:<input editable=false readonly=true id="allTotal" name="allTotal" value=""></input><br/>
	    	电话号码:<input name="phone" class="easyui-textbox" required="true" style="width:100px"/><br/>
	    	配送地址:<textarea name="address" class="easyui-textbox" required="true" style="width:100px;height:50px" ></textarea><br/>
	    	<div style="width:100%;text-align: center;">
	    		<a id="btnSubmit" class="easyui-linkbutton" iconCls="icon-ok">确定</a>
	    	</div>
    	</form>
    </div>
  </body>
</html>
