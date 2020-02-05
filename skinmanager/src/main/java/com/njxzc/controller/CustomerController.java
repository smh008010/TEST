package com.njxzc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Customer;
import com.njxzc.model.CustomerExample;
import com.njxzc.service.CustomerService;

@Controller
public class CustomerController {

	@Resource
	CustomerService customerService;
	
	
	/**
	 * 查询所有客户信息
	 * @return
	 */
	@RequestMapping(value="/customer/queryall")
	@ResponseBody
	public List<Customer> queryall(){
		CustomerExample example=new CustomerExample();
		List<Customer> list=customerService.selectByExample(example);
		return list;
	}
	
	
	/**
	 * 根据id查询客户信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/customer/selectbyid")
	@ResponseBody
	public Customer selectbyid(Integer customerid) {
		return customerService.selectByPrimaryKey(customerid);
	}
	
	
	/**
	 * 修改
	 * @param customer
	 * @return
	 */
	@RequestMapping(value="/customer/update")
	@ResponseBody
	public int update(Customer customer) {
		int flag;
		if(customer!=null) {
			flag=customerService.updateByPrimaryKeySelective(customer);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param customer
	 * @return
	 */
	@RequestMapping(value="/customer/insert")
	@ResponseBody
	public int insert(Customer customer) {
		int flag;
		if(customer!=null) {
			flag=customerService.insert(customer);
			return flag;
		}else {
			return 0;
		}
	}
}
