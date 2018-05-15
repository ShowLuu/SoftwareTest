<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<title>首页 - SKnowledge</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body { padding-top: 10px; }
			.head .search .btn{width:70px;height:10px;background:#0f9add;color:#fff;border:none;outline:none;font-size:16px;float:right;border-radius:4px;transition:0.3s;}
			.head .search .btn:hover{transform:rotate(360deg);transition:0.3s;}
			
			.map{height:96vh;background:#ccc;width:100%;}
	</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius: 0px;">
		<div class="container-fluid"> 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false" >
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index">SKnowledge</a>
			</div>
			<form id="search-top" class="navbar-form navbar-left" role="search" style="display: none;">
				<div class="form-group">
					<input id="search-keywords" type="text" class="form-control" placeholder="" value="${param.keywords}"/>
				</div>	
				<button id="search-btn" type="button" class="btn btn-default">搜索</button>		
			</form>
			<div class="head">
		</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<div class="h-center">
				<div class="search">
					<span style="font-size:18px;font-weight:700;color:#fff;">出发地 :</span><input type="text" class="txt" id="start">
					<span style="font-size:18px;font-weight:700;color:#fff;">目的地 :</span><input type="text" class="txt" id="end">
					<input type="button" value="搜索" class="btn" onclick="tz_search(this)" >
				</div>
			</div>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${currentUser==null}">
							<li><a href="${pageContext.request.contextPath}/user/login">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/user/register">注册</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/doc/upload">上传</a></li>
							<li><a href="${pageContext.request.contextPath}/index"><i class="icon-key"></i>退出</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img alt="" style="width:21px;height:21px;" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}">
									<span>${currentUser.username}</span><i class="caret"></i>
								</a>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
</nav>
		
		<div class="map" id="mapContainer"></div>
		<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.4&key=61d4ac972f4ad3ad6585378da69e2854&plugin=AMap.Driving"></script>
		<script>
			
			var map=new AMap.Map("mapContainer",{
				zoom:10,
				center:[112.93696,28.223134]
			});
			
			var driving=new AMap.Driving({
				map:map
			})
			
			function tz_search(){
				var start=document.getElementById("start").value;
				var end=document.getElementById("end").value;
				driving.search([
					{keyword:start},
					{keyword:end}
				])
			}
			
		</script>	
	</body>

</html>