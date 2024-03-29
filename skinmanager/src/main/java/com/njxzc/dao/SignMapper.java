package com.njxzc.dao;

import com.njxzc.model.Sign;
import com.njxzc.model.SignExample;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SignMapper {
    long countByExample(SignExample example);

    int deleteByExample(SignExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sign record);

    int insertSelective(Sign record);

    List<Sign> selectByExample(SignExample example);

    Sign selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sign record, @Param("example") SignExample example);

    int updateByExample(@Param("record") Sign record, @Param("example") SignExample example);

    int updateByPrimaryKeySelective(Sign record);

    int updateByPrimaryKey(Sign record);

	List<Sign> queryall(Sign sign);

	Sign queryone(Integer id);

	List<Sign> querysign(Sign sign);
	
	Sign querystate(@Param("userid")Integer userid,@Param("date")Date date);
	
	int inSignIn(@Param("userid")Integer userid,@Param("date")Date date);
}