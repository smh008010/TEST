package com.njxzc.dao;

import com.njxzc.model.Appiontment;
import com.njxzc.model.AppiontmentExample;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AppiontmentMapper {
    long countByExample(AppiontmentExample example);

    int deleteByExample(AppiontmentExample example);

    int deleteByPrimaryKey(Integer appid);

    int insert(Appiontment record);

    int insertSelective(Appiontment record);

    List<Appiontment> selectByExample(AppiontmentExample example);

    Appiontment selectByPrimaryKey(Integer appid);

    int updateByExampleSelective(@Param("record") Appiontment record, @Param("example") AppiontmentExample example);

    int updateByExample(@Param("record") Appiontment record, @Param("example") AppiontmentExample example);

    int updateByPrimaryKeySelective(Appiontment record);

    int updateByPrimaryKey(Appiontment record);

	List<Appiontment> queryall(Appiontment appiontment);

	Appiontment queryone(Integer appid);
	
	List<Appiontment>querybyuserid(@Param("userid")Integer userid);
	
	int deleteapp(Appiontment appiontment);
	
	int completeapp(Appiontment appiontment);
}