
var SYSBASE = {
	showSuccessDialog : function(msg , fn){
		if(fn != null){
			$.messager.alert("֪ͨ" , msg , "info" , fn);
		}else{
			$.messager.alert("֪ͨ" , msg , "info");
		}
	},
	showErrorDialog : function(msg , fn){
		if(fn != null){
			$.messager.alert("����" , msg , "error" , fn);
		}else{
			$.messager.alert("����" , msg , "error");
		}
	},
	showCallBackDialog : function(json , options){
		if(json != null && json.result != null && json.result == true ){
			if(options.success != null){
				$.messager.alert("֪ͨ" , json.message , "info" , options.success(json));
			}else{
				$.messager.alert("֪ͨ" , json.message , "info");
			}
		}else if(json != null && json.result != null && json.result == false){
			if(options.error != null){
				$.messager.alert("����" , json.message , "error" , options.error(json));
			}else{
				$.messager.alert("����" , json.message , "error");
			}
		}else{
			$.messager.alert("����" , "�������������ݸ�ʽ����" , "error");
		}
	},
	sendAjax:function(options){
		if(options.url == null){
			console.error("SYSBASE.sendAjax()�����ڲ�����:urlѡ����Ч,����ѡ������Ϊ:",options );
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
				console.error("SYSBASE.sendAjax()��������,XHR����:" , xhr);
				if(xhr.status == 404){
					$.messager.alert("����" , "404-\"" + options.url + "\"��Դ�޷�����" , "error");
				}else if(xhr.status == 500){
					$.messager.alert("����" , "500-\"" + options.url + "\"�����������ڲ�����" , "error");
				}else if(textStatus == "parsererror"){
					$.messager.alert("����" , options.url + "���������������޷�ת��ΪJSON��ʽ" , "error" , options.error!=null?options.error(xhr , textStatus , error):void(0));
				}else{
					$.messager.alert("����" , options.url + "����δ֪����" , "error" , options.error!=null?options.error(xhr , textStatus , error):void(0));
				}
				
			},
			complete : function(){
				options.complete!=null?options.complete(xhr , textStatus , error):void(0);
			}
		})
	}
};