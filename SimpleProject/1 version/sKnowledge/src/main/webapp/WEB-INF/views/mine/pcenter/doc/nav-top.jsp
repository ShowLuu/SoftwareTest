<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius: 0px;">
		<div class="container-fluid"> 
			<form id="search-top" class=" " role="search" style="display: none;">
			
				<div class="" style="width: 30%;margin-top: 10px" >
				
					<div class="input-group">
						<input id="search-keywords" type="text" class="form-control" placeholder="" value="${param.keywords}"/>
						<span class="input-group-btn">
							<button id="search-btn" type="button" class="btn btn-primary">
							搜索  <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>
							</button>
						</span>
					</div>
					<%-- <input id="search-keywords" type="text" class="" placeholder="" value="${param.keywords}"/>
					<button id="search-btn" type="button" class="btn btn-sm btn-primary">
					搜索  <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>
					</button>	 --%>	
				</div>	
			</form>
		</div>
</nav>