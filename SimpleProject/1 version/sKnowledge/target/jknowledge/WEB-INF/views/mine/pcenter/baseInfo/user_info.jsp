<%@page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/ctx.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/common/head.jsp" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/select2_metro.css"/>
<link rel="stylesheet" href="${ctxCss}/DT_bootstrap.css"/>
</head>
<body class="page-header-fixed">
	 <%@ include file="/WEB-INF/views/common/title.jsp" %>
	<div class="page-container row-fluid">
		<div class="page-sidebar nav-collapse collapse">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				<li class="start active">
					<a href="javascript:;">
					<i class="icon-th-large"></i> 
					<span class="title">个人中心</span>
					<span class="selected"></span>
					<span class="arrow open"></span>
					</a>
					<ul class="sub-menu">
						<input id="checkInfo" name="checkInfo" type="hidden" value="${currentUser.username}" />
						<li>
							<a href="#" onclick="checkInfo(1);">基本信息</a>
						</li>
						<li >
							<a href="#" onclick="checkInfo(2);">我的文件</a>
						</li>
					</ul>
				</li>
				
				<%@ include file="/WEB-INF/views/common/manage/application-manage.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/game-center.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/system-manage.jsp" %>
			</ul>
		</div>
		<div class="page-content">
			<%-- <%@ include file="/view/comm/portlet-config.jsp" %> --%>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title"></h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> 
								<a>Home</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a>个人中心</a>
								 <i class="icon-angle-right"></i>
							</li>
							<li><a>基本信息</a> 
								<i class="icon-angle-right"></i>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="portlet box light-grey">
							<div class="portlet-body">
								<div style="margin-bottom:10px;">
			<%-- <iframe src="${pageContext.request.contextPath}/user/update" style="width:75%;height:500px;margin-left: 50px"></iframe> --%>
				 <%@ include file="/WEB-INF/views/mine/pcenter/baseInfo/user_update.jsp" %>
					<%-- <a href="#">
						<img class="media-object" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}" height="100px;" width="100px;">
					</a>
				<div class="media-body media-middle">
					<h4>${currentUser.username}</h4>
				</div> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ include file="/WEB-INF/views/common/scripts.jsp" %>	
<script type="text/javascript" src="${ctxJS}/select2.min.js"></script>
<script type="text/javascript" src="${ctxJS}/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctxJS}/DT_bootstrap.js"></script>
<script src="${ctxJS}/app.js"></script>
<script src="${ctxJS}/table-managed.js"></script> 
<script type="text/javascript">
function checkInfo(op){
	var username=document.getElementById("check").value;
	if(username==""){
		alert("请先登录");
		return;
	}
	var src="";
	if(op==1){
		src="${pageContext.request.contextPath}/user/mine/pcenter/baseInfo/user_info";
	}else if(op==2){
		src="${pageContext.request.contextPath}/mine/pcenter/doc/doc_info";
	}
	window.location=src;
}
</script>
</body>
</html>