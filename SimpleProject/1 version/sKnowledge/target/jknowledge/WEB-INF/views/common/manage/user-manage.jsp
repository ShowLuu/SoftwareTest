<%@page language="java" pageEncoding="utf-8" %>
<li class="">
	<a href="javascript:;">
		<i class="icon-th-large"></i>
		<span class="title">个人中心</span>
		<span class="arrow open"></span>
	</a>
	<ul class="sub-menu">
		<input id="check" name="check" type="hidden" value="${currentUser.username}" /> 
		<li><a href="#" onclick="checkInfo(1);">基本信息</a></li>
		<li><a href="#" onclick="checkInfo(2);">我的文件</a></li>
	</ul>
</li>

<script type="text/javascript">
	function checkInfo(op){
		var username=document.getElementById("check").value;
		if(username==""){
			alert("请先登录");
			return;
		}
		var src="";
		if(op==1){
			src="${pageContext.request.contextPath}/user/mine/pcenter/baseInfo/user_info";
		}else if(op==2){
			src="${pageContext.request.contextPath}/mine/pcenter/doc/doc_info";
		}
		window.location=src;
	}
</script>