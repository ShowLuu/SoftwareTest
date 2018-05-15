function showAllOrgs(id) {
	$.ajax({
		url : ctx + "/org/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		sysn : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#" + id);
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
