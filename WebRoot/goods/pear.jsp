<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>pear.html</title>
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
  			$("#addCart").click(function(){
  				var data = $("#tab").datagrid("getSelected");
  				//利用线面的隐藏input返回选择的商品Id
  				document.getElementById("goodsId").value = data.goods_id;
  			  	$("#num").show();
  			  	$("#num").dialog({
					title : "选择数量" , 
					width : 200,
					height: 150,
					modal :true
				});
  			  	
  			});
  			
			$("#btnSubmit").click(function(){
				$("#frmNum").form("submit" , {
					url : "${pageContext.request.contextPath}/cart/add_cart", 
					success : function(data){
						console.info(data);
				        var data = eval('(' + data + ')');    
				        if(data.message !=""){    
					    	$.messager.alert("消息:",data.message );
				        }
					}
				});
				//清空输入内容并且关闭
				$("#num").form("clear");
				$("#num").dialog("close");
				
			});
			
	
  		});
		function reload(){
			$("#tab").datagrid("reload");
		}
  	</script>
  </head>
  
  <body>
  	<table id="tab" class="easyui-datagrid" toolbar="#tb" striped="true" singleSelect="true" url="${pageContext.request.contextPath}/goods/pear" fit=true title="梨">
  		<thead>
  			<tr>
  				<th data-options="width:100,field:'',checkbox:'true'"></th>
  				<th data-options="field:'goods_photo_file',align:'center',formatter:_showPhoto">图片预览</th>
  				<th data-options="width:100,field:'goodsname'">商品名</th>
  				<th data-options="width:100,field:'price'">价格</th>
  				<th data-options="width:100,field:'amount'">库存</th>
  				<th data-options="width:100,field:'discount'">折扣</th>
  			</tr>
  		</thead>
  	</table>
  	
  	<div id="tb">
  		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reload()" iconCls="icon-reload">刷新</a>
  		<a id="addCart" class="easyui-linkbutton" iconCls="icon-custom-cart">添加到购物车</a>
  	</div>
  	<div id="num" style="display:none; padding: 10px">
    	<form id="frmNum" method="post">
	    	选择数量:<input name="number" class="easyui-textbox" required="true" style="width:100px"/><br/>
	    	    		<input type="hidden" id="goodsId" name="goodsId" value=""></input>
	    	<div style="width:100%;text-align: center;">
	    		<a id="btnSubmit" class="easyui-linkbutton" iconCls="icon-ok">确定</a>
	    	</div>
    	</form>
    </div>
  </body>
</html>
