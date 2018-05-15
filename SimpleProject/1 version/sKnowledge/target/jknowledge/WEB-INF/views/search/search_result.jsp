<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>结果</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body { padding-top: 70px;}
		#pageData{
			min-height:360px;
		}
	</style>
</head>
<body>
<%@include file="../common/nav-top.jsp" %>
	<div class="container">
		<p>
			搜索到<span id="resultTotal"></span>条结果
		</p>
		<div class="row" style="margin-bottom:10px;">
			<div class="col-sm-8">
				<div id="pageData"></div>
				<div id="pageBar"></div>
			</div>
			<div class="col-sm-4">其他内容
				<a href="http://web.tanzhouedu.com/music/music.html#" class="btn btn-info btn-lg" >
		        	<span class="glyphicon glyphicon-headphones" ></span> 
		          	音乐
		        </a>
			</div>
		</div>
	</div>
<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var ctx="${pageContext.request.contextPath}";
	$(function(){
		$("#search-top").show();
		$("#search-btn").click(function(){
			listPage(1);
		});
		listPage(1);
	});
	
	function listPage(pageNo){
		$.ajax({
			url:ctx+"/search/doSearch",
			type:"post",
			async:true,
			data:{keywords:$("#search-keywords").val(),pageNo:pageNo},
			dataType:"json",
			success:function(data){
				if (data) {
					$("#resultTotal").text(data.total);
					pagination.page({
						items : data.items,
						itemsViewContainerId : "#pageData",
						itemsViewFormat : function(item){
							return "<div class='row'> " +
				                       " <div class='col-md-12'>" +
				                            "<a href='" + ctx + "/search/detail/" + item.id + "' target='_blank'><h4>" + item.name + "</h4></a>" +
								            "<p> " +
									            (item.description == null ? '无描述' : item.description) + "<br/>" +
									            "<span style='margin-right:10px;'>" + item.createdTime + "</span>" +
									            (item.user == null ? "" : ("<span style='margin-right:10px;'>" + item.user.username + "</span>")) +
									            "<span class='glyphicon glyphicon-eye-open' aria-hidden='true' style='margin-right:10px;'><span class='badge' style='margin-top:-8px;'>" + item.views +"</span></span>" +
									            "<span class='glyphicon glyphicon-thumbs-up' aria-hidden='true'><span class='badge' style='margin-top:-8px;'>" +item.thumbs +"</span></span>" +
								            "</p>" +
						               " </div>" +
						            "</div>";
						},
						total : data.total,
						pageSize : data.pageSize,
						pageNo : pageNo,
						pageBarContainerId : "#pageBar",
						pageQueryFunName : "listPage"
					}).show();
				}
			}
		});
	}
	
	var pagination = {
			/** 配置 */ 
			page : function(cfg){
				this.config = {
					items : cfg.items, //分页数据
					itemsViewContainerId : cfg.itemsViewContainerId, //分页数据显示区域
					itemsViewFormat : cfg.itemsViewFormat, //数据显示格式
					total : cfg.total, //总记录数
					pageSize : cfg.pageSize, //每页数据大小
					pageNo : cfg.pageNo, //当前页码
					pageBarContainerId : cfg.pageBarContainerId, //分页导航条显示区域
					pageQueryFunName : cfg.pageQueryFunName //分页数据查询函数名称
				};
				return this;
			},
			
			/** 显示分页数据 */ 
			show:function(){
				this.clear();
				//数据区域
			    var $itemsViewContainer = $(this.config.itemsViewContainerId);
			    
			    //没有数据
			    if(!this.config.items || this.config.items.length <= 0){
			    	return;
			    }
			    
			    //显示下一页数据
			    var itemsViewFormat = this.config.itemsViewFormat;
			    this.config.items.forEach(function(item, index) {
			        var content =  itemsViewFormat(item);
			        $itemsViewContainer.append($(content));
			    });
			    this.showPageBar();
			},
			
			/** 显示分页导航条 */ 
			showPageBar:function(){
				//总页数
				var pageCount = parseInt((this.config.total - 1) / this.config.pageSize) + 1;
				//当前页码
				var pageNo = this.config.pageNo > pageCount ? pageCount : this.config.pageNo;
				//上一页页码
				var prevPageNo = pageNo - 1 <= 0 ? 1 : pageNo - 1;
				//下一页页码
				var nextPageNo = pageNo + 1 >= pageCount ? pageCount : pageNo + 1;
				
				//分页导航条中最多可以显示的页码数（奇数，以使当前页码左右两则的页码数相同）
				var pages = 9;
				//分页导航条中当前页码左则页码数
				var leftOfPageNo = parseInt(pages / 2);
				//分页导航条中当前页码右则页码数（减1，以使当前页码左右两则的页码数相同）
				var rightOfPageNo = pages - leftOfPageNo - 1;
				//每次查询后分页导航条中起始页码
				var beginPageNo = pageNo - leftOfPageNo;
				//每次查询后分页导航条中结束页码
				var endPageNo = pageNo + rightOfPageNo;
				
				if(pageCount <= pages){
					//总页数小于分页导航条中可显示的页码数时
					beginPageNo = 1;
					endPageNo = pageCount;
				}else{ 
					//总页数大于分页导航条中可显示的页码数时
					if(beginPageNo <= 0 ){
						//起始页码小于零，从1开始
						beginPageNo = 1;
					}
					 
					if(endPageNo > pageCount){
						//结束页码不能大于总页数，
						endPageNo = pageCount;
					}
				}
				
				//分页导航条
				var pageBar = $("<ul class='pagination pagination-lg'></ul>");
				
				//上一页按钮
				var prevPageBtn = $("<li class='disabled'><span class='glyphicon glyphicon-menu-left' aria-hidden='true'></span></li>");
				//如果还有上一页
				if(pageNo - 1 > 0){				
					prevPageBtn = $("<li><a href='javascript:listPage(" + prevPageNo + ")' aria-label='Previous'><span class='glyphicon glyphicon-menu-left' aria-hidden='true'></span></a></li>");
				}
				pageBar.append(prevPageBtn);
				
				//中间页按钮
				for(var index = beginPageNo;index <= endPageNo; index++){
					//active,高亮显示当前页
					var active = index == pageNo ? "active" : "";
					pageBar.append($("<li class='" + active + "'><a href='javascript:" + this.config.pageQueryFunName + "(" + index + ")' >" + index + "</a></li>"));
				}
				
				//下一页按钮
				var nextPageBtn = $("<li class='disabled'><span class='glyphicon glyphicon-menu-right' aria-hidden='true'></span></li>");
				//如果还有下一页
				if(pageNo + 1 <= pageCount){
					nextPageBtn = $("<li><a href='javascript:listPage(" + nextPageNo + ")' aria-label='Next'><span class='glyphicon glyphicon-menu-right' aria-hidden='true'></span></a></li>");
				}
				pageBar.append(nextPageBtn);
				
				//显示分页导航条
				var pageBarContainer = $(this.config.pageBarContainerId);
				pageBarContainer.append(pageBar);
				 
			},
			
			clear : function(){
				//清除数据
				 $(this.config.itemsViewContainerId).html("");
				 //清除分页导航信息
				 $(this.config.pageBarContainerId).html("");
			}
	}
</script>
</body>
</html>