<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<title>上传</title>
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
	<div class="container" style="margin-bottom:10px;">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="page-header">
					<h2>上传文件</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<form role="form">
						<div class="form-group">
							<input id="files" name="files" multiple type="file" class="file-loading">
						</div>
						<div class="form-group">
							<label for="fileName" class="control-label">文件名称</label>
							<input type="text" id="fileName" name="fileName" class="form-control" maxlength="100">
						</div>
						<div class="form-group">
							<label for="keywords" class="control-label">关键字</label>
							<input type="text" id="keywords" name="keywords" class="form-control">
						</div>
						<div class="form-group">
							<label for="description" class="control-label">描述</label>
							<textarea rows="3" id="description" name="description" class="form-control"></textarea>							
						</div>
					</form>
				</div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-sm-8 col-sm-offset-2 text-center">
					<button id="uploadBtn" class="btn btn-primary" style="width:60%;">提交</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/piexif.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/purify.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/themes/fa/theme.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/locales/zh.js"></script>
<script type="text/javascript">
$(function() {
	var $files = $("#files");
	$files.fileinput({
        language: 'zh',
        uploadUrl: '${pageContext.request.contextPath}/doc/doUpload',
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
        allowedFileExtensions: ["pdf", "doc", "docx", "ppt", "pptx", "txt", "zip","exe"], //允许上传的文件类型
        uploadExtraData: function(previewId, index){ //其它额外数据
           return {
        	 fileName: $("#fileName").val(),
             keywords: $("#keywords").val(),
             description: $("#description").val()
           }
        }
	}).on('fileuploaded',function(event,data,previewId,index){
		alert(data.response.message);
		if(data.response.statusText=="success"){
			window.location="${pageContext.request.contextPath}/search/index";
		}else if(data.response.message=="请先登录，才可上传"){
			window.location="${pageContext.request.contextPath}/user/login";
		}else if(data.response.statusText=="failed"){
			window.location="${pageContext.request.contextPath}/doc/upload";
		}
	});
	
	$("#uploadBtn").click(function(){
		//触发上传事件
		$files.fileinput("upload");
	});
})
</script>
</body>
</html>