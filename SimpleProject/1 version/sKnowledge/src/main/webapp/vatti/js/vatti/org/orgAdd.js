$(function() { 
	$("#user-mgr").addClass("active");
	//返回
	back();
});

function back(){
	$("#back").click(function(){
		window.location.href = ctx + "/org/org.do";
	});
}

//用于检测账号是否重复
function checkorganizationAccount(){
	$.ajax({
		url : ctx + "/org/checkOrgAccount.do", // 请求地址
		type : "post", // 以POST方式提交
		asysn : true, // true:异步调用; false:同步调用
		data : { // 请求参数
			"code" : $("[name='code']").val()
		},
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "failed") {
					document.getElementById("showOrgAccountMessage").innerHTML=data.message;
				}else{
					document.getElementById("showOrgAccountMessage").innerHTML=data.message;
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function tosaveorg() {
	$.ajax({
		url : ctx + "/org/save.do", // 请求地址
		async:true,
		type : "post", // 以POST方式提交
		dataType : 'json', // 返回值类型
		data : { // 请求参数
			"code" : $("input[name='code']").val(),
			"fullPath" : $("input[name='fullpath']").val(),
			"name" : $("input[name='name']").val(),
			"rank":$("input[name='rank']").val(),
			"parentId" : $("input[name='parent_id']").val(),
		},
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					alert("新增成功!")
				}else{
					alert("新增失败!")
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}