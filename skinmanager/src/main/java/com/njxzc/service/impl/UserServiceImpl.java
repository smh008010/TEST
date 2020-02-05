package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.UserMapper;
import com.njxzc.model.User;
import com.njxzc.model.UserExample;
import com.njxzc.model.UserExample.Criteria;
import com.njxzc.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	@Override
	public List<User> selectByExample(UserExample example) {
		
		return userMapper.selectByExample(example);
	}

	@Override
	public User login(String username, String userpwd) {
		UserExample example=new UserExample();
		Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andUserpwdEqualTo(userpwd);
		List<User> list=userMapper.selectByExample(example);
		return list.size() >0 ? list.get(0) : null;
	}

	@Override
	public List<User> selectalluser(User user) {
		
		return userMapper.selectalluser(user);
	}

	@Override
	public User selectbyuserid(Integer userid) {
		
		return userMapper.selectbyuserid(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		
		return userMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insertSelective(User record) {
		
		return userMapper.insertSelective(record);
	}



	
	
}
