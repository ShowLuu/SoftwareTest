package com.uu.ssm.dao;

import java.util.List;

import com.uu.ssm.entity.User;

public interface UserDao {
	
	public int insert(User user);
	public User getUser(User user);
	List<User> getUserList(User user);
	
	int updateUser(User user);
	
}
