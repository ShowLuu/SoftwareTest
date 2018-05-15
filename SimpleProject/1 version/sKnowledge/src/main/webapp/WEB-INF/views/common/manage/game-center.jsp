<%@page language="java" pageEncoding="utf-8" %>
<li>
	<a href="#"> 
		<i class="icon-shopping-cart"></i>
		<span class="title">游戏中心</span> 
		<span class="selected"></span> 
		<span class="arrow open"></span>
	</a>
	<ul class="sub-menu">
		<li><a href="#" onclick="checkGame(1);">捕鱼达人</a></li>
		<li><a href="#" onclick="checkGame(2);">自由闯关</a></li>
		<li><a href="#" onclick="checkGame(3);">切水果</a></li>
	</ul>
</li>

<script type="text/javascript">
	function checkGame(op){
		var username=document.getElementById("check").value;
		if(username==""){
			alert("请先登录");
			return;
		}
		var src="";
		if(op==1){
			src="${pageContext.request.contextPath}/views/mine/game/fishjoy/index.html";
		}else if(op==2){
			src="${pageContext.request.contextPath}/views/mine/game/freePass/index.html";
		}else if(op==3){
			src="${pageContext.request.contextPath}/views/mine/game/cutFruit/index.html";
		}
		window.open(src);
	}
</script>