$(function() {
	$("#user-mgr").addClass("active");
	//组织机构
	showAllOrgs();
	//获取id展示到页面上的值
	getStoreById();
	//通过id修改
	updateStoreId();
	//返回
	back();
});

function back(){
	$("#back").click(function(){
		window.location.href = ctx + "/store/store-manage.do";
	});
}

//展示到页面上的值
function getStoreById() {
	$.ajax({
		url : ctx + "/store/getStoreById.do", // 请求地址
		type : "post", // 以POST方式提交
		async : true, // true:异步调用; false:同步调用
		data : {
			id : $("#storeId").val(),
		},
		dataType : 'json', // 返回值类型
		success : function(result, status) { // 请求成功回调success方法
			if (result) {//如果result==true
				if (result.statusText == "success") {
					var store = result.data;
					$("#code").val(store.code);
					$("#name").val(store.name);
					$("#storePhone").val(store.contactPhone);
					$("#description").val(store.description);
					$("#state").val(store.state);
					$("#organizationId").val(store.organizationId);
					$("#organizationPath").val(store.organizationPath);
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function updateStoreId() {
	$("#update").click(function(){
		$.ajax({
			url : ctx + "/store/updateStoreId.do", // 请求地址
			type : "post", // 以POST方式提交
			async : true, // true:异步调用; false:同步调用
			data : {
				"id" : $("#storeId").val(),
				"name" : $("#name").val(),
				"code" : $("#code").val(),
				"contactPhone" : $("#storePhone").val(),
				"description" : $("#description").val(),
				"state" : $("#state").val(),
				"organizationId" : $("#organizationId").val(),
				"organizationPath" : $("#organizationPath").val()
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
					var userRolesList = $("#organizationId");
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

	
	


