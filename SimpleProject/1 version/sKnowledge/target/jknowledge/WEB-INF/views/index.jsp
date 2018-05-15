<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<title>首页 - SKnowledge</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body { padding-top: 20px; }
	</style>
</head>
<body>
<%@include file="common/nav-top.jsp" %>
<div class="container">
	<div class="jumbotron" style="padding:100px 0px; background-color:white;">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<p><h3 class="text-center">SKnowledge</h3></p>
				<form action="${pageContext.request.contextPath}/search/index" method="post">
					<div class="input-group">
						<input id="search-keywords" name="keywords" type="text" class="form-control" placeholder="">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">搜索</button>	
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	 
});
</script>
</body>
</html>
