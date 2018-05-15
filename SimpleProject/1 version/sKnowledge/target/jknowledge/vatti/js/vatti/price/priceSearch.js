$(function() {
	$("#user-mgr").addClass("active");
	getListByPage(1);
	priceSerach();
	storeAutocomplete();
	productAutocomplete();
	showAllOrgs();
});

function showAllOrgs() {
	$.ajax({
		url : ctx + "/org/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		sysn : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#priceOrg");
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

function priceSerach(){
	$("#searchPrice").click(function(){
		getListByPage(1);
	})
}

function getListByPage(pageNo) {
	$.ajax({
				url : ctx + "/price/priceSerach.do",
				type : "post",
				async : true,
				data : {
					"organizationId" : $("[name='organizationId']").val(),
					"storeId" : $("[name='storeId']").val(),
					"productId" : $("[name='productId']").val(),
					"pageSize" : getPageSize("price_list"),
					"pageNo" : pageNo
				},
				dataType : 'json',
				beforeSend : function(req) { // 请求前回调beforeSend方法

				},
				success : function(data, status) { // 请求成功回调success方法
					if (data) {
						if (data.statusText == "success") {
							var pageInfo = data.data;
							var total = pageInfo.total;
							var pageSize = pageInfo.pageSize;
							var pageCount = pageInfo.pageCount;
							var pageNo = pageInfo.pageNo;
							var items = pageInfo.items;
							listByPage("price_list", total, pageSize,
									pageCount, pageNo);
							showPageDetail(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法
				}
			});
}

function showPageDetail(items) {
	$(items).each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + "<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.productCode + "</td>"));
						tr.append($("<td>" + this.storeCode + "</td>"));
						tr.append($("<td>" + this.organizationPath + "</td>"));
						tr.append($("<td class='editable' contenteditable='true'>" + this.storeName + "</td>"));
						tr.append($("<td>"+ this.productName + "</td>"));
						tr.append($("<td>" + this.priceDefault + "</td>"));
						tr.append($("<td>" + this.pricePackage + "</td>"));
						tr.append($("<td>" + this.priceActive + "</td>"));
						$("#price_list").append(tr);
					});
}

//产品自动补全
function productAutocomplete() {
	var product = $("#product");
	product.typeahead({
		source : function(query, process) {
			$("[name='productId']").val("");
			var params = {sku:query,
					name:query,
					category:query}
			//通过jquery的AJAX方式调用产品controller
			$.post(ctx + "/pro/getListByProduct.do", params, function(data) {
				process(data.data);
			});
		},
		displayText: function(item) { // menu显示的名称
			if(item.sku && item.name && item.category){
				return item.sku + "/" + item.name + "/" + item.category;
			} 
			return "";
		},
		highlighter: function(item) { // 高亮显示
			var qw = product.val(); // 输入的值
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
			$("[name='productId']").val(item.id);
			return item.sku + "/" + item.name + "/" + item.category;
		},
		matcher : function(item) {
			return item.sku + "/" + item.name + "/" + item.category;
		},
		autoSelect : true,
		showHintOnFocus:true,
		fitToElement : true
	});
}


//门店自动补全
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
			$("[name='storeId']").val(item.id);
			return item.code + "/" + item.name + "/" + item.organizationPath;
		},
		matcher : function(item) {
			return item.code + "/" + item.name + "/" + item.organizationPath;
		},
		autoSelect : true,
		showHintOnFocus:true,
		fitToElement : true,
	});
}