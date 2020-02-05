package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Drug;

public interface DrugService {

	List<Drug> querydrugsupplier(Drug drug);
	
	Drug querybyid(Integer drugid);
	
	int updateByPrimaryKeySelective(Drug record);
	
	int insert(Drug record);
	
}
