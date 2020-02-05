package com.njxzc.dao;

import com.njxzc.model.Buyhistory;
import com.njxzc.model.BuyhistoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BuyhistoryMapper {
    long countByExample(BuyhistoryExample example);

    int deleteByExample(BuyhistoryExample example);

    int deleteByPrimaryKey(Integer buyhisid);

    int insert(Buyhistory record);

    int insertSelective(Buyhistory record);

    List<Buyhistory> selectByExample(BuyhistoryExample example);

    Buyhistory selectByPrimaryKey(Integer buyhisid);

    int updateByExampleSelective(@Param("record") Buyhistory record, @Param("example") BuyhistoryExample example);

    int updateByExample(@Param("record") Buyhistory record, @Param("example") BuyhistoryExample example);

    int updateByPrimaryKeySelective(Buyhistory record);

    int updateByPrimaryKey(Buyhistory record);
    
	List<Buyhistory> queryhistory(Buyhistory buyhistory);

	Buyhistory querybyid(Integer buyhisid);
	
	List<Buyhistory> queryprobycus(Integer customerid);
}