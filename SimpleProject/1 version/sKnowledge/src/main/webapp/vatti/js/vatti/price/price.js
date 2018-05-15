$(function(){
	storeAutocomplete();
	showAllOrgs();
	productAutocomplete();
});

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
					var userRolesList = $("#price");
					userRolesList
							.append($("<option value=''>请选择</option>"));
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
			//通过jquery的AJAX方式调用门店controller
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
			$("[name='storeId1']").val(item.id);
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


function productAutocomplete() {
	var store = $("#product");
	store.typeahead({
		source : function(query, process) {
			$("#productId1").val("");
			var params = {sku:query,name:query,category:query}
			//通过jquery的AJAX方式调用产品controller
			$.post(ctx + "/pro/getListByProduct.do", params, function(result) {
				process(result.data);
			});
		},
		displayText: function(item) { // menu显示的名称
			if(item.sku && item.name && item.category){
				return item.sku + "/" + item.name + "/" + item.category;
			} 
			return "";
		},
		highlighter: function(item) { // 高亮显示
			var qw = store.val(); // 输入的值
			var m = new RegExp(qw,'gi').exec(item); // 从item中找到输入的值
			
			if (m) {
				// 给输入的值高亮显示
				item = item.replace(new RegExp(qw,'gi'),
						"<span style='color:red;font-weight:bold;'>" + m[0]
								+ "</span>");
			}
			return item;
		},
		updater : function(item) { // 选择menu中的ITEM时触发
			$("[name='productId1']").val(item.id);
			return item.sku + "/" + ite.name + "/" + item.category;
		},
		matcher : function(item) {
			return ite.sku + "/" + item.name + "/" + item.category;
		},
		autoSelect : true,
		fitToElement : true
	});
}