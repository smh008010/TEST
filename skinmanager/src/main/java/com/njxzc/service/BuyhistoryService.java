package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Buyhistory;

public interface BuyhistoryService {

	 List<Buyhistory> queryhistory(Buyhistory buyhistory);
	    
	 Buyhistory querybyid(Integer buyhisid);
	 
	 int insert(Buyhistory record);
	 
	 int updateByPrimaryKeySelective(Buyhistory record);
	 
	 List<Buyhistory> queryprobycus(Integer customerid);
}
