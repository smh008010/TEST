package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.SupplierMapper;
import com.njxzc.model.Supplier;
import com.njxzc.model.SupplierExample;
import com.njxzc.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	SupplierMapper supplierMapper;
	
	
	/**
	 * 查询所有供应商信息
	 * @param example
	 * @return
	 */
	@Override
	public List<Supplier> selectByExample(SupplierExample example) {
		List<Supplier> list=supplierMapper.selectByExample(example);
		return list;
	}

	
	/**
	 * 根据id查询供应商信息
	 * @param id
	 * @return
	 */
	@Override
	public Supplier selectByPrimaryKey(Integer supplierid) {
		
		return supplierMapper.selectByPrimaryKey(supplierid);
	}

	
	/**
	 * 修改供应商信息
	 * @param record
	 * @return
	 */
	@Override
	public int updateByPrimaryKey(Supplier record) {
		
		return supplierMapper.updateByPrimaryKeySelective(record);
	}

	
	/**
	 * 添加供应商
	 * @param record
	 * @return
	 */
	@Override
	public int insert(Supplier record) {
		
		return supplierMapper.insert(record);
	}

}
