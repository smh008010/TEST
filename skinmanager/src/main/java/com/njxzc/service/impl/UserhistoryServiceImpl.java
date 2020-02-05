package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.UserhistoryMapper;
import com.njxzc.model.Userhistory;
import com.njxzc.service.UserhistoryService;

@Service
public class UserhistoryServiceImpl implements UserhistoryService {

	@Autowired
	UserhistoryMapper userhistoryMapper;
	
	
	@Override
	public List<Userhistory> queryall(Userhistory userhistory) {
		
		return userhistoryMapper.queryall(userhistory);
	}

	@Override
	public int insert(Userhistory record) {
		
		return userhistoryMapper.insert(record);
	}

	@Override
	public List<Userhistory> querybypro(Integer customerid, Integer productid) {
		
		return userhistoryMapper.querybypro(customerid, productid);
	}

	@Override
	public Userhistory querybyid(Integer useproid) {
		
		return userhistoryMapper.querybyid(useproid);
	}

	@Override
	public int updateByPrimaryKeySelective(Userhistory record) {
		
		return userhistoryMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updatestate(Userhistory userhistory) {
		
		return userhistoryMapper.updatestate(userhistory);
	}

}
