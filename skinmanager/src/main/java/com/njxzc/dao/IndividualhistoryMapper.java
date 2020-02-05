package com.njxzc.dao;

import com.njxzc.model.Individualhistory;
import com.njxzc.model.IndividualhistoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IndividualhistoryMapper {
    long countByExample(IndividualhistoryExample example);

    int deleteByExample(IndividualhistoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Individualhistory record);

    int insertSelective(Individualhistory record);

    List<Individualhistory> selectByExample(IndividualhistoryExample example);

    Individualhistory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Individualhistory record, @Param("example") IndividualhistoryExample example);

    int updateByExample(@Param("record") Individualhistory record, @Param("example") IndividualhistoryExample example);

    int updateByPrimaryKeySelective(Individualhistory record);

    int updateByPrimaryKey(Individualhistory record);

	List<Individualhistory> queryall(Individualhistory individualhistory);
}