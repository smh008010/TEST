package com.njxzc.service;

import java.util.List;


import com.njxzc.model.Menu;

public interface MenuService {
	/**
     * 根据父级id查询菜单
     * @param parentId
     * @return
     */
    List<Menu> querybyparentid(Integer parentId);
}
