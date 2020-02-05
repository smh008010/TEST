package com.njxzc.dao;

import com.njxzc.model.User;
import com.njxzc.model.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    /**
     * 联职位表查询
     * @param user
     * @return
     */
    List<User> selectalluser(User user);
    
    /**
     * 根据id联表查询
     * @param userid
     * @return
     */
    User selectbyuserid(Integer userid);
    
    
}