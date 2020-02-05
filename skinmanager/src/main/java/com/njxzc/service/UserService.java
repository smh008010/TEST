package com.njxzc.service;

import java.util.List;

import com.njxzc.model.User;
import com.njxzc.model.UserExample;

public interface UserService {

	List<User> selectByExample(UserExample example);
	
	public User login(String username,String userpwd);
	
	List<User> selectalluser(User user);
	
	User selectbyuserid(Integer userid);
	
	int updateByPrimaryKeySelective(User record);
	
	int insertSelective(User record);
	
	
}
