<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" style="font-weight:bold;" href="#">我的空间</a>	
			<ul class="nav pull-right">
					<c:choose>
						<c:when test="${currentUser!=null}">
							<li class="dropdown user">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img alt="" style="width:21px;height:21px;" src="${pageContext.request.contextPath}/assets/img/user_head/img-f19b0e225f3f05a0e3c7bd1e3ea3ba7f.jpg">
									<span>${currentUser.username}</span><i class="caret"></i>
								</a>
							<ul class="dropdown-menu">
								<li><a id="newTitle" href="#"><i class="icon-user"></i>我的</a></li>
								<li><a href="${pageContext.request.contextPath}/user/logout"><i class="icon-key"></i>退出</a></li>
							</ul>
							</li>
						</c:when>
					</c:choose>
				</ul>
		</div>
	</div>	
</div>