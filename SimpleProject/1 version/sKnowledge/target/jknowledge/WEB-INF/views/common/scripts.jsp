<%@page language="java" pageEncoding="utf-8" %>
<script src="${ctxJS}/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="${ctxJS}/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${ctxJS}/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
<script src="${ctxJS}/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxJS}/excanvas.min.js"></script>
<script src="${ctxJS}/respond.min.js"></script>  
<script src="${ctxJS}/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctxJS}/jquery.blockui.min.js" type="text/javascript"></script>  
<script src="${ctxJS}/jquery.cookie.min.js" type="text/javascript"></script>
<script src="${ctxJS}/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="${ctxJS}/toastr/toastr.min.js"></script>
<script type="text/javascript">
	var ctx = "${ctx}"
</script>
<script type="text/javascript">
$(function() {
	App.init();
	toastr.options = {
			  "closeButton": false, 
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "rtl": false,
			  "positionClass": "toast-top-full-width",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": 300,
			  "hideDuration": 1000,
			  "timeOut": 3000,
			  "extendedTimeOut": 500,
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
			
	if("${global_response_success_msg}"){
		toastr.success("${global_response_success_msg}");
	}else if("${global_response_error_msg}"){
		toastr.error("${global_response_error_msg}");
	}		
});
</script>