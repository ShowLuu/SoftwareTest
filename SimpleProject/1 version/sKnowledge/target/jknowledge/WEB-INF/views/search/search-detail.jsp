<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>${doc.name}</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/head/head.ico" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
	padding-top:70px;
}
</style>
</head>
<body>
<%@include file="../common/nav-top.jsp" %>
<div class="container" style="margin-top:-35px;margin-bottom:10px;">
	<div class="row">
		<div class="col-sm-10">
			<div class="page-header">
				<h2><span>${doc.name}</span>
					<a href="${pageContext.request.contextPath}/search/download/${doc.id}"><span class='glyphicon glyphicon-download-alt' style="float:right;"></span></a>
				</h2>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<iframe src="${pageContext.request.contextPath}/viewer.jsp?file=${pageContext.request.contextPath}/search/showDoc/${doc.id}" style="width:100%;height:500px;"></iframe>
		</div>
		<div class="col-sm-2">
			<div class="media">
				<div class="media-left media-middle">
					<a href="#">
						<img class="media-object" src="${pageContext.request.contextPath}/assets/img/user_head/${doc.user.avatar}" height="140px;" width="140px;">
					</a>
				</div>
				<br>
				<div class="media-body media-middle">
					<h4>${doc.user.name}</h4>
				</div>
			</div>
			<p style="padding-top:10px">
				<span id="docViewsBtn" class="glyphicon glyphicon-eye-open" aria-hidden="true" style="margin-right:10px;"><span id="docViews" class="badge" style="margin-top:-8px;">${doc.views}</span></span>
				<span id="docThumbsBtn" class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="margin-right:10px;cursor:pointer;"><span id="docThumbs" class="badge" style="margin-top:-8px;">${doc.thumbs}</span></span>
			</p>
		</div>
	</div>
</div>
<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		addViews();//阅读次数
		//点赞
		$("#docThumbsBtn").click(function(){
			if('${currentUser.username}'== null || '${currentUser.username}'==""){
				alert("登陆后可以点赞！");
				return;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/doc/thumbsup",
				type:"post",
				async:true,
				data:{docId:"${doc.id}"},
				dataType:"json",
				success:function(result){
					if(result.statusText=='success'){
						$("#docThumbs").text(result.data);
					}else{
						alert(result.message);
					}
				}
			});
		});
	});
	
	function addViews(){
		$.ajax({
			url:"${pageContext.request.contextPath}/doc/views",
			type:"post",
			async:true,
			data:{docId:"${doc.id}"},
			dataType:"json",
			success:function(result){
				if(result.statusText=="success"){
					$("#docViews").text(result.data);
				}else{
					alert(result.message);
				}
			}
		});
	}
	
</script>
</body>
</html>