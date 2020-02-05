package com.njxzc.dao;

import com.njxzc.model.Positionmenu;
import com.njxzc.model.PositionmenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PositionmenuMapper {
    long countByExample(PositionmenuExample example);

    int deleteByExample(PositionmenuExample example);

    int deleteByPrimaryKey(Integer pmId);

    int insert(Positionmenu record);

    int insertSelective(Positionmenu record);

    List<Positionmenu> selectByExample(PositionmenuExample example);

    Positionmenu selectByPrimaryKey(Integer pmId);

    int updateByExampleSelective(@Param("record") Positionmenu record, @Param("example") PositionmenuExample example);

    int updateByExample(@Param("record") Positionmenu record, @Param("example") PositionmenuExample example);

    int updateByPrimaryKeySelective(Positionmenu record);

    int updateByPrimaryKey(Positionmenu record);
    
    /**
     * 根据职位id查询菜单id集合
     * @param poid
     * @return
     */
    public List<Integer> selectmenubypoid(@Param("poid")Integer poid);
}