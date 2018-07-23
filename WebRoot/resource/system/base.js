
var SYSBASE = {
	showSuccessDialog : function(msg , fn){
		if(fn != null){
			$.messager.alert("通知" , msg , "info" , fn);
		}else{
			$.messager.alert("通知" , msg , "info");
		}
	},
	showErrorDialog : function(msg , fn){
		if(fn != null){
			$.messager.alert("错误" , msg , "error" , fn);
		}else{
			$.messager.alert("错误" , msg , "error");
		}
	},
	showCallBackDialog : function(json , options){
		if(json != null && json.result != null && json.result == true ){
			if(options.success != null){
				$.messager.alert("通知" , json.message , "info" , options.success(json));
			}else{
				$.messager.alert("通知" , json.message , "info");
			}
		}else if(json != null && json.result != null && json.result == false){
			if(options.error != null){
				$.messager.alert("错误" , json.message , "error" , options.error(json));
			}else{
				$.messager.alert("错误" , json.message , "error");
			}
		}else{
			$.messager.alert("错误" , "服务器返回数据格式错误" , "error");
		}
	},
	sendAjax:function(options){
		if(options.url == null){
			console.error("SYSBASE.sendAjax()函数内部错误:url选项无效,传递选项数据为:",options );
			return;
		}
		
		$.ajax({
			url : options.url , 
			type : options.type!=null?options.type:"get",
			data : options.data!=null?options.data:{},
			dataType : "json" , 
			success : function(json){
				options.success!=null?options.success(json):void(0);
			},
			error : function(xhr , textStatus , error){
				console.error("SYSBASE.sendAjax()方法错误,XHR对象:" , xhr);
				if(xhr.status == 404){
					$.messager.alert("错误" , "404-\"" + options.url + "\"资源无法访问" , "error");
				}else if(xhr.status == 500){
					$.messager.alert("错误" , "500-\"" + options.url + "\"产生服务器内部错误" , "error");
				}else if(textStatus == "parsererror"){
					$.messager.alert("错误" , options.url + "服务器返回数据无法转换为JSON格式" , "error" , options.error!=null?options.error(xhr , textStatus , error):void(0));
				}else{
					$.messager.alert("错误" , options.url + "产生未知错误" , "error" , options.error!=null?options.error(xhr , textStatus , error):void(0));
				}
				
			},
			complete : function(){
				options.complete!=null?options.complete(xhr , textStatus , error):void(0);
			}
		})
	}
};