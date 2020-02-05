package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.ProdrugMapper;
import com.njxzc.model.Prodrug;
import com.njxzc.service.ProdrugService;

@Service
public class ProdrugServiceImpl implements ProdrugService {

	@Autowired
	ProdrugMapper prodrugMapper;
	
	@Override
	public List<Prodrug> queryall(Prodrug prodrug) {
		
		return prodrugMapper.queryall(prodrug);
	}

	@Override
	public Prodrug querybyid(Integer prodrugid) {
		
		return prodrugMapper.querybyid(prodrugid);
	}

	@Override
	public int updateByPrimaryKeySelective(Prodrug record) {
		
		return prodrugMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insert(Prodrug record) {
		
		return prodrugMapper.insert(record);
	}

}
