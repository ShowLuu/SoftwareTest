<%@page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<style type="text/css">
	.div-inline{ display:inline;
				 margin: 1px !important;
 				 padding: 5px !important;
			   } 
.upload{
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    border: 1px solid #999;
    text-decoration: none;
    color: #666;
}
.change{
    opacity: 0;
}
</style>
</head>
<body>
<input id="username" name="username" type="hidden" value="${currentUser.username}" />
				<div class="page-content" style="width:75%;height:500px;margin-left: 50px">
						<div class="portlet box light-grey">
							<div class="portlet-body">
								<div class="clearfix">
									<div class="btn-group"> 
										<%-- <button id="updateAvatarName" class="btn black btn-primary btn-lg" style="width: 100px" data-toggle="modal" data-target="#updateName"> 
											<span style="font-size:8px;">${currentUser.name} <i class="icon-retweet"></i></span>
										</button> --%>
										<%-- <input id="checkHead" name="checkHead" type="hidden" value="${currentUser.avatar}" />  --%>
										<img id="newHead" class="media-object" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}" height="100px;" width="100px;">
										<button id="updateAvatarHead" class="btn gray btn-primary btn-lg" style="width:100px" data-toggle="modal" data-target="#updateHead"> 
											 更换头像 <i class=" icon-picture"></i>	
										</button>
									</div>
									
<!-- 模态框（Modal） -->
<div class="modal fade" id="updateHead" tabindex="-1" role="dialog" aria-labelledby="myHead" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myHead">
					更改头像
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<form id="imgForm" action="" enctype="multipart/form-data" method="post">  
				   	<input id="fileUpload" name="file" class="upload" type="file"  onchange="loadImg()"/>
					<div class="addBorder" id="imgDiv">  
					    <img id="imgContent" src="${pageContext.request.contextPath}/assets/img/user_head/${currentUser.avatar}" height="200px;" width="200px;">  
					</div>  
				</form>  
			</div>
			<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="upload();">
						提交更改
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</div>

								<div class="clearfix">
									<div class="btn-group"> 
										<button id="updateAvatarName" class="btn black btn-primary btn-lg" style="width: 100px" data-toggle="modal" data-target="#updateName"> 
											<span style="font-size:8px;" id="currentUserName">${currentUser.name}</span><i class="icon-retweet"></i>
										</button>
									</div>
									
<!-- 模态框（Modal） -->
<div class="modal fade" id="updateName" tabindex="-3" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					更改昵称
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<form role="form">
					<div class="form-group">
						<input id="newName" class="form-control input-lg" type="text" placeholder="昵称" maxlength="13">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="updateName();">
					提交更改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</div>
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
									<!-- <div class="btn-group"> 
										<button id="updatePwd" class="btn green" onclick="updatePwd();"> 
											修改密码 <i class="icon-lock"></i> 
										</button>
									</div> -->
									<div class="div-inline"> 
										<button id="updatePwd2" class="btn green btn-primary btn-lg" data-toggle="modal" data-target="#updatePwd"> 
											修改密码 <i class="icon-lock"></i> 
										</button>
									</div>
								</div>
										
<!-- 模态框（Modal） -->
<div class="modal fade" id="updatePwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<form role="form">
					<div class="form-group" id="oldPwdAlert">
						<input id="oldPwd" class="form-control input-lg" type="text" placeholder="旧密码">
					</div>
					<div class="form-group" id="newPwdAlert">
						<input id="newPwd" class="form-control" type="text" placeholder="新密码" onblur="checkPwd1();">
					</div> 
					<div class="form-group" id="conPwdAlert">
						<input id="conPwd" class="form-control" type="text" placeholder="确认密码" onblur="checkPwd2();">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="changePassword();">
					提交更改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
									
									
								
								<table class="table table-striped table-bordered table-hover"
									id="org_list">
									<thead>
										<tr>
											<th style="width: 8px;">
												<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
											</th>
											<th>代码</th>
											<th>全路径</th>
											<th>名称</th>
											<th>级别</th>
											<th>父目录ID</th>
											<th>创建时间</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
				</div>
