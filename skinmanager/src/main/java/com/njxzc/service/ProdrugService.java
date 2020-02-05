package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Prodrug;

public interface ProdrugService {
	
    List<Prodrug> queryall(Prodrug prodrug);
    
    Prodrug querybyid(Integer prodrugid); 
    
    int updateByPrimaryKeySelective(Prodrug record);
    
    int insert(Prodrug record);
}
