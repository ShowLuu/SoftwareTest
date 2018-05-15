$(function() {
	$("#user-mgr").addClass("active");
	//查询门店
	searchStore();
	//门店自动补全
	storeAutocomplete();
	//门店导入
	toImportStorePage();
	//门店新增
	toaddStorePage();
	//门店修改
	toupdateStorePage();
	//刪除门店
	deleteStores();
	//显示第一页
	getListByPage(1);
});

/**
 * 查询门店
 */
function searchStore(){
	$("#searchStore").click(function(){
		getListByPage(1);
	});
}
function getListByPage(pageNo) {
	$.ajax({
				url : ctx+"/store/getListByLikeStore.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用;false:同步调用
				// timeout:10000,
				data : { // 请求参数
					"code" :$("[name='code']").val(),
					"contactPhone" :$("[name='phone']").val(),
					"pageSize" : getPageSize("user_list"),
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
							listByPage("user_list", total, pageSize, pageCount,
									pageNo);
							showPageDatailStore(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法

				}
			});
}
function showPageDatailStore(items) {
	$(items)
			.each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + 
								"<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.code + "</td>"));
						tr.append($("<td>" + this.name + "</td>"));
						tr.append($("<td>" + this.contactPhone + "</td>"));
						tr.append($("<td>"
								+ (this.description == null ? ""
										:this.description) + "</td>"));
						tr.append($("<td>" + this.organizationPath + "</td>"));
						tr.append($("<td>" + this.state + "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.updateTime + "</td>"));
						tr.append($("<button class='btn green' onclick='toUpdate(\""+this.id+"\",\""+this.account+"\",\""+this.name+"\",\""+this.contactPhone+"\",\""+this.organizationPath+"\",\""+this.storeName+"\",\""+this.roleName+"\",\""+this.openId+"\")'>修改<i class='icon-edit'></i></button>"));
						$("#user_list").append(tr);
					});
}

function toUpdate(id,account,name,contactPhone,organizationPath,storeName,roleName,openId){
	$("#storeId").val(id);
	$("#storeUpdateForm").submit();
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

//跳转到门店导入页面
function toImportStorePage(){
	$("#importStoreBtn").click(function(){
		window.location.href = ctx + "/store/import.do";
	});
}

//跳转到门店修改页面
function toupdateStorePage(){
	$("#updateStoreBtn").click(function(){
		window.location.href = ctx + "/store/update.do";
	});
}

//跳转到门店新增页面
function toaddStorePage(){
	$("#addStoreBtn").click(function(){
		window.location.href = ctx + "/store/add.do";
	});
}

function deleteStores(){
	$("#deleteStoreBtn").click(function(){
		var checkboxList=$(".checker .checked .checkboxes");
		var checkedIds="";
		if(checkboxList&&checkboxList.length>0){
			var checkedIds="";
			checkboxList.each(function(){
				checkedIds=checkedIds+$(this).val()+",";
			});
		}else{
			alert("请选择需要删除的！");
			return;
		}
		if(confirm("是否确定删除？")){
			$.ajax({
				url:ctx+"/store/delete.do",//请求地址
				type:"post",
				async:true,
				data:{
					storeIds:checkedIds
				},
				dataType:"json",
				success:function(data,status){
						if(data){
							if(data.statusText=="success"){
								getListByPage(1);
							}
							alert(data.message);
					}
				},
				error:function(req,status,error){
				}
			})
		}
	});
}




