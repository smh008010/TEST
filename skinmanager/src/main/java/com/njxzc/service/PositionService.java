package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Position;
import com.njxzc.model.PositionExample;

public interface PositionService {

	List<Position> selectByExample(PositionExample example);
	
	Position selectByPrimaryKey(Integer poid);
	
	int updateByPrimaryKeySelective(Position record);
	
	int insert(Position record);
}
