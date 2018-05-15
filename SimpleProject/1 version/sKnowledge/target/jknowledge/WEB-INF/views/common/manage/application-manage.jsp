<%@page language="java" pageEncoding="utf-8" %>
<li>
	<a href="#"> 
		<i class="icon-glass"></i>
		<span class="title">应用中心</span> 
		<span class="selected"></span> 
		<span class="arrow open"></span>
	</a>
	<ul class="sub-menu">
		<input id="check" name="check" type="hidden" value="${currentUser.username}" /> 
		<li><a href="#" onclick="checkLBS(1);">地图导航</a></li>
		<!-- <li><a href="#">产品目录</a></li> -->
	</ul>
</li>

<script type="text/javascript">
	function checkLBS(op){
		//${pageContext.request.contextPath}/mine/LBS
		var username=document.getElementById("check").value;
		if(username==""){
			alert("请先登录");
			return;
		}
		var src="";
		if(op==1){
			src="${pageContext.request.contextPath}/mine/LBS";
		}
		window.open(src);
	}
</script>