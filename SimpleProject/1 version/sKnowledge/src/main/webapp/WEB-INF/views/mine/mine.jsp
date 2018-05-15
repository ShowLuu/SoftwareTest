<%@page language="java" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/common/ctx.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/common/head.jsp" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/select2_metro.css"/>
<link rel="stylesheet" href="${ctxCss}/DT_bootstrap.css"/>
</head>
<body class="page-header-fixed" class="login">
	<%@include file="/WEB-INF/views/common/title.jsp" %>
	<div class="page-container row-fluid">
		<div class="page-sidebar nav-collapse collapse">
			<ul class="page-sidebar-menu">
				<li><div class="sidebar-toggler hidden-phone"></div></li>
				<%@ include file="/WEB-INF/views/common/manage/user-manage.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/application-manage.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/game-center.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/system-manage.jsp" %>
			</ul>
		</div>
		<div class="page-content">
			<img alt="" style="width:800px;height:800px;" src="${pageContext.request.contextPath}/vatti/image/index/3.jpg">
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ include file="/WEB-INF/views/common/scripts.jsp" %>
<script type="text/javascript" src="${ctxJS}/select2.min.js"></script>
<script type="text/javascript" src="${ctxJS}/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctxJS}/DT_bootstrap.js"></script>
<script src="${ctxJS}/app.js"></script>
<script src="${ctxJS}/table-managed.js"></script> 
<script>
	jQuery(document).ready(function() {       
	   TableManaged.init();
	});
</script>
</body>
</html>