package com.njxzc.service;

import java.util.List;

import com.njxzc.model.Customer;
import com.njxzc.model.CustomerExample;

public interface CustomerService {
	
	List<Customer> selectByExample(CustomerExample example);
	
	Customer selectByPrimaryKey(Integer customerid);
	
	int updateByPrimaryKeySelective(Customer record);
	
	int insert(Customer record);

}
