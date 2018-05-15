<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" style="font-weight:bold;" href="${pageContext.request.contextPath}/index">sKnowledge</a>	
			<ul class="nav pull-right">
					<c:choose>
						<c:when test="${currentUser==null}">
							<li><a href="${pageContext.request.contextPath}/user/login">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/user/register">注册</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/doc/upload">上传</a></li>
							<li class="dropdown user">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img alt="" style="width:21px;height:21px;" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}">
									<span>${currentUser.username}</span><i class="caret"></i>
								</a>
							<ul class="dropdown-menu">
								<li><a id="newTitle" href="${pageContext.request.contextPath}/user/user-manage"><i class="icon-user"></i>我的</a></li>
								<li><a href="${pageContext.request.contextPath}/user/logout"><i class="icon-key"></i>退出</a></li>
							</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
		</div>
	</div>	
</div>