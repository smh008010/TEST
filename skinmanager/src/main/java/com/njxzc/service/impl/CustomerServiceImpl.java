package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.CustomerMapper;
import com.njxzc.model.Customer;
import com.njxzc.model.CustomerExample;
import com.njxzc.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMapper customerMapper;
	
	
	/**
	 * 查询所有客户信息
	 */
	@Override
	public List<Customer> selectByExample(CustomerExample example) {
		List<Customer> list=customerMapper.selectByExample(example);
		return list;
	}

	
	/**
	 * 根据id查询客户信息
	 */
	@Override
	public Customer selectByPrimaryKey(Integer customerid) {
		
		return customerMapper.selectByPrimaryKey(customerid);
	}

	
	/**
	 * 修改
	 */
	@Override
	public int updateByPrimaryKeySelective(Customer record) {
		
		return customerMapper.updateByPrimaryKeySelective(record);
	}

	
	/**
	 * 添加
	 */
	@Override
	public int insert(Customer record) {
		
		return customerMapper.insert(record);
	}

}
