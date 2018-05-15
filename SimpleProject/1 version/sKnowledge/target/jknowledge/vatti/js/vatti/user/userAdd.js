$(function() { 
	$("#user-mgr").addClass("active");
	//角色
	getAllRoles();
	//门店自动补全
	storeAutocomplete();
	//组织
	showAllOrgs();
	//返回
	back();
});

//用于检测账号是否重复
function checkAccount(){
	$.ajax({
		url : ctx + "/user/checkAccount.do", // 请求地址
		type : "post", // 以POST方式提交
		asysn : true, // true:异步调用; false:同步调用
		data : { // 请求参数
			"account" : $("[name='account']").val()
		},
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "failed") {
					document.getElementById("showAccountMessage").innerHTML=data.message;
				}else{
					document.getElementById("showAccountMessage").innerHTML=data.message;
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function back(){
	$("#back").click(function(){
		window.location.href = ctx + "/user/user-manage.do";
	});
}

function storeAutocomplete() {
	var store = $("#store");
	store.typeahead({
		source : function(query, process) {
			$("[name='storeId']").val("");
			var params = {code:query,name:query,organizationPath:query}
			//通过JQERY的AJAX方式调用门店controller
			$.post(ctx + "/store/getListByLike.do", params, function(data) {
				process(data.data);
			});
		},
		displayText : function(item) { // menu显示的名称
			if(item.code && item.name && item.organizationPath){
				return item.code + "/" + item.name + "/" + item.organizationPath;
			} 
			return ""
		},
		highlighter : function(item) { // 高亮显示
			var qw = store.val(); // 输入的值
			var m = new RegExp(qw, 'gi').exec(item); // 从item中找到输入的值
			
			if (m) {
				// 给输入的值高亮显示
				item = item.replace(new RegExp(qw, 'gi'),
						"<span style='color:red;font-weight:bold;'>" + m[0]
								+ "</span>");
			}
			return item;
		},
		updater : function(item) { // 选择menu中的ITEM时触发
			$("[name='storeId']").val(item.id);
			return item.code + "/" + item.name + "/" + item.organizationPath;
		},
		matcher : function(item) {
			return item.code + "/" + item.name + "/" + item.organizationPath;
		},
		autoSelect : true,
		showHintOnFocus:true,
		fitToElement : true
	});
}

function tosave() {
	$.ajax({
		url : ctx + "/user/save.do", // 请求地址
		async:true,
		type : "post", // 以POST方式提交
		dataType : 'json', // 返回值类型
		data : { // 请求参数
			"account" : $("input[name='account']").val(),
			"password" : $("input[name='password']").val(),
			"name" : $("input[name='name']").val(),
			"roleId" : $("select[name='roleId']").val(),
			"contactPhone":$("input[name='contactPhone']").val(),
			"storeId" : $("input[name='storeId']").val(),
			"organizationId" : $("select[name='organizationId']").val(),
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

function getAllRoles() {
	$.ajax({
		url : ctx + "/role/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		sysn : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#user-role");
					userRolesList.append($("<option value=''>请选择角色</option>"));
					$(roles).each(
							function() {
								userRolesList.append($("<option value='"
										+ this.id + "'>" + this.name
										+ "</option>"));
							});
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function showAllOrgs() {
	$.ajax({
		url : ctx + "/org/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		sysn : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data,status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#user-org");
					userRolesList.append($("<option value=''>请选择组织</option>"));
					$(roles).each(
							function() {
								userRolesList.append($("<option value='"
										+ this.id + "'>" + this.name
										+ "</option>"));
							});
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

