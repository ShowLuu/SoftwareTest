$(function() {
	$("#user-mgr").addClass("active");
	getListByPage(1);
	searchProduct();
});

//查询用户
function searchProduct(){
	$("#searchProduct").click(function(){
		getListByPage(1);
	});
}

function getListByPage(pageNo) {
	$.ajax({
				url :ctx+ "/pro/getListByPageProduct.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用; false:同步调用
				data : { // 请求参数
					"beginTime" : $("#datetimepicker").val(),
					"finishTime" : $("#datetimepicker1").val(),
					"deliveryDate" : $("#datetimepicker2").val(),
					"memberNumber" : $("[name='billNo']").val(),
					"organizationPath" : $("[name='organizationPath']").val(),
					"storeCode" : $("[name='storeId']").val(),
					"userName" : $("[name='userName']").val(),
					"products" : $("[name='products']").val(),
					"customerName" : $("[name='customerName']").val(),
					"customerMobile" : $("[name='customerMobile']").val(),
					"pageSize" : getPageSize("product_list"),
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
							listByPage("product_list", total, pageSize, pageCount,
									pageNo);
							showPageDetail(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法
					
				}
			});
}
function showPageDetail(items) {
	$(items).each(function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + "<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.comment + "</td>"));
						tr.append($("<td>" + this.contactPhone + "</td>"));
						tr.append($("<td>"+this.storeName+"</td>"));
						tr.append($("<td>" + this.deliveryDate + "</td>"));
						tr.append($("<td><span class='text-ellipsis' style='max-width:100px;'>"
										+ (this.customerName == null ? ""
												: this.customerName)
										+ "</span></td>"));
						tr.append($("<td>" + this.deliveryAddress + "</td>"));
						tr.append($("<td>"+this.customerMobile+"</td>"));
						tr.append($("<td>" + this.products + "</td>"));
						tr.append($("<td>" + this.organizationPath + "</td>"));
						tr.append($("<td>" + this.memberNumber + "</td>"));
						tr.append($("<td>" + this.gifts + "</td>"));
						$("#product_list").append(tr);
					});
}	
	


