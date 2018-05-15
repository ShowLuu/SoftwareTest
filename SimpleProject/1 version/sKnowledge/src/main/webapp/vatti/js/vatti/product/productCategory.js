$(function() {
	$("#user-mgr").addClass("active");
	productcategorySerach();
	getListByPage(1);
	showAllProducts();
});

function productcategorySerach(){
	$("#searchCategoryProduct").click(function(){
		getListByPage(1);
	})
}

function getListByPage(pageNo) {
	$.ajax({
				url :ctx+"/proCategory/ByPageProductCategory.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用; false:同步调用
				data : { // 请求参数
					"name": $("#products").val(),
					"pageSize" : getPageSize("user-list"),
					"pageNo" : pageNo
				},
				dataType : 'json', // 返回值类型
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
							listByPage("user-list", total, pageSize, pageCount,
									pageNo);
							showPageDetailpro(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法
					
				}
			});
}

function showPageDetailpro(items) {
	$(items)
			.each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + 
								"<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.fullPath + "</td>"));
						tr.append($("<td>" + this.name + "</td>"));
						tr.append($("<td>" + this.rank + "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.updateTime + "</td>"));
						$("#user-list").append(tr);
					});
}
function showAllProducts() {
	$.ajax({
		url : ctx + "/proCategory/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		async : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {
				if (data.statusText == "success") {
					var products = data.data;
					var ProductsList = $("#products");
					ProductsList
							.append($("<option value=''>请选择产品目录</option>"));
					$(products).each(
							function() {
								ProductsList.append($("<option value='"
										+ this.name + "'>" + this.name
										+ "</option>"));
							});
				}
			}
		},
		error : function(req, status, error) { // 请求失败回调error方法
		}
	});
}