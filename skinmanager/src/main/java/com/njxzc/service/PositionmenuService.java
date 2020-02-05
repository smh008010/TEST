package com.njxzc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PositionmenuService {

    /**
     * 根据职位id查询菜单id集合
     * @param poid
     * @return
     */
    public List<Integer> selectmenubypoid(@Param("poid")Integer poid);
    
    public Integer saveAuthority(Integer poid,Integer[] menuIds);
}
