package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Individualhistory;

public interface IndividualhistoryService {

	List<Individualhistory> queryall(Individualhistory individualhistory);
	
	int insert(Individualhistory record);
}
