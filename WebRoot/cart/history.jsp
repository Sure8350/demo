<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>history.html</title>
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
  		
  		});
		function reload(){
			$("#tab").datagrid("reload");
		}
		function formatOper(val,row,index){  
                return '<a  href="#"  onclick="showInfo('+row.historyId+')">订单详情</a>';  
    	}
    	
    	function showInfo(id){
	        $("#datagrid").datagrid({
	            url: "${pageContext.request.contextPath}/cart/orderingInfo?historyId=" + id,
	            fitColumns: false,
	            singleSelect: true,
	        });
	        $('#dlg').window('open');
    	}
  	</script>
  </head>
  
  <body>
  	<table id="tab" class="easyui-datagrid" toolbar="#tb" striped="true" singleSelect="true" url="${pageContext.request.contextPath}/cart/history" fit=true title="历史订单">
  		<thead>
  			<tr>
  				<!-- <th data-options="field:'goods_photo_file',align:'center',formatter:_showPhoto">图片预览</th> -->
  				<th data-options="width:200,field:'date'">下单时间</th>
  				<th data-options="width:200,field:'address'">配送地址</th>
  				<th data-options="width:100,field:'phone'">电话号码</th>
  				<th data-options="width:100,field:'all_total'">总消费</th>
  				<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper">订单详情</th> 
  			</tr>
  		</thead>
  	</table>
  	
  	
  	<div id="tb">
  		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reload()" iconCls="icon-reload">刷新</a>
  	</div>
  	
  	<div id="dlg" class="easyui-dialog" title="订单详情" style="width:auto;height:auto;" data-options="closed:true">
    	<table id="datagrid" class="easyui-datagrid" style="width:600px;height:150px">
            <thead>
                <tr>
	 				<th data-options="width:100,field:'goodsname'">商品名</th>
	  				<th data-options="width:100,field:'price'">价格</th>
	  				<th data-options="width:100,field:'number'">购买数量</th>
	  				<th data-options="width:100,field:'total'">总价</th>
                </tr>
            </thead>
        </table>
    </div>
  </body>
</html>
