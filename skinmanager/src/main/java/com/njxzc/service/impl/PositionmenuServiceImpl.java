package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.PositionmenuMapper;
import com.njxzc.model.Positionmenu;
import com.njxzc.model.PositionmenuExample;
import com.njxzc.model.PositionmenuExample.Criteria;
import com.njxzc.service.PositionmenuService;

@Service
public class PositionmenuServiceImpl implements PositionmenuService {

	@Autowired
	PositionmenuMapper positionmenuMapper;
	
	@Override
	public List<Integer> selectmenubypoid(Integer poid) {
		
		return positionmenuMapper.selectmenubypoid(poid);
	}

	@Override
	public Integer saveAuthority(Integer poid, Integer[] menuIds) {
		
		Integer count = 0;
		
		//清空数据
		PositionmenuExample example=new PositionmenuExample();
	    Criteria criteria=example.createCriteria();
	    criteria.andPoidEqualTo(poid);
	    positionmenuMapper.deleteByExample(example);
	    
	  //保存
		for (Integer menuId : menuIds) {
			Positionmenu positionmenu=new Positionmenu();
			positionmenu.setMenuId(menuId);
			positionmenu.setPoid(poid);
			count+=positionmenuMapper.insertSelective(positionmenu);
		}
		return count;
	}

}
