<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
  <head>
    <title>manage.html</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/easyui/easyui-lang-zh_CN.js"></script>

  	<link href="${pageContext.request.contextPath}/resource/easyui/default/easyui.css" type="text/css" rel="stylesheet"></link>
  	<link href="${pageContext.request.contextPath}/resource/easyui/icon.css" type="text/css" rel="stylesheet"></link>
  	
  	<style>
  		#tab tr{
    		height: 40px;
    	}
    	#tab tr td{
    		text-align: center;
    	}
  	</style>
  	
	<script language="javascript">
  		$(function(){
  			$("#cmbType").combobox({
  				//valueField绑定值，表单提交才能使controller接收到
  				valueField: "typename",
			    textField: "typename",
				onShowPanel : function(){
					var s=$(this).combobox('getData');
				    $(this).combobox('options').url= "${pageContext.request.contextPath}/type/findAll";
				    $(this).combobox('reload');
				}
  			});
  					
			$(function(){    
			    $('#btnSubmit').bind('click', function(){    
			        $("#frmManage").submit();    
			    });    
			});
			
		   	var msg = "${message}";
		    if(msg != ""){
		    	$.messager.alert("消息" , msg );
		    }
		});
  	</script>
  </head>
  
  <body>
  	<div id="p" class="easyui-panel" title="上传商品"     
        style="width:600px;height:210px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-save',maximizable:true">
        <form id="frmManage" action="${pageContext.request.contextPath}/goods/manage" method="post" enctype="multipart/form-data">
        	<table id="tab">
        		<tr>
        			<td style="width:10%">商品名称</td>
        			<td style="width:20%"><input id="goodsName" name="goodsName" class="easyui-textbox" required="true"></td>
        			<td style="width:10%">库存数量</td>
        			<td style="width:20%"><input id="amount" name="amount" class="easyui-textbox" required="true"></td>
        		</tr>
        		
        		<tr>
        			<td style="width:10%">价格</td>
        			<td style="width:20%"><input id="price" name="price" class="easyui-textbox" required="true"></td>
        			<td style="width:10%">折扣</td>
        			<td style="width:20%"><input id="discount" name="discount" class="easyui-textbox" required="true"></td>
        		</tr>
        		
        		<tr>
        			<td style="width:10%">上传图片</td>
        			<td style="width:20%"><input id="photo" name="photo" class="easyui-filebox"  buttonText="上传" required="true"></input></td>
        			<td style="width:10%">种类</td>
        			<td style="width:20%"><input id="cmbType" name="type"  class="easyui-combobox" required="true"></input></td>
        		</tr>
        	</table>
        </form>
        <div style="text-align: center">
        	<a id="btnSubmit" href="#" class="easyui-linkbutton" iconCls="icon-ok">上传</a>
        </div>
    </div>
  </body>
</html>
