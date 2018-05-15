$(function() {
	$("#user-mgr").addClass("active");
	//组织机构新增
	toaddOrgPage();
	//组织机构删除
	deleteOrgs();
	//组织机构查询
	searchOrg();
	//显示第一页
	getListByPage(1);
	//显示组织
	showAllOrgs();
});

//查询组织机构管理
function searchOrg(){
	$("#searchOrg").click(function(){
		getListByPage(1);
	});
}

//跳转到组织新增页面
function toaddOrgPage(){
	$("#addOrgBtn").click(function(){
		window.location.href = ctx + "/org/add.do";
	});
}

function getListByPage(pageNo) {
	$.ajax({
				url : ctx+"/org/getListByLikeOrg.do", // 请求地址
				type : "post", // 以POST方式提交
				async : true, // true:异步调用;false:同步调用
				// timeout:10000,
				data : { // 请求参数
					"id" :$("[name='organizationId']").val(),
					"pageSize" : getPageSize("org_list"),
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
							listByPage("org_list", total, pageSize, pageCount,
									pageNo);
							showPageDatailOrg(items);
						}
					}
				},
				error : function(req, status, error) { // 请求失败回调error方法

				}
			});
}
function showPageDatailOrg(items) {
	$(items)
			.each(
					function() {
						var tr = $("<tr class='odd gradeX'></tr>");
						tr.append($("<td><div class='checker' ><span>" + 
								"<input type='checkbox' class='checkboxes' value='" + this.id + "' /></span></div></td>"));
						tr.append($("<td>" + this.code + "</td>"));
						tr.append($("<td>" + this.fullPath + "</td>"));
						tr.append($("<td>" + this.name + "</td>"));
						tr.append($("<td>" + this.createTime + "</td>"));
						tr.append($("<td>" + this.rank + "</td>"));
						tr.append($("<td>" + this.parentId + "</td>"));
						$("#org_list").append(tr);
					});
}

function deleteOrgs(){
	$("#deleteOrgBtn").click(function(){
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
				url:ctx+"/org/delete.do",//请求地址
				type:"post",
				async:true,
				data:{
					orgIds:checkedIds
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
					var userRolesList = $("#user-orgs");
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