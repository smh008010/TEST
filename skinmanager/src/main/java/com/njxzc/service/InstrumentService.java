package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Instrument;
import com.njxzc.model.InstrumentExample;

public interface InstrumentService {
	
	List<Instrument> selectByExample(InstrumentExample example);
	
	 Instrument selectByPrimaryKey(Integer instrutmentid);
	
	int updateByPrimaryKeySelective(Instrument record);
	
	int insert(Instrument record);

}
