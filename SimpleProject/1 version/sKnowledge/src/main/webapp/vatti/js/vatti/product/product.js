$(function() {
	$("#user-mgr").addClass("active");
	getListByPage(1);
	productSerach();
});

function productSerach(){
	$("#searchProduct").click(function(){
		getListByPage(1);
	})
}

function getListByPage(pageNo) {
	$.ajax({
				url : ctx + "/pro/getByPageProduct.do", // 请求地址
				type : "post", // 以POST方式提交
				asysn : true, // true:异步调用;false:同步调用
				// timeout:10000,
				data : { // 请求参数
					"category" :$("[name='category']").val(),
					"name" :$("[name='name']").val(),
					"status" :$("[name='status']").val(),
					"pageSize" : getPageSize("product_list"),
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
							listByPage("product_list", total, pageSize, pageCount,
									pageNo);
							showPageDatailproduct(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法
				}
			});
}

function showPageDatailproduct(items) {
	$(items)
			.each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + 
								"<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.category + "</td>"));
						tr.append($("<td>"
								+ (this.description == null ? ""
										:this.description) + "</td>"));
						tr.append($("<td>" + this.name + "</td>"));
						tr.append($("<td>"	+ this.price+"</td>"));
						tr.append($("<td>" + this.status==0?未激活:已激活 + "</td>"));
						tr.append($("<td>" + this.sku+ "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.updateTime + "</td>"));
						$("#product_list").append(tr);
					});
}
