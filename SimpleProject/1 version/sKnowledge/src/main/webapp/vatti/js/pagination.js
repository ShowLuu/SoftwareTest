$(function(){
	initChecker();
});

/**
 * tableId : 列表ID;
 * total : 总记录数;
 * pageSize : 每页显示的记录数;
 * pageCount : 总页数;
 * pageNo : 当前页页码
 * 
 * 
 **/
function listByPage(tableId,total,pageSize,pageCount,pageNo){
	createPaginationLength(tableId);
	createPaginationInfo(tableId,total,pageSize,pageCount,pageNo);
}

function getListByPage(pageNo){
	alert("请实现getListByPage方法");
}

function createPaginationInfo(tableId,total,pageSize,pageCount,pageNo){
	$("#" + tableId + " tbody").html("");
	$(".pagination-info").remove();
	
	var paginationInfo = $("<div class='pagination-info'></div>");
	var paginationInfoSummary = $("<div class='pagination-info-summary'>" + total + "条记录,共"+ pageCount +"页</div>");
	var paginationInfoAction = $("<div class='pagination-info-action'>");
	
	//上一页页码
	var prevPageNo = pageNo - 1 <= 0 ? 1 : pageNo - 1;
	//下一页页码
	var nextPageNo = pageNo + 1 >= pageCount ? pageCount : pageNo + 1;
	//上一页样式
	var pagePrev = $("<span class='page-prev'>上一页</span>");
	//下一页样式
	var pageNext = $("<span class='page-next'>下一页</span>");
	//首页
	var pageFirst = $("<span class='page-first'>首页</span>");
	//尾页
	var pageLast = $("<span class='page-last'>尾页</span>");
	
	if(pageNo - 1 > 0){
		pageFirst = $("<a href='javascript:getListByPage(1);'><span class='page-first'>首页</span><a>");
		pagePrev = $("<a href='javascript:getListByPage(" + prevPageNo + ");'><span class='page-prev'>上一页</span><a>");
	}
	
	if(pageNo + 1 <= pageCount){
		pageNext = $("<a href='javascript:getListByPage(" + nextPageNo + ");'><span class='page-next'>下一页</span><a>");
		pageLast = $("<a href='javascript:getListByPage(" + pageCount + ");'><span class='page-last'>尾页</span><a>");
	}
	
	paginationInfo.append(paginationInfoSummary);
	paginationInfo.append(paginationInfoAction);
	paginationInfoAction.append(pageFirst);
	paginationInfoAction.append(pagePrev);
	
	//当前页码
	pageNo = pageNo > pageCount ? pageCount : pageNo;
	//最多可同时显示的页码数
	var limit = 9;
	//当前页左侧侧最多可同时显示的页码数
	var left = parseInt(limit / 2);
	//当前页右侧最多同时显示页码数
	var right = limit - left - 1;
	//开始页码
	var startPageNo = 1;
    //末尾页码
	var endPageNo = 10;
	
	if(pageCount <= limit){
		startPageNo = 1;
		endPageNo = pageCount;
	}else{
		//开始页码(根据当前页码缩减left页)
		startPageNo = pageNo - left <= 0 ? 1 : pageNo - left;
		//末尾页码(根据当前页码增加right页)
		endPageNo =  pageNo + right > pageCount ? pageCount : pageNo + right;
	} 
	
	for(var num = startPageNo;num <= endPageNo; num++){
		//高亮显示当前页
		var active = num == pageNo ? "active" : "";
		paginationInfoAction.append($("<a href='javascript:getListByPage(" + num + ");'><span class='page-num " + active + "'>" + num + "</span></a>"));
	}
	paginationInfoAction.append(pageNext);
	paginationInfoAction.append(pageLast);
	
	paginationInfo.insertAfter($("#" + tableId));
}

/**
 * 每页显示记录数
 * */
function createPaginationLength(tableId){
   lengthId = tableId + "-pagination-length-option";
   //如果存在就不创建
   if($("#" + lengthId)[0]){
	   return;
   }
   
   //jQuery对象
   var pageLength = $("<div class='pagination-length'></div>");
   var pageSelect = $("<select id='" + lengthId + "'>" +
   		"<option value='10'>10</option>" +
   		"<option value='20'>20</option>" +
   		"<option value='30'>30</option>" +
   		"<option value='50'>50</option>" +
   		"</select>");
   
   //change事件
   pageSelect.change(function(){
	   getListByPage(1);
   });
   
   pageLength.append(pageSelect);
   //加到列表前面
   pageLength.insertBefore($("#" + tableId));
}

/**
 * 获取页面显示记录数
 **/
function getPageSize(tableId){
	var pageSize = $("#" + tableId + "-pagination-length-option").val();
	return pageSize == null ? 10 : pageSize;
}

function initChecker(){
	$(".checker .group-checkable").live("click",function(){
		if($(this).prop("checked")){
			$(".checker .checkboxes").parent().addClass("checked");
		}else{
			$(".checker .checkboxes").parent().removeClass("checked");
		}
	});
	
	$(".checker .checkboxes").live("click",function(){
		if($(this).prop("checked")){
			$(this).parent().addClass("checked");
		}else{
			$(this).parent().removeClass("checked");
		}
	});
}

