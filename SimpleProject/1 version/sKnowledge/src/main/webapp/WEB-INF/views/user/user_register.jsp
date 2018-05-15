<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<title>注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/fileinput.min.css" rel="stylesheet">
	<style type="text/css">
		body { padding-top: 70px;}
	</style>
</head> 

<body>
<%@include file="../common/nav-top.jsp" %>
	<div class="container" style="margin-bottom: 10px">
		<div class="row">
			<div style="text-align: center;">
				<div class="pagr-header">
					<h2>注册</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<form role="form">
						<div class="form-group" id="usernameAlert">
							<label for="username" class="control-label" >账号(6~11字符)</label>
							<input type="text" id="username" name="username" class=" form-control" maxlength="100">
						</div>
						<div class="form-group" id="passwordAlert">
							<label for="password" class="control-label">密码(6~16字符)</label>
							<input type="password" id="password" name="password" class=" form-control">
						</div> 
						<div class="form-group" id="confirmPasswordAlert">
							<label for="confirmPassword" class="control-label">确认密码</label>
							<input type="password" id="confirmPassword" name="confirmPassword" class=" form-control">
						</div>
						<div class="form-group" id="verificationCodeAlert">
							<label for="verificationCode" class=" control-label">验证码</label>
							<img alt="验证码" id="verificationCodeImg" src="">
							<a href="javaScript:void(0);" id="changeVerificationCodeBtn">换一张</a>
							<input id="verificationCode" name="verificationCode" class=" form-control" />
						</div>
					</form>
				</div>
			</div>
			<div class="row" style="margin-top:20px;">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-5">
					<a id="registerBtn" onclick="doRegister();" class="btn btn-primary btn-sm active" style="width:50%;">注册</a>
				</div>
				<div class="col-sm-5">
					<a href="${pageContext.request.contextPath}/user/user_login" id="return" class="btn btn-primary btn-sm active" style="width:50%">返回</a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function doRegister(){
		var username=$('#username').val();
		var password=$('#password').val();
		var confirmPassword=$('#confirmPassword').val();
		var verificationCode=$('#verificationCode').val();
		$('#name').remove();
		$('#pwd').remove();
		$('#pwds').remove();
		$('#code').remove();
		var checkCH;
		var checkChar;
		var userStr="";
		var pwdStr="";
		var uf=0;
		var pf=0;
		var flag=true;
		if(username==null||username==""){
			var parent = document.getElementById("usernameAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-success\" id=\"name\" style=\"width:772px;height:40px;padding-top:10px\">请输入账号</div>";
			parent.appendChild(div);
			uf=-1;
			flag=false;
		}else{
			checkCH=new RegExp("[\\u4E00-\\u9FFF]+","g");
			if(checkCH.test(username)){
				userStr+="账号不能包含汉字";
				uf++;
			}
			checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(username)){
				if(uf==0){
					userStr+="账号不能包含特殊字符";
				}else{
					userStr+=",不能包含特殊字符";
				}
				uf++;
			}
			var len=username.length;
			if(len<6||len>11){
				if(uf==0){
					userStr+="账号长度不在6~11之间";
				}else{
					userStr+=",且长度不在6~11之间";
				}
				uf++;
			}
		}
		
		if(uf>0){
			var parent = document.getElementById("usernameAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-success\" id=\"name\" style=\"width:772px;height:40px;padding-top:10px\">"+userStr+"</div>";
			parent.appendChild(div);
			flag=false;
		}
		
		if(password==null||password==""){
			var parent = document.getElementById("passwordAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-info\" id=\"pwd\" style=\"width:772px;height:40px;padding-top:10px\">请输入密码</div>";
			parent.appendChild(div);
			flag=false;
			pf=-1;
		}else{
			checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(password)){
				if(pf==0){
					pwdStr+="密码不能包含特殊字符";
				}
				pf++;
			}
			var len=password.length;
			if(len<6||len>16){
				if(pf==0){
					pwdStr+="密码长度不在6~16之间";
				}else{
					pwdStr+=",且长度不在6~16之间";
				}
				pf++;
			}
		}
		if(pf>0){
			var parent = document.getElementById("passwordAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-info\" id=\"pwd\" style=\"width:772px;height:40px;padding-top:10px\">"+pwdStr+"</div>";
			parent.appendChild(div);
			flag=false;
		}
		if(password!=confirmPassword){
			var parent = document.getElementById("confirmPasswordAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-warning\" id=\"pwds\" style=\"width:772px;height:40px;padding-top:10px\">密码不一致，请重新输入</div>";
			parent.appendChild(div);
			flag=false;
		}
		if(verificationCode==null||verificationCode==""){
			var parent = document.getElementById("verificationCodeAlert");
			var div = document.createElement("div");
			div.innerHTML = "<div class=\"alert alert-danger\" id=\"code\" style=\"width:772px;height:40px;padding-top:10px\">请输入验证码</div>";
			parent.appendChild(div);
			flag=false;
		}
		if(flag==false){
			return;
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/user/doRegister",
				sync:false,
				type:"post",
				data:{
					username:username,
					password:password,
					verificationCode:verificationCode,
				},
				dataType:"json",
				success:function(data){
					if(data.statusText=="failed"){
						alert(data.message);
						location.reload(); 
					}else{
						alert(data.message);
						window.location="${pageContext.request.contextPath}/user/user_login";
					}
				}
			});
		}
	}

$(function(){
	var verificationCodeUrl="${pageContext.request.contextPath}/verificationCode";
	$("#verificationCodeImg").attr("src",verificationCodeUrl);
	$("#changeVerificationCodeBtn").click(function(){
		$("#verificationCodeImg").attr("src",verificationCodeUrl+"?v="+Math.random());
	});
});
	
</script>
</body>
</html>