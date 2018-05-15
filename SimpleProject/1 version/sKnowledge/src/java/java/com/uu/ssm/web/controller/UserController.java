package com.uu.ssm.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uu.ssm.service.UserService;
import com.uu.ssm.service.vo.UserVO;
import com.uu.ssm.web.Views;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/mine")
	public String userManage() {
		return Views.VIEW_MINE;
	}

	@RequestMapping("/mine/pcenter/baseInfo/user_info")
	public String userManageUpdate() {
		return Views.VIEW_USERMANAGE;
	}

	@RequestMapping("/update")
	public String update() {
		return "mine/pcenter/baseInfo/user_update";
	}

	@RequestMapping("/updatePwd")
	public String updatePwd() {
		return "mine/pcenter/baseInfo/update_pwd";
	}

	@RequestMapping("/doLogin")
	@ResponseBody // 方法结束后响应
	public Object doLogin(String username, String password, String verificationCode, HttpSession session) {
		ResultBean<UserVO> result = new ResultBean<>();

		String vCode = (String) session.getAttribute("verificationCode");
		System.out.println(username + "=" + password + "=" + verificationCode + "---" + vCode);
		if (!verificationCode.trim().equals(vCode)) {
			result.fail("验证码不正确");
			return result;
		}
		String a = "1";
		int aa = Integer.parseInt(a);
		result = userService.login(username, password);
		session.setAttribute("currentUser", result.getData());
		return result;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return Views.VIEW_INDEX;
	}

	@RequestMapping("/register")
	public String register() {
		return Views.VIEW_USER_REGISTER;
	}

	@RequestMapping("/doRegister")
	@ResponseBody
	public Object doRegister(String username, String password, String verificationCode, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String vCode = (String) session.getAttribute("verificationCode");
		System.out.println(username + "=" + password + "=" + verificationCode + "---" + vCode);
		ResultBean<Object> result = new ResultBean<>();
		if (userService.checkUsername(username)) {
			result.fail("账号已存在,请重新注册");
			return result;
		}
		if (!verificationCode.trim().equals(vCode)) {
			result.fail("验证码错误，请重新输入");
			return result;
		}

		UserVO user = new UserVO();
		user.setUsername(username);
		user.setPassword(password);

		userService.register(user);
		result.success("注册成功，欢迎新用户");
		return result;
	}

	@RequestMapping("/doUpdatePwd")
	@ResponseBody
	public Object doUpdatePwd(String username, String oldPwd, String newPwd, HttpSession session) {
		ResultBean<Object> result = new ResultBean<>();
		boolean flag = userService.checkUsernameAndPassword(username, oldPwd);
		if (flag) {
			userService.updateUserPwd(username, newPwd);
			session.invalidate();
			result.success("密码修改成功");
			return result;
		} else {
			result.fail("旧密码输入错误，请重新输入");
			return result;
		}
	}
}
