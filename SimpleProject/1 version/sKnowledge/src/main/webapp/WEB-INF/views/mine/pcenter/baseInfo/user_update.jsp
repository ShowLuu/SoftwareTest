<%@page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type"
	content="multipart/form-data; charset=utf-8" />
<style type="text/css">
.div-inline {
	display: inline;
	margin: 1px !important;
	padding: 5px !important;
}

.upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #999;
	text-decoration: none;
	color: #666;
}

.change {
	opacity: 0;
}
</style>
</head>
<body>
	<input id="username" name="username" type="hidden"
		value="${currentUser.username}" />
	<div class="page-content"
		style="width: 75%; height: 500px; margin-left: 50px">
		<div class="portlet box light-grey">
			<div class="portlet-body">
				<div class="clearfix">
					<div class="div-inline">
						<button id="addOrgBtn" class="btn green" onclick="noFunction();">
							新增 <i class="icon-plus"></i>
						</button>
					</div>
					<div class="div-inline">
						<button id="deleteOrgBtn" class="btn red" onclick="noFunction();">
							删除 <i class="icon-trash"></i>
						</button>
					</div>
					<div class="div-inline">
						<button id="searchOrg" class="btn blue" onclick="noFunction();">
							查询 <i class="icon-search"></i>
						</button>
					</div>
					<div class="div-inline">
						<button id="updatePwd2" class="btn green btn-primary btn-lg"
							data-toggle="modal" data-target="#updatePwd">
							修改密码 <i class="icon-lock"></i>
						</button>
					</div>
				</div>

				<!-- 模态框（Modal） -->
				<div class="modal fade" id="updatePwd" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title" id="myModalLabel">修改密码</h4>
							</div>
							<div class="modal-body" style="text-align: center;">
								<form role="form">
									<div class="form-group" id="oldPwdAlert">
										<input id="oldPwd" class="form-control input-lg" type="text"
											placeholder="旧密码">
									</div>
									<div class="form-group" id="newPwdAlert">
										<input id="newPwd" class="form-control" type="text"
											placeholder="新密码" onblur="checkPwd1();">
									</div>
									<div class="form-group" id="conPwdAlert">
										<input id="conPwd" class="form-control" type="text"
											placeholder="确认密码" onblur="checkPwd2();">
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="changePassword();">提交更改</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>



			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/vatti/js/jquery-1.10.1.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		function noFunction() {
			alert("功能还没完善！");
		}

		//修改密码时    检验密码输入框
		function checkPwd1() {
			var oldPwd = $('#oldPwd').val();
			var newPwd = $('#newPwd').val();
			if (oldPwd == null || oldPwd == "") {
				alert("请输入旧密码");
				return;
			}
			if (newPwd == null || newPwd == "") {
				alert("请输入新密码");
				return;
			}
			if (oldPwd == newPwd) {
				alert("新旧密码不能一致，请重新输入");
				document.getElementById("newPwd").value = "";
				return;
			}
			var checkChar = new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]", "i");
			if (checkChar.test(newPwd)) {
				alert("新密码不能包含特殊字符");
				document.getElementById("newPwd").value = "";
				return;
			}
			var len = newPwd.length;
			if (len<6||len>16) {
				alert("新密码长度不在6~16之间");
				document.getElementById("newPwd").value = "";
				return;
			}
		}

		function checkPwd2() {
			var newPwd = $('#newPwd').val();
			var conPwd = $('#conPwd').val();
			if (newPwd != conPwd) {
				alert("验证密码错误，请重新输入");
				document.getElementById("conPwd").value = "";
				return;
			}
		}

		//修改密码
		function changePassword() {
			var username = $('#username').val();
			var oldPwd = $('#oldPwd').val();
			var newPwd = $('#newPwd').val();
			var conPwd = $('#conPwd').val();
			var checkChar;
			var pwdStr = "";
			var pwdStr2 = "";
			var pf = 0;
			var pf2 = 0;
			if (username == null || username == "") {
				alert("请先登录！");
				return;
			}
			if (oldPwd == null || oldPwd == "") {
				alert("请输入旧密码");
				return;
			} else {
				checkChar = new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]", "i");
				if (checkChar.test(oldPwd)) {
					pwdStr += "密码不能包含特殊字符";
					pf++;
				}
				var len = oldPwd.length;
				if (len<6||len>16) {
					if (pf == 0) {
						pwdStr += "密码长度不在6~16之间";
					} else {
						pwdStr += ",且长度不在6~16之间";
					}
					pf++;
				}
			}
			if (pf > 0) {
				alert(pwdStr);
				document.getElementById("oldPwd").value = "";
				return;
			}

			if (newPwd == null || newPwd == "") {
				alert("请输入新密码");
				return;
			} else {
				checkChar = new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]", "i");
				if (checkChar.test(newPwd)) {
					pwdStr2 += "密码不能包含特殊字符";
					pf2++;
				}
				var len = newPwd.length;
				if (len<6||len>16) {
					if (pf2 == 0) {
						pwdStr2 += "密码长度不在6~16之间";
					} else {
						pwdStr2 += ",且长度不在6~16之间";
					}
					pf2++;
				}
			}
			if (pf2 > 0) {
				alert(pwdStr2);
				document.getElementById("newPwd").value = "";
				return;
			}

			if (conPwd == null || conPwd == "") {
				alert("请确认密码");
				return;
			}

			$
					.ajax({
						url : "${pageContext.request.contextPath}/user/doUpdatePwd",
						type : "post",
						async : true,
						data : {
							username : username,
							oldPwd : oldPwd,
							newPwd : newPwd,
						},
						dataType : "json",
						success : function(data) {
							if (data.statusText == "failed") {
								alert(data.message);
								document.getElementById("oldPwd").value = "";
								document.getElementById("newPwd").value = "";
								document.getElementById("conPwd").value = "";
								return;
							} else if (data.statusText == "success") {
								alert(data.message);
								window.location = "${pageContext.request.contextPath}/user/logout";
							}
						}
					});
		}

	</script>
</body>
</html>