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
			<div class="col-sm-8 col-sm-offset-2">
				<div class="pagr-header">
					<h2>注册</h2>
					<h6>请选择jpg,png格式图片</h6>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<form role="form">
						<div class="form-group">
							<input id="avatar" name="avatar" type="file" class="file-loading">
						</div>
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
				<div class="col-sm-8 col-sm-offset-2 text-center">
					<button id="registerBtn" class="btn btn-primary" style="width:60%;">注册</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/piexif.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/purify.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/locales/zh.js"></script>
<script src="${pageContext.request.contextPath}/assets/themes/fa/theme.min.js"></script>
<script type="text/javascript">
$(function(){
	var $avatar=$("#avatar");
	$avatar.fileinput({
		language:'zh',
		uploadUrl: '${pageContext.request.contextPath}/user/doRegister', //上传的地址
		showBrowse: true, //是否显示文件选择按钮
        showUpload: false, //是否显示上传按钮
        showCaption: true, //是否显示文件选择按钮
        showRemove: false, //是否显示删除按钮
        showPreview: true, //是否预览
        uploadAsync: true, //是否异步
        browseOnZoneClick: true, //是否点击预览区域选择文件
        minFileCount: 1, //最小文件数
        maxFileCount: 1, //最多文件数
        mainClass: "input-group-md",
        browseClass: "btn btn-primary", //按钮样式             
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        allowedFileExtensions: ["png", "jpg"], //允许上传的文件类型
        uploadExtraData: function(previewId, index){ //其它额外数据 
			return {
        		username: $("#username").val(),
        		password: $("#password").val(),
        		confirmPassword: $("#confirmPassword").val(),
        		verificationCode: $("#verificationCode").val()
        	}        
        }
	}).on('fileuploaded',function(event,data,previewId,index){
		console.log(data.response.message);
		alert(data.response.message);
		if(data.response.message=="注册成功，欢迎新用户"){
			window.location="${pageContext.request.contextPath}/user/login";
		}
	});
	
	$("#registerBtn").click(function(){
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
			//触发上传事件
			$avatar.fileinput("upload");
		}
	});
	
	var verificationCodeUrl="${pageContext.request.contextPath}/verificationCode";
	$("#verificationCodeImg").attr("src",verificationCodeUrl);
	$("#changeVerificationCodeBtn").click(function(){
		$("#verificationCodeImg").attr("src",verificationCodeUrl+"?v="+Math.random());
	});
	
})
</script>
</body>
</html>