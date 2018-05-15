package com.uu.ssm.web.controller;

import javax.servlet.http.HttpSession;

import com.uu.ssm.service.vo.UserVO;

public class BaseController {
	
	public UserVO getCurrentUser(HttpSession session){
		return (UserVO) session.getAttribute("currentUser");
	}

}
