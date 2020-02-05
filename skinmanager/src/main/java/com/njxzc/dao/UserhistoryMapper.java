package com.njxzc.dao;

import com.njxzc.model.Userhistory;
import com.njxzc.model.UserhistoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserhistoryMapper {
    long countByExample(UserhistoryExample example);

    int deleteByExample(UserhistoryExample example);

    int deleteByPrimaryKey(Integer useproid);

    int insert(Userhistory record);

    int insertSelective(Userhistory record);

    List<Userhistory> selectByExample(UserhistoryExample example);

    Userhistory selectByPrimaryKey(Integer useproid);

    int updateByExampleSelective(@Param("record") Userhistory record, @Param("example") UserhistoryExample example);

    int updateByExample(@Param("record") Userhistory record, @Param("example") UserhistoryExample example);

    int updateByPrimaryKeySelective(Userhistory record);

    int updateByPrimaryKey(Userhistory record);

	List<Userhistory> queryall(Userhistory userhistory);
	
	List<Userhistory> querybypro(Integer customerid,Integer productid);
	
	Userhistory querybyid(Integer useproid);
	
	int updatestate(Userhistory userhistory);
}