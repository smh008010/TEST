package com.njxzc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njxzc.dao.MenuMapper;
import com.njxzc.model.Menu;
import com.njxzc.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;
	
	@Override
	public List<Menu> querybyparentid(Integer parentId) {
		List<Menu> firstList=menuMapper.querybyparentid(parentId);
		execusion(firstList);
		return firstList;
	}
	
	public void execusion(List<Menu> firstList){
		if(firstList != null) {
			for(Menu menu:firstList) {
				Integer secondParentId=menu.getMenuId();
				List<Menu> secondList=querybyparentid(secondParentId);
				execusion(secondList);
				menu.setChildMenu(secondList);
			}
		}
	}
}
