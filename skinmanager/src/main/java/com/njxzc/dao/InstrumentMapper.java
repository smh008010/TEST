package com.njxzc.dao;

import com.njxzc.model.Instrument;
import com.njxzc.model.InstrumentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InstrumentMapper {
    long countByExample(InstrumentExample example);

    int deleteByExample(InstrumentExample example);

    int deleteByPrimaryKey(Integer instrutmentid);

    int insert(Instrument record);

    int insertSelective(Instrument record);

    List<Instrument> selectByExample(InstrumentExample example);

    Instrument selectByPrimaryKey(Integer instrutmentid);

    int updateByExampleSelective(@Param("record") Instrument record, @Param("example") InstrumentExample example);

    int updateByExample(@Param("record") Instrument record, @Param("example") InstrumentExample example);

    int updateByPrimaryKeySelective(Instrument record);

    int updateByPrimaryKey(Instrument record);
}