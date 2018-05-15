<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${currentUser==null}">
							<li><a href="${pageContext.request.contextPath}/user/login">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/user/register">注册</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/doc/upload">上传</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img alt="" style="width:21px;height:21px;" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}">
									<span>${currentUser.username}</span><i class="caret"></i>
								</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/user/mine"><i class="icon-user"></i>我的</a></li>
								<li role="reparator" class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/user/logout"><i class="icon-key"></i>退出</a></li>
							</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
</nav>