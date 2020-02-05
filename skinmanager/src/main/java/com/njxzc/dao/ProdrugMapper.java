package com.njxzc.dao;

import com.njxzc.model.Prodrug;
import com.njxzc.model.ProdrugExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProdrugMapper {
    long countByExample(ProdrugExample example);

    int deleteByExample(ProdrugExample example);

    int deleteByPrimaryKey(Integer prodrugid);

    int insert(Prodrug record);

    int insertSelective(Prodrug record);

    List<Prodrug> selectByExample(ProdrugExample example);

    Prodrug selectByPrimaryKey(Integer prodrugid);

    int updateByExampleSelective(@Param("record") Prodrug record, @Param("example") ProdrugExample example);

    int updateByExample(@Param("record") Prodrug record, @Param("example") ProdrugExample example);

    int updateByPrimaryKeySelective(Prodrug record);

    int updateByPrimaryKey(Prodrug record);
    
    List<Prodrug> queryall(Prodrug prodrug);
    
    Prodrug querybyid(Integer prodrugid); 
}