package com.njxzc.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.SignMapper;
import com.njxzc.model.Sign;
import com.njxzc.service.SignService;

@Service
public class SignServiceImpl implements SignService {

	
	@Autowired
	SignMapper signMapper;
	
	
	@Override
	public List<Sign> queryall(Sign sign) {
		
		return signMapper.queryall(sign);
	}


	@Override
	public Sign queryone(Integer id) {
		
		return signMapper.queryone(id);
	}
	

	@Override
	public int updateByPrimaryKeySelective(Sign record) {
		
		return signMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public int insert(Sign record) {
		
		return signMapper.insert(record);
	}


	@Override
	public List<Sign> querysign(Sign sign) {
		
		return signMapper.querysign(sign);
	}


	@Override
	public Sign querystate(@Param("userid")Integer userid, @Param("date")Date date) {
		
		return signMapper.querystate(userid, date);
	}


	@Override
	public int inSignIn(@Param("userid")Integer userid, @Param("date")Date date) {
		
		return signMapper.inSignIn(userid, date);
	}


	

}
