<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
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
<%@include file="../common/nav-top.jsp" %>
		<div class="container" style="width: 100%;">
			<div class="row">
				<div class="col-sm-7" id="login-left">
					<img src="${pageContext.request.contextPath}/assets/img/study.jpg">
				</div>
				<div class="col-sm-5">
					<form id="login-form" class="form-horizontal">
						<div class="form-group" >
							<label for="username" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10" id="usernameAlert">
								<input type="text" id="username" name="username" class="form-control" maxlength="100"/>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10"  id="passwordAlert">
								<input type="password" id="password" name="password" class="form-control"/>
							</div>
						</div>
						<div class="form-group" >
							<label for="verificationCode" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-5" id="verificationCodeAlert">
								<input id="verificationCode" name="verificationCode" class="form-control"/>
							</div>
							<div class="col-sm-5">
								<img alt="验证码" id="verificationCodeImg" src="">
								<a href="javaScript:void(0);" id="changeVerificationCodeBtn">换一张</a>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-5">
								<a href="javaScript:void(0)" id="loginBtn" class="btn btn-primary btn-sm active" style="width:50%">登录</a>
							</div>
							<div class="col-sm-5">
								<a href="javaScript:void(0)" id="registerBtn" onclick="doRegisterBtn();" class="btn btn-primary btn-sm active" style="width:50%">注冊</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		var username=$('#username').val();
		var password=$('#password').val();
		var verificationCode=$('#verificationCode').val();
		$('#name').remove();
		$('#pwd').remove();
		$('#code').remove();
		var checkCH;
		var checkChar;
		var userStr="";
		var uf=0;
		var pf=0;
		var flag=true;
		if(username==null||username==""){
			var parent = document.getElementById("usernameAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-success\" id=\"name\" style=\"width:462px;height:36px;padding-top:10px\">请输入账号</div>";
			parent.appendChild(div);
			flag=false;
			uf=-1;
		}else{
			checkCH=new RegExp("[\\u4E00-\\u9FFF]+","g");
			if(checkCH.test(username)){
				userStr+="账号不能包含汉字";
				uf++;
			}
			checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(username)){
				if(uf==0){
					userStr+="不能输入特殊字符";
				}else{
					userStr+=",且不能输入特殊字符";
				}
				uf++;
			}
		}
		if(uf>0){
			var parent = document.getElementById("usernameAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-success\" id=\"name\" style=\"width:462px;height:36px;padding-top:10px\">"+userStr+"</div>";
			parent.appendChild(div);
			flag=false;
		}
		
		if(password==null||password==""){
			var parent = document.getElementById("passwordAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-info\" id=\"pwd\" style=\"width:462px;height:36px;padding-top:10px\">请输入密码</div>";
			parent.appendChild(div);
			flag=false;
		}
		if(verificationCode==null||verificationCode==""){
			var parent = document.getElementById("verificationCodeAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-danger\" id=\"code\" style=\"width:462px;height:36px;padding-top:10px\">请输入验证码</div>";
			parent.appendChild(div);
			flag=false;
		}
		if(flag==true){
			$.ajax({
				url:"${pageContext.request.contextPath}/user/doLogin",
				type:"post",
				async:false,
				data:{
					username:$("#username").val(),
					password:$("#password").val(),
					verificationCode:$("#verificationCode").val(),
				},
				dataType:"json",
				success:function(data){
					if(data.statusText=="failed"){
						alert(data.message);
						location.reload(); 
					}else{
						window.location="${pageContext.request.contextPath}/mine/mine";
					}
				}
			});
		}
	});
	
	var verificationCodeUrl="${pageContext.request.contextPath}/verificationCode";
	$("#verificationCodeImg").attr("src",verificationCodeUrl);
	$("#changeVerificationCodeBtn").click(function(){
		$("#verificationCodeImg").attr("src",verificationCodeUrl+"?v="+Math.random());
	});
})

function doRegisterBtn(){
	window.location="${pageContext.request.contextPath}/user/register";
}
</script>
  </body>
</html>