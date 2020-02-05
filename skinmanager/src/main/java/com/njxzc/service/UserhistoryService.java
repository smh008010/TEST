package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Userhistory;

public interface UserhistoryService {

	List<Userhistory> queryall(Userhistory userhistory);
	
	int insert(Userhistory record);
	
	List<Userhistory> querybypro(Integer customerid,Integer productid);
	
	Userhistory querybyid(Integer useproid);
	
	int updateByPrimaryKeySelective(Userhistory record);
	
	int updatestate(Userhistory userhistory);
}

