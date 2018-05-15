$(function() {
	$("#user-mgr").addClass("active");
	//角色
	getAllRoles();
	//组织
	showAllOrgs();
	//获取要修改数据的id
	getUserById();
	//门店自动补全
	storeAutocomplete();
	//通过id修改
	updateUserId();
	//返回
	back();
});

function back(){
	$("#back").click(function(){
		window.location.href = ctx + "/user/user-manage.do";
	});
}

//展示到页面上的值
function getUserById() {
	$.ajax({
		url : ctx + "/user/getUserById.do", // 请求地址
		type : "post", // 以POST方式提交
		async : true, // true:异步调用; false:同步调用
		data : {
			id : $("#userId").val(),
		},
		dataType : 'json', // 返回值类型
		success : function(result, status) { // 请求成功回调success方法
			if (result) {//如果result==true
				if (result.statusText == "success") {
					var user = result.data;
					$("#userAcc").text(user.account);
					$("#userName").val(user.name);
					$("#SelectRole").val(user.roleId);
					$("#SelectOrg").val(user.organizationId);
					$("#store").val(user.storeName);
					$("#userPhone").val(user.contactPhone);
					$("#userOpen").val(user.openId);
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function updateUserId() {
	$("#update").click(function(){
		$.ajax({
			url : ctx + "/user/updateUserId.do", // 请求地址
			type : "post", // 以POST方式提交
			async : true, // true:异步调用; false:同步调用
			data : {
				"id" : $("#userId").val(),
				"name" : $("#userName").val(),
				"contactPhone" : $("#userPhone").val(),
				"organizationId" : $("#SelectOrg").val(),
				"storeId" : $("#storeId").val(),
				"roleId" : $("#SelectRole").val(),
				"openId" : $("#userOpen").val()
			},
			dataType : 'json', // 返回值类型
			success : function(result, status) { // 请求成功回调success方法
				if (result) {//如果result==true
					if (result.statusText == "success") {
						alert("修改成功！");
					}else{
						alert("修改失败！");
					}
				}
			},
			error : function(req, status, error) { // 请求失败回调error方法
			}
		});
	});
	
}

function getAllRoles() {
	$.ajax({
		url : ctx + "/role/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		async : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {//如果data==true
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#SelectRole");
					userRolesList
							.append($("<option value=''>请选择角色</option>"));
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
		async : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#SelectOrg");
					userRolesList
							.append($("<option value=''>请选择组织</option>"));
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

function storeAutocomplete() {
	var store = $("#store");
	store.typeahead({
		source : function(query, process) {
			$("[name='storeId']").val("");
			var params = {code:query,name:query,organizationPath:query}
			//通过JQUERY的AJAX方式调用门店controller
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

	
	


