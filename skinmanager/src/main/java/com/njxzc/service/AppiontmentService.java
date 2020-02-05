package com.njxzc.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.njxzc.model.Appiontment;

public interface AppiontmentService {
	
	List<Appiontment> queryall(Appiontment appiontment);

	Appiontment queryone(Integer appid);
	
	int updateByPrimaryKeySelective(Appiontment record);
	
	int insert(Appiontment record);
	
	List<Appiontment>querybyuserid(@Param("userid")Integer userid);
	
    int deleteapp(Appiontment appiontment);
	
	int completeapp(Appiontment appiontment);
}
