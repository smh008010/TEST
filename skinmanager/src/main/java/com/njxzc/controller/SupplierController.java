package com.njxzc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Supplier;
import com.njxzc.model.SupplierExample;
import com.njxzc.service.SupplierService;

@Controller
public class SupplierController {

	@Resource
	SupplierService supplierService;
	
	/**
	 * 查询所有供应商信息
	 * @return
	 */
	@RequestMapping(value="/supplier/queryall")
	@ResponseBody
	public List<Supplier> queryall(){
		SupplierExample example=new SupplierExample();
		List<Supplier> list=supplierService.selectByExample(example);
		return list;
	}
	
	
	/**
	 * 根据id查询供应商信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/supplier/querybyid")
	@ResponseBody
	public Supplier querybyid(Integer supplierid) {
		Supplier supplier=supplierService.selectByPrimaryKey(supplierid);
		return supplier;
	}
	
	
	/**
	 * 修改供应商信息
	 * @param supplier
	 * @return
	 */
	@RequestMapping(value="/supplier/update")
	@ResponseBody
	public int update(Supplier supplier) {
		int flag;
		if(supplier!=null) {
			flag=supplierService.updateByPrimaryKey(supplier);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加供应商
	 * @param supplier
	 * @return
	 */
	@RequestMapping(value="/supplier/insert")
	@ResponseBody
	public int insert(Supplier supplier) {
		int flag;
		if(supplier!=null) {
			flag=supplierService.insert(supplier);
			return flag;
		}else {
			return 0;
		}
	}
}
