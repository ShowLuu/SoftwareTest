package com.uu.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uu.ssm.dao.UserDao;
import com.uu.ssm.entity.User;
import com.uu.ssm.service.UserService;
import com.uu.ssm.service.vo.UserVO;
import com.uu.ssm.web.controller.ResultBean;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public int register(UserVO userVO) {
		User user = new User();
		BeanUtils.copyProperties(userVO, user);
		user.setId(System.currentTimeMillis());
		user.setEnabled(1);
		user.setCreatedTime(new Date());
		return userDao.insert(user);
	}

	@Override
	public boolean checkUsername(String username) {
		User user = new User();
		user.setUsername(username);
		return userDao.getUser(user) != null;
	}
	
	@Override
	public boolean checkUsernameAndPassword(String username,String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return userDao.getUser(user) != null;
	}
	
	@Override
	public int updateUserPwd(String username,String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return userDao.updateUser(user);
	}

//	@Override
//	public ResultBean<UserVO> login(String username, String password) {
//		ResultBean<UserVO> result = new ResultBean<>();
//		User param = new User();
//		param.setUsername(username);
//		User user = userDao.getUser(param);
//		if (user == null) {
//			result.fail("账号不存在");
//			return result;
//		}
//		if (user.getEnabled().intValue() == 0) {
//			result.fail("账号已禁用");
//			return result;
//		}
//		if (!user.getPassword().trim().equals(password.trim())) {
//			result.fail("密码错误");
//			return result;
//		}
//		UserVO userVO = new UserVO();
//		BeanUtils.copyProperties(user, userVO);
//		userVO.setId(user.getId().toString());
//		result.setData(userVO);
//		return result;
//	}
	
	@Override
	public ResultBean<UserVO> login(String username, String password) {
		ResultBean<UserVO> result = new ResultBean<>();
		User param = new User();
		param.setUsername(username);
		User user = userDao.getUser(param);
		if(user==null){
			result.fail("没有该用户，请先注册");
			return result;
		}
		if(!user.getPassword().equals(password)){
			result.fail("密码错误");
			return result;
		}
		UserVO userVO = new UserVO();
		BeanUtils.copyProperties(user, userVO);
		userVO.setId(user.getId().toString());
		userVO.setAvatar(user.getAvatar());
		userVO.setName(user.getName());
		result.setData(userVO);
		return result;
	}

	@Override
	public User findUser(String username) {
		return this.findUser(username, null);
	}

	@Override
	public User findUser(String username, String password) {
		try {
			User params = new User();
			params.setUsername(username);
			params.setPassword(password);

			List<User> list = userDao.getUserList(params);
			if (list != null && !list.isEmpty()) {
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateUserHead(String username, String avatar) {
		User user = new User();
		user.setUsername(username);
		user.setAvatar(avatar);
		return userDao.updateUser(user);
	}

	@Override
	public ResultBean<UserVO> getUser(String username) {
		ResultBean<UserVO> result=new ResultBean<>();
		User params = new User();
		params.setUsername(username);
		List<User> list = userDao.getUserList(params);
		User user=list.get(0);
		UserVO userVO = new UserVO();
		BeanUtils.copyProperties(user, userVO);
		userVO.setId(user.getId().toString());
		userVO.setAvatar(user.getAvatar());
		userVO.setName(user.getName());
		userVO.setName(user.getUsername());
		result.setData(userVO);
		return result;
	}

	@Override
	public int updateUserName(String username,String name) {
		User user=new User();
		user.setUsername(username);
		user.setName(name);
		return userDao.updateUser(user);
	}

}
