$(function() {
	$("#user-mgr").addClass("active");
	//没按查询之前显示第一页的页面
	getListByPage(1);
	//查询用户
	searchUsers();
	//初始化角色
	getAllRoles();
	//初始化组织
	showAllOrgs("user-orgs");
	//门店自动补全
	storeAutocomplete();
	//跳转到新增页面
	toAddUser();
	//用户的删除
	deleteUsers();
	//跳转到用户导入界面
	toImportUserPage();
	//form表单提交下载人员查询文件
	download();
	//通过Ajax提交数据
//	getListuserdownload();
});

//查询用户
function searchUsers(){
	$("#searchUsers").click(function(){
		getListByPage(1);
	});
}
function getListByPage(pageNo) {
	$.ajax({
				url :ctx+"/user/getListByPage.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用; false:同步调用
				data : { // 请求参数
					"account" : $("[name='account']").val(),
					"name" : $("[name='name']").val(),
					"roleId" : $("[name='roleId']").val(),
					"storeId" : $("[name='storeId']").val(),
					"organizationId" : $("[name='organizationId']").val(),
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
						tr.append($("<td>" + this.account + "</td>"));
						tr.append($("<td>" + this.name + "</td>"));
						tr.append($("<td>"
								+ (this.contactPhone == null ? ""
										: this.contactPhone) + "</td>"));
						tr.append($("<td>" + this.organizationPath + "</td>"));
						tr.append($("<td><span class='text-ellipsis' style='max-width:100px;'>"
										+ (this.storeName == null ? ""
												: this.storeName)
										+ "</span></td>"));
						tr.append($("<td>" + this.roleName + "</td>"));
						tr.append($("<td>"
								+ (this.openId == null ? "未绑定" : "已绑定")
								+ "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.updateTime + "</td>"));
						tr.append($("<td><button class='btn green' onclick='toUpdate(\""+this.id+"\",\""+this.account+"\",\""+this.name+"\",\""+this.contactPhone+"\",\""+this.organizationPath+"\",\""+this.storeName+"\",\""+this.roleName+"\",\""+this.openId+"\")'>修改<i class='icon-edit'></i></button></td>"));
						$("#user-list").append(tr);
					});
}

function toUpdate(id,account,name,contactPhone,organizationPath,storeName,roleName,openId){
	$("#userId").val(id);
	$("#userUpdateForm").submit();
}

function getAllRoles() { 
	$.ajax({
		url : ctx + "/role/getAllList.do", // 请求地址
		type : "post", // 以POST方式提交
		async : true, // true:异步调用; false:同步调用
		dataType : 'json', // 返回值类型
		success : function(data, status) { // 请求成功回调success方法
			if (data) {//如果data==true
				if (data.statusText == "success") {
					var roles = data.data;
					var userRolesList = $("#user-roles");
					userRolesList
							.append($("<option value=''>请选择角色</option>"));
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

function toAddUser(){
	$("#addUserBtn").click(function(){
		window.location.href = ctx + "/user/add.do";
	});
}

function deleteUsers(){
	$("#deleteUserBtn").click(function(){
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
				url:ctx+"/user/delete.do",//请求地址
				type:"post",
				async:true,
				data:{
					userIds:checkedIds
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

//跳转到用户导入页面
function toImportUserPage(){
	$("#importUserBtn").click(function(){
		window.location.href = ctx + "/user/import.do";
	});
}

//同步下载查询文件form表单提交
function download(){
	$("#downloadUserBtn").click(function(){
		var url = ctx + "/user/exportUser.do";
		$("#userDataForm").attr("action",url);
		$("#userDataForm").submit();
		$("#userDataForm").attr("action","");
//		getListuserdownload();
	});
}

//异步下载人员查询文件
function getListuserdownload() {
	$.ajax({
				url : ctx + "/user/exportUser.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用; false:同步调用
				data : { // 请求参数
					"account" : $("[name='account']").val(),
					"name" : $("[name='name']").val(),
					"roleId" : $("[name='roleId']").val(),
					"storeId" : $("[name='storeId']").val(),
					"organizationId" : $("[name='organizationId']").val(),
				},
				dataType : 'json', // 返回值类型
				beforeSend : function(req) { // 请求前回调beforeSend方法

				},
				success : function(data, status) { // 请求成功回调success方法
					if (data) {
						if (data.statusText == "success") {
							//var pageInfo = data.data;
							//var items = pageInfo.items;
							alert("下载成功")
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法
				
				}
			});
}
