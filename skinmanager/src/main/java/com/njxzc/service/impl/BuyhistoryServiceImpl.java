package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.BuyhistoryMapper;
import com.njxzc.model.Buyhistory;
import com.njxzc.service.BuyhistoryService;

@Service
public class BuyhistoryServiceImpl implements BuyhistoryService {

	
	@Autowired
	BuyhistoryMapper buyhistoryMapper;
	
	
	/**
	 * 查询所有客户历史记录
	 * @param buyhistory
	 * @return
	 */
	@Override
	public List<Buyhistory> queryhistory(Buyhistory buyhistory) {
		
		List<Buyhistory> list=buyhistoryMapper.queryhistory(buyhistory);
		return list;
	}

	
	/**
	 * 根据id查询客户历史记录
	 * @param id
	 * @return
	 */
	@Override
	public Buyhistory querybyid(Integer buyhisid) {
		
		return buyhistoryMapper.querybyid(buyhisid);
	}

	
	/**
	 * 添加客户历史记录
	 * @param record
	 * @return
	 */
	@Override
	public int insert(Buyhistory record) {
		
		return buyhistoryMapper.insert(record);
	}

	
	/**
	 * 修改客户历史记录
	 * @param record
	 * @return
	 */
	@Override
	public int updateByPrimaryKeySelective(Buyhistory record) {
		
		return buyhistoryMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public List<Buyhistory> queryprobycus(Integer customerid) {
		
		return buyhistoryMapper.queryprobycus(customerid);
	}

}
