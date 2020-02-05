package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Supplier;
import com.njxzc.model.SupplierExample;

public interface SupplierService {

	List<Supplier> selectByExample(SupplierExample example);
	
	Supplier selectByPrimaryKey(Integer supplierid);
	
	int updateByPrimaryKey(Supplier record);
	
	int insert(Supplier record);
}
