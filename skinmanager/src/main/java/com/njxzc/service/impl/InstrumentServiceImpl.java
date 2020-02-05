package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.InstrumentMapper;
import com.njxzc.model.Instrument;
import com.njxzc.model.InstrumentExample;
import com.njxzc.service.InstrumentService;

@Service
public class InstrumentServiceImpl implements InstrumentService {

	@Autowired 
	InstrumentMapper instrumentMapper;
	
	
	/**
	 * 查询所有设备信息
	 */
	@Override
	public List<Instrument> selectByExample(InstrumentExample example) {
		List<Instrument> list=instrumentMapper.selectByExample(example);
		return list;
	}

	
	/**
	 * 根据id查找信息
	 */

	@Override
	public Instrument selectByPrimaryKey(Integer instrutmentid) {
		
		return instrumentMapper.selectByPrimaryKey(instrutmentid);
	}
	
	
	
	/**
	 * 修改
	 */
	@Override
	public int updateByPrimaryKeySelective(Instrument record) {
		
		return instrumentMapper.updateByPrimaryKeySelective(record);
	}

	
	/**
	 * 添加
	 */
	@Override
	public int insert(Instrument record) {
		
		return instrumentMapper.insert(record);
	}



}
