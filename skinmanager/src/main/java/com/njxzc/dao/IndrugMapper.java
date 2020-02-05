package com.njxzc.dao;

import com.njxzc.model.Indrug;
import com.njxzc.model.IndrugExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IndrugMapper {
    long countByExample(IndrugExample example);

    int deleteByExample(IndrugExample example);

    int deleteByPrimaryKey(Integer indrugid);

    int insert(Indrug record);

    int insertSelective(Indrug record);

    List<Indrug> selectByExample(IndrugExample example);

    Indrug selectByPrimaryKey(Integer indrugid);

    int updateByExampleSelective(@Param("record") Indrug record, @Param("example") IndrugExample example);

    int updateByExample(@Param("record") Indrug record, @Param("example") IndrugExample example);

    int updateByPrimaryKeySelective(Indrug record);

    int updateByPrimaryKey(Indrug record);
    
    List<Indrug> queryall(Indrug indrug);
    
    Indrug queryoneid(Integer indrugid);
}