package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.IndividualhistoryMapper;
import com.njxzc.model.Individualhistory;
import com.njxzc.service.IndividualhistoryService;

@Service
public class IndividualhistoryServiceImpl implements IndividualhistoryService {

	@Autowired
	IndividualhistoryMapper individualhistoryMapper;
	
	/**
	 * 联表查询散客记录
	 */
	@Override
	public List<Individualhistory> queryall(Individualhistory individualhistory) {
		List<Individualhistory> list=individualhistoryMapper.queryall(individualhistory);
		return list;
	}

	
	/**
	 * 添加散客记录
	 */
	@Override
	public int insert(Individualhistory record) {
		
		return individualhistoryMapper.insert(record);
	}

}
