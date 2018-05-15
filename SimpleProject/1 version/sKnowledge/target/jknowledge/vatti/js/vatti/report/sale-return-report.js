$(function() {
	$("#sale-return-report-mgr").addClass("active");
	showAllOrgs();
	searchSaleReport();
	getListByPage(1);
	storeAutocomplete();
});

/**
 * 查询退货上报
 */
function searchSaleReport(){
	$("#selectReport").click(function(){
		//根据条件查询退货上报
		getListByPage(1);
	});
}

//选择机构下拉框列表
function showAllOrgs() {
	$.ajax({
		url : ctx + "/org/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		async : false, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#organizationPath");
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

//根据条件查询
function getListByPage(pageNo){
	$.ajax({
		url : ctx + "/sale/getByPageReturnReport.do", // 请求地址
		type : "post", // 以POST方式提交
		async : false, // true:异步调用; false:同步调用
		data : { // 请求参数
			"startTime" :$("[name='datetimepicker']").val(),
			"endTime" :$("[name='datetimepicker1']").val(),
			"billNo" :$("[name='billNo']").val(),
			"organizationPath" :$("[name='organizationPath']").val(),
			"storeName" :$("[name='storeName']").val(),
			"userName" :$("[name='userName']").val(),
			"products" :$("[name='products']").val(),
			"customerName" :$("[name='customerName']").val(),
			"customerMobile" :$("[name='customerMobile']").val(),
			"pageSize" : getPageSize("sale_return_report"),
			"pageNo" : pageNo
		},
		dataType : 'json', // 返回值类型
		beforeSend : function(req) { // 请求前回调到beforeSend方法

		},
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var pageInfo = data.data;
					var total = pageInfo.total;
					var pageSize = pageInfo.pageSize;
					var pageCount = pageInfo.pageCount
					var pageNo = pageInfo.pageNo;
					var items = pageInfo.items;
					listByPage("sale_return_report", total, pageSize, pageCount,
							pageNo);
					showPageDatailReport(items);
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}

function showPageDatailReport(items) {
	$(items).each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + "<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.customerName + "</td>"));
						tr.append($("<td>" + this.customerMobile + "</td>"));
						tr.append($("<td>" + this.customerHomePhone + "</td>"));
						tr.append($("<td>" + this.deliveryAddress + "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.product + "</td>"));
						tr.append($("<td>" + this.billNo + "</td>"));
						tr.append($("<td>" + this.price + "</td>"));
						tr.append($("<td>" + this.userName + "</td>"));
						tr.append($("<td>" + this.comment + "</td>"));
						tr.append($("<td>" + this.storeName + "</td>"));
						$("#sale_return_report").append(tr);
					});
}

//门店自动补全
function storeAutocomplete() {
	var store = $("#store");
	store.typeahead({
		source : function(query, process) {
			$("[name='storeId']").val("");
			var params = {
				code : query,
				name : query,
				organizationPath : query,
				start : 0,
				count : 20
			}
			$.post(ctx + "/store/getListByLike.do", params, function(data) {
				process(data.data);
			});
		},
		displayText : function(item) {// menu显示的名称
			if (item.code && item.name && item.organizationPath) {
				return item.code + "/" + item.name + "/"
						+ item.organizationPath;
			}
			return ""
		},
		highlighter : function(item) {// 高亮显示
			var qw = store.val();// 输入的值
			var m = new RegExp(qw, 'gi').exec(item);// 从item中找到输入的值
			if (m) {
				// 给输入的值高亮显示
				item = item.replace(new RegExp(qw, 'gi'),
						"<span style='color:red;font-weight:bold;'>" + m[0]
								+ "</span>");
			}
			return item;
		},
		updater : function(item) {// 选择menu中的item时触发
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
