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
				<a class="navbar-brand" href="#">我的空间</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${currentUser!=null}">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img alt="" style="width:21px;height:21px;" src="${pageContext.request.contextPath}/assets/img/user_head/img-f19b0e225f3f05a0e3c7bd1e3ea3ba7f.jpg">
									<span>${currentUser.username}</span><i class="caret"></i>
								</a>
								<ul class="dropdown-menu">
									<li role="reparator" class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/user/logout"><i class="icon-key"></i>退出</a></li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
</nav>