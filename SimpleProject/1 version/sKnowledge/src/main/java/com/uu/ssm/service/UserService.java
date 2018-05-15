package com.uu.ssm.service;

import com.uu.ssm.entity.User;
import com.uu.ssm.service.vo.UserVO;
import com.uu.ssm.web.controller.ResultBean;

public interface UserService {
	
	public int register(UserVO user);
	
	public boolean checkUsername(String username);
	public boolean checkUsernameAndPassword(String username,String password);
	
	public ResultBean<UserVO> login(String username,String password);
	
	User findUser(String username);
	ResultBean<UserVO> getUser(String username);
    User findUser(String username,String password);
    
    int updateUserPwd(String username,String password);
    
    int updateUserHead(String username,String avatar);
    
    int updateUserName(String username,String name);
    
}
