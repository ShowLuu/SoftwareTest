$(function() {
	$("#user-mgr").addClass("active");
	storeAutocomplete();
	productAutocomplete();
});

function showPageDetail(items) {
	$(items).each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td>" + this.organizationPath + "</td>"));
						tr.append($("<td class='editable' contenteditable='true'>" + this.storeName + "</td>"));
						tr.append($("<td>"+ this.productName + "</td>"));
						tr.append($("<td>" + this.priceDefault + "</td>"));
						tr.append($("<td>" + this.pricePackage + "</td>"));
						tr.append($("<td>" + this.priceActive + "</td>"));
						$("#price-list").append(tr);
					});
}

function storeAutocomplete() {
	var store = $("#store");
	store.typeahead({
		source : function(query, process) {
			$("[name='storeId']").val("");
			var params = {
				code : query,
				name : query,
				organizationPath : query
			}
			// 通过jquery的AJAX方式调用门店controller
			$.post(ctx + "/store/getListByLike.do", params, function(data) {
				process(data.data);
			});
		},
		displayText : function(item) { // menu显示的名称
			if (item.code && item.name && item.organizationPath) {
				return item.code + "/" + item.name + "/"
						+ item.organizationPath;
			}
			return "";
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
		fitToElement : true
	});
}

function productAutocomplete() {
	var product = $("#product");
	product.typeahead({
		source : function(query, process) {
			$("[name='productId']").val("");
			var params = {
				sku : query,
				name : query,
				category : query
			}
			// 通过jquery的AJAX方式调用产品controller
			$.post(ctx + "/pro/getListByProduct.do", params, function(data) {
				process(data.data);
			});
		},
		displayText : function(item) { // menu显示的名称
			if (item.sku && item.name && item.category) {
				return item.sku + "/" + item.name + "/" + item.category;
			}
			return "";
		},
		highlighter : function(item) { // 高亮显示
			var qw = product.val(); // 输入的值
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









