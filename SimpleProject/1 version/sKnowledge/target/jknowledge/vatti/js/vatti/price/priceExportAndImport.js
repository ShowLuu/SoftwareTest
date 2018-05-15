$(function() {
	$("#price-mgr").addClass("active");
	priceAdd();
});

function priceAdd(){
	$("#add").click(function(){
		$.ajax({
			url : ctx + "/priceSystem/priceAddBody.do",
			type : "POST",
			data : {
				"storeId" : $("[name='storeId']").val(),
				"productId" : $("[name='productId']").val(),
				"priceDefault" : $("#defaultPrice").val(),
				"pricePackage" : $("#packagePrice").val(),
				"priceActive" : $("#activePrice").val()
			},
			async : true,
			dataType : 'json',
			beforeSend : function(req) { // 请求前回调beforeSend方法

			},
			success : function(data, status) {
				if(data){
					if(data.statusText == "success"){
						alert("新增成功!");
					}else{
						alert("新增失败!");
					}
				}
			},
			error : function(req, status, error) { // 请求失败回调error方法
				alert("req - " + req);
				alert("status - " + status);
				alert("errror - " + error);
			}
		});
	});
}








