<%@page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/ctx.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctxCss}/select2_metro.css" />
<link rel="stylesheet" href="${ctxCss}/DT_bootstrap.css" />
<link rel="stylesheet" href="${ctxCss}/pagination.css?v=2017020304" />
</head>
<body class="page-header-fixed">
	 <%@ include file="/WEB-INF/views/common/title.jsp" %>
	<div class="page-container row-fluid">
		<div class="page-sidebar nav-collapse collapse">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				<li class="start active">
					<a href="javascript:;">
					<i class="icon-th-large"></i> 
					<span class="title">个人中心</span>
					<span class="selected"></span>
					<span class="arrow open"></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="${pageContext.request.contextPath}/user/mine/pcenter/baseInfo/user_info">基本信息</a>
						</li>
						<li >
							<a href="${ctx}/store/store-manage.do">门店管理</a>
						</li>
						<li id="user-mgr">
							<a href="${ctx}/user/user-manage.do">人员管理</a>
						</li>
					</ul>
				</li>
				<%@ include file="/WEB-INF/views/common/manage/application-manage.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/game-center.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/sale-report-query.jsp" %>
				<%@ include file="/WEB-INF/views/common/manage/system-manage.jsp" %>
			</ul>
		</div>
		<div class="page-content">
			<%-- <%@ include file="/view/comm/portlet-config.jsp" %> --%>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title"></h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> 
								<a>Home</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a>个人中心</a>
								 <i class="icon-angle-right"></i>
							</li>
							<li><a>基本信息</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li><a>更改密码</a> 
								<i class="icon-angle-right"></i>
							</li>
						</ul>
					</div>
				</div>
				
				<form  id="pwDataForm" role="form">
					<input id="username" name="username" type="hidden" value="${currentUser.username}" />
					<table border="0" cellspacing="0" cellpadding="0" width="500px" style="margin:30px auto 0px auto;">
						<tr align="center">
						    <th style="width:20%; text-align:left;">旧密码：</th>
					 	    <td style="width:70%; text-align:left;"><input id="txtOldPwd" name="txtOldPwd" value="" type="password" class="control-label visible-ie8 visible-ie9" /></td>
					    </tr>
					    <tr align="center">
					        <th style="width:20%; text-align:left;">新密码：</th>
					        <td style="width:70%; text-align:left;"><input id="txtNewPwd" name="txtNewPwd" value="" type="password" class="control-label visible-ie8 visible-ie9" />&nbsp;&nbsp;6~16个字符，区分大小写</td>
					    </tr>
					    <tr align="center">
					        <th style="width:20%; text-align:left;">确认新密码：</th>
					        <td style="width:70%; text-align:left;"><input id="txtConfirmNewPwd" value="" name="truepassword" type="password" class="control-label visible-ie8 visible-ie9" /></td>
					    </tr>
					    <tr>
					    	<td colspan="2" style="text-align:center;"><input type="button" id="btnSubmit" value="确认修改" onclick="changePassword()"/>
					    </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<%@ include file="/WEB-INF/views/common/scripts.jsp" %>
<script type="text/javascript" src="${ctxJS}/select2.min.js"></script>
<script type="text/javascript" src="${ctxJS}/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctxJS}/DT_bootstrap.js"></script>
<script src="${ctxJS}/app.js"></script>
<script src="${ctxJS}/table-managed.js"></script> 
<script type="text/javascript">
	function changePassword(){
		var username=$('#username').val();
		var oldPwd=$('#txtOldPwd').val();
		var newPwd=$('#txtNewPwd').val();
		var conPwd=$('#txtConfirmNewPwd').val();
		var checkChar;
		var pwdStr="";
		var pwdStr2="";
		var pf=0;
		var pf2=0;
		if(username==null||username==""){
			alert("请先登录！");
			window.location.href="${pageContext.request.contextPath}/user/login";
		}
		if(oldPwd==null||oldPwd==""){
			alert("请输入旧密码");
			return;
		}else{
			checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(oldPwd)){
				pwdStr+="密码不能包含特殊字符";
				pf++;
			}
			var len=oldPwd.length;
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
			alert(pwdStr);
			return;
		}
		
		if(newPwd==null||newPwd==""){
			alert("请输入新密码");
			return;
		}else{
			checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(newPwd)){
				pwdStr2+="密码不能包含特殊字符";
				pf2++;
			}
			var len=newPwd.length;
			if(len<6||len>16){
				if(pf2==0){
					pwdStr2+="密码长度不在6~16之间";
				}else{
					pwdStr2+=",且长度不在6~16之间";
				}
				pf2++;
			}
		}
		if(oldPwd==newPwd){
			alert("新旧密码不能一致，请重新输入");
			document.getElementById("txtNewPwd").value="";
			return;
		}
		if(pf2>0){
			alert(pwdStr2);
			return;
		}
		
		if(conPwd==null||conPwd==""){
			alert("请确认密码");
			return;
		}
		
		if(newPwd!=conPwd){
			alert("密码不一致，请重新输入");
			return;
		}
			$.ajax({
				url:"${pageContext.request.contextPath}/user/doUpdatePwd",
				type:"post",
				async:true,
				data:{
					username:username,
					oldPwd:oldPwd,
					newPwd:newPwd,
				},
				dataType:"json",
				success:function(data){
					if(data.statusText=="failed"){
						alert(data.message);
						location.reload(); 
					}else if(data.statusText=="success"){
						alert(data.message);
						window.location="${pageContext.request.contextPath}/user/login";
					}
				}
			});
		}
</script>	
</body>
</html>