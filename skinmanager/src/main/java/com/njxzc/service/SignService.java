package com.njxzc.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.njxzc.model.Sign;

public interface SignService {

    List<Sign> queryall(Sign sign);
	
	Sign queryone(Integer id);
	
	int updateByPrimaryKeySelective(Sign record);
	
	int insert(Sign record);
	
	List<Sign> querysign(Sign sign);
	
	Sign querystate(@Param("userid")Integer userid,@Param("date")Date date);
	
	int inSignIn(@Param("userid")Integer userid, @Param("date")Date date);
}
