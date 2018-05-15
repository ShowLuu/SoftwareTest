<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body{padding-top:70px;}
		#login-left img{
			max-width: 100%;
		}
		#login-form{
			background: white;padding: 20px;
		}
	</style>
  </head>
<body>
<%@include file="../../common/nav-top.jsp" %>
		<div class="container" style="width: 100%;">
			<div class="row">
				<div class="col-sm-3" id="login-left">
					<header class="main-header">
					
					</header>
			    <!-- Logo -->
			    <a href="index2.html" class="logo">
			        <!-- mini logo for sidebar mini 50x50 pixels -->
			        <span class="logo-mini"><b>A</b>LT</span>
			        <!-- logo for regular state and mobile devices -->
			        <span class="logo-lg"><b>Admin</b>LTE</span>
			    </a>
			    </div>
		    
				<div class="col-sm-9">
					<form class="bs-example bs-example-form" role="form">
						<div class="input-group">
							<span class="input-group-addon">oldPassword</span>
							<input type="text" class="form-control" placeholder="twitterhandle" style="width:60%;" id="oldPassword">
						</div>
						<br>
						
						<div class="input-group" id="newPasswords">
							<span class="input-group-addon">newPassword</span>
							<input type="text" class="form-control" placeholder="twitterhandle" style="width:60%;" id="newPassword">
						</div>
						<br>
						<div class="input-group text-center">
							<a href="javaScript:void(0)" id="updateBtn" class="btn btn-primary" style="width:100px;" >修改</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	<%@include file="../../common/footer.jsp" %>
	
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#updateBtn").click(function(){
		var oldPassword=$('#oldPassword').val();
		var newPassword=$('#newPassword').val();
		alert(oldPassword+"="+newPassword);
		var flag=true;
		alert(1);
		if(oldPassword==null||oldPassword==""){
			flag=false;
			alert("请输入密码");
		}
		alert(3);
		if(newPassword==null||newPassword==""){
			flag=false;
			alert("请输入新密码");
		}
		if(oldPassword==newPassword){
			flag=false;
			alert("密码相同，不可修改");
		}
		if(flag==true){
			$.ajax({
				url:"${pageContext.request.contextPath}/user/doUpdate",
				type:"post",
				async:true,
				data:{
					oldPassword:$("#oldPassword").val(),
					newPassword:$("#newPassword").val(),
					username:${currentUser.username},
				},
				dataType:"json",
				success:function(data){
					if(data.statusText=="failed"){
						alert(data.message);
						location.reload(); 
					}else{
						alert(data.message);
						location.reload(); 
					}
				}
			});
		}	
	});
	
})
</script>
  </body>
</html>