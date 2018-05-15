var Login = function () {
    return {
        //main function to initiate the module
        init: function () {
           $('.login-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	            	account: {
	                    required: true
	                },
	                password: {
	                    required: true
	                },
	                vCode: {
	                    required: true
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	            	account: {
	                    required: "请输入用户名."
	                },
	                password: {
	                    required: "请输入密码."
	                },
	                vCode: {
	                    required: "请输入验证码."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	            	var account = $("#account").val();
	            	var password = $("#password").val();
	            	var vCode = $("#vCode").val();
	            	$.ajax({
	            		url:ctx + "/user/loginSync.do", //请求地址
	            		type:"post", //以POST方式提交
	            		sysn:true, //true:异步调用; false:同步调用
	            		data:{ //请求参数
	            			"account" : account,
	            			"password" : password,
	            			"vCode" : vCode
	            		},
	            		dataType:'json', //返回值类型
	            		beforeSend: function(req){ //请求前回调beforeSend方法
	            			$("#loginMsg").html("&nbsp;");
	    	            	$("#loginMsg").addClass("loading");
	            		},
	            		success:function(data,status){ //请求成功回调success方法
	            			$("#loginMsg").removeClass("loading");
	            			if(data){
	            				alert(date.statusText);
	            				var statusText = data.statusText;
	            				if(statusText == "success"){
	            					alert(ctx + "/index.do");
	            					window.location.href = ctx + "/index.do";
	            				}else{
	            					$("#loginMsg").text(data.message);
	            				}
	            			}
	            		},
	            		error:function(req,status,error){ //请求失败回调error方法
	            			
	            		}
	            	});
	            	return false;
	            	//form.submit();
	                //window.location.href = "index.html";
	            }
	            
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                	$('.login-form')[0].submit();
	                    window.location.href = ctx + "/index.do";
	                }
	                return false;
	            }
	        });
        }

    };
}();