<script src="${pageContext.request.contextPath}/vatti/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

	function noFunction(){
		alert("功能还没完善！");
	}

	//展示选择的头像
	function loadImg(){
	    //获取文件  
	    var file = $("#imgForm").find("input")[0].files[0];  
	    
	    if(!/image\/\w+/.test(file.type)){
	         alert('上传的不是图片');
	         return;
	    }
	    
	    var imgSize = file.size;
        //35160  计算机存储数据最为常用的单位是字节(B)
        //在此处我们限制图片大小为2M
        if(imgSize>5*1024*1024){
	        alert('上传的图片的大于5M,请重新选择');
       	 	return;
        }
	  
	    //创建读取文件的对象  
	    var reader = new FileReader();  
	  
	    //创建文件读取相关的变量  
	    var imgFile;  
	  
	    //为文件读取成功设置事件  
	    reader.onload=function(e) {  
	        //alert('文件读取完成');  
	        imgFile = e.target.result;  
	        console.log(imgFile);  
	        $("#imgContent").attr('src', imgFile);  
	    };  
	  
	    //正式读取文件  
	    reader.readAsDataURL(file);  
	}
	
	//form表单上传文件
	function validate() {
		//if (validate()) {
		//	document.getElementById("imgForm").submit();
		//}
	    if (confirm("确定替换?")) {
	      return true;
	    } else {
	      return false;
	    }
	}
	
	//ajax上传头像
	function upload() {
		var username=$('#username').val();
		if(username==null||username==""){
			alert("请先登录！");
			return;
		}
		 var fileObj = document.getElementById("fileUpload").files[0]; // js 获取文件对象
               if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
                   alert("请选择图片");
                   return;
               }
               var formFile = new FormData();
               formFile.append("file", fileObj); //加入文件对象
 
               var file = formFile;
               $.ajax({
                   url: "${pageContext.request.contextPath}/user/doUpdateHead",
                   data: file,
                   type: "post",
                   async:true,
                   dataType: "json",
                   cache: false,//上传文件无需缓存
                   processData: false,//用于对data参数进行序列化处理 这里必须false
                   contentType: false, //必须
                   success: function (data) {
                  	   if(data.statusText=="success"){
                     	   alert("头像设置成功");
                    	   window.location="${pageContext.request.contextPath}/user/logout";
                       }else{
                    	   alert("替换失败");
                       }
                   }
               });
    }
	
		//修改密码时    检验密码输入框
		function checkPwd1(){
			var oldPwd=$('#oldPwd').val();
			var newPwd=$('#newPwd').val();
			if(oldPwd==null||oldPwd==""){
				alert("请输入旧密码");
				return;
			}
			if(newPwd==null||newPwd==""){
				alert("请输入新密码");
				return;
			}
			if(oldPwd==newPwd){
				alert("新旧密码不能一致，请重新输入");
				document.getElementById("newPwd").value="";
				return;
			}
			var checkChar=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");
			if(checkChar.test(newPwd)){
				alert("新密码不能包含特殊字符");
				document.getElementById("newPwd").value="";
				return;
			}
			var len=newPwd.length;
			if(len<6||len>16){
				alert("新密码长度不在6~16之间");
				document.getElementById("newPwd").value="";
				return;
			}
		}
		
		function checkPwd2(){
			var newPwd=$('#newPwd').val();
			var conPwd=$('#conPwd').val();
			if(newPwd!=conPwd){
				alert("验证密码错误，请重新输入");
				document.getElementById("conPwd").value="";
				return;
			}
		}
		
	//修改密码
	function changePassword(){
		var username=$('#username').val();
		var oldPwd=$('#oldPwd').val();
		var newPwd=$('#newPwd').val();
		var conPwd=$('#conPwd').val();
		var checkChar;
		var pwdStr="";
		var pwdStr2="";
		var pf=0;
		var pf2=0;
		if(username==null||username==""){
			alert("请先登录！");
			return;
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
			document.getElementById("oldPwd").value="";
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
		if(pf2>0){
			alert(pwdStr2);
			document.getElementById("newPwd").value="";
			return;
		}
		
		if(conPwd==null||conPwd==""){
			alert("请确认密码");
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
						document.getElementById("oldPwd").value="";
						document.getElementById("newPwd").value="";
						document.getElementById("conPwd").value="";
						return;
					}else if(data.statusText=="success"){
						alert(data.message);
						window.location="${pageContext.request.contextPath}/user/logout";
					}
				}
			});
		}
	
	function updateName(){
		var username=$('#username').val();
		if(username==null||username==""){
			alert("请先登录！");
			return;
		}
		var name=document.getElementById("newName").value;
		if(name==null||name==""){
			alert("请输入昵称");
			return;
		}else{
			var len = 0;
	        for (var i = 0; i < name.length; i++){
	             var a = name.charAt(i);
	             if (a.match(/[^\x00-\xff]/ig) != null){
	                 len += 2;
	             }
              else{
                  len += 1;
              }
            }
			if(len>13){
				alert("昵称过长，请重新输入");
				document.getElementById("newName").value="";
				return;
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/user/doUpdateName",
			type:"post",
			async:"false",
			data:{name:name},
			dataType:"json",
			success:function(data){
				if(data.statusText=="success"){
					alert("成功修改昵称!重新登陆即可更改此页面的显示！");
					document.getElementById("currentUserName").innerText=data.message;
				}else if(data.statusText=="failed"){
					alert(data.message);
				}
			},
		});
	}
	
	</script>
  </body>
</html>