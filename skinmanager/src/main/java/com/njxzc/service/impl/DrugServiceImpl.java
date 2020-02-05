package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.DrugMapper;
import com.njxzc.model.Drug;
import com.njxzc.service.DrugService;

@Service
public class DrugServiceImpl implements DrugService {

	@Autowired
	DrugMapper drugMapper;
	
	
	/**
	 * 查询所有药品的供应商
	 */
	@Override
	public List<Drug> querydrugsupplier(Drug drug) {
		List<Drug> list=drugMapper.querydrugsupplier(drug);
		return list;
	}


	/**
	 * 根据id查询药品供应商
	 */
	@Override
	public Drug querybyid(Integer drugid) {
		
		return drugMapper.querybyid(drugid);
	}

	
	/**
	 * 修改药品信息
	 */
	@Override
	public int updateByPrimaryKeySelective(Drug record) {
		
		return drugMapper.updateByPrimaryKeySelective(record);
	}


    /**
     * 添加药品
     */
	@Override
	public int insert(Drug record) {
		
		return drugMapper.insert(record);
	}







	

}
