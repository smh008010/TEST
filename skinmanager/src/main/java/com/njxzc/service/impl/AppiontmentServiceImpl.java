package com.njxzc.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.AppiontmentMapper;
import com.njxzc.model.Appiontment;
import com.njxzc.service.AppiontmentService;

@Service
public class AppiontmentServiceImpl implements AppiontmentService {

	@Autowired
	AppiontmentMapper appiontmentMapper;
	
	
	/**
	 * 查询所有预约
	 */
	@Override
	public List<Appiontment> queryall(Appiontment appiontment) {
		
		return appiontmentMapper.queryall(appiontment);
	}


	/**
	 * 根据id查询
	 */
	@Override
	public Appiontment queryone(Integer appid) {
		
		return appiontmentMapper.queryone(appid);
	}

	
	/**
	 * 修改
	 */
	@Override
	public int updateByPrimaryKeySelective(Appiontment record) {
		
		return appiontmentMapper.updateByPrimaryKeySelective(record);
	}

	
	/**
	 * 添加
	 */
	@Override
	public int insert(Appiontment record) {
		
		return appiontmentMapper.insert(record);
	}


	@Override
	public List<Appiontment> querybyuserid(Integer userid) {
		
		return appiontmentMapper.querybyuserid(userid);
	}


	@Override
	public int deleteapp(Appiontment appiontment) {
		
		return appiontmentMapper.deleteapp(appiontment);
	}


	@Override
	public int completeapp(Appiontment appiontment) {
		
		return appiontmentMapper.completeapp(appiontment);
	}


	

}
