package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.PositionMapper;
import com.njxzc.model.Position;
import com.njxzc.model.PositionExample;
import com.njxzc.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionMapper positionMapper;
	
	@Override
	public List<Position> selectByExample(PositionExample example) {
		return positionMapper.selectByExample(example);
	}

	@Override
	public Position selectByPrimaryKey(Integer poid) {
		
		return positionMapper.selectByPrimaryKey(poid);
	}

	@Override
	public int updateByPrimaryKeySelective(Position record) {
		
		return positionMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insert(Position record) {
		
		return positionMapper.insert(record);
	}
	
	

}
