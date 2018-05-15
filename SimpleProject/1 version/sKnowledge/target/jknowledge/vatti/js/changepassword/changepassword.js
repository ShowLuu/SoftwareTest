$(function(){
	changePassword();
});
function changePassword() {
    var oldPwd = $("#txtOldPwd").val();
    var newPwd = $("#txtNewPwd").val();
    var confirmNewPwd = $("#txtConfirmNewPwd").val();

    if (oldPwd == "" || newPwd == "" || confirmNewPwd=="") {
        $.jBox.tip("旧密码或新密码或确认新密码不能为空！", 'error');
        return false;
    }
    if (oldPwd.length < 6 || oldPwd.length > 16) {
        $.jBox.tip("旧密码为6~16个字符，区分大小写！", 'error');
        return false;
    }
    if (newPwd.length < 6 || newPwd.length > 16) {
        $.jBox.tip("新密码为6~16个字符，区分大小写！", 'error');
        return false;
    }
    if (newPwd != confirmNewPwd) {
        $.jBox.tip("新密码两次输入不一致！", 'error');
        return false;
    }
}