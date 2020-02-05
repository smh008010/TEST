package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.IndrugMapper;
import com.njxzc.model.Indrug;
import com.njxzc.service.IndrugService;

@Service
public class IndrugServiceImpl implements IndrugService {

	@Autowired
	IndrugMapper indrugMapper;
	
	
	@Override
	public List<Indrug> queryall(Indrug indrug) {
		
		return indrugMapper.queryall(indrug);
	}

	@Override
	public Indrug queryoneid(Integer indrugid) {
		
		return indrugMapper.queryoneid(indrugid);
	}

	@Override
	public int updateByPrimaryKeySelective(Indrug record) {
		
		return indrugMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insert(Indrug record) {
		
		return indrugMapper.insert(record);
	}

}
