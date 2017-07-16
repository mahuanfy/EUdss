package com.eu.dss.dao;

import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by 马欢欢 on 2017/5/24.
 */

public interface UserDao {
    /**
     * 用户信息
     * @param
     * @return
     */
   List<User> findUser(@Param("pageBean") PageBean pageBean, @Param("username") String username)throws Exception;

    /**
     * 总页数
     * @return：总页数
     */
    int getTotalCount(@Param("pageBean") PageBean pageBean, @Param("username") String username)throws Exception;

    /**
     * 插入管理员
     * @param user
     */
    void insertUser(User user)throws Exception;

    /**
     * 通过ID查询用户信息
     * @param id
     * @return
     */
    List<User> findById(int id)throws Exception;

    /**
     * 通过ID删除用户
     * @param id
     */
    void deleteById(int id)throws Exception;

    /**
     * 通过name模糊查询用户
     * @param name
     * @return
     */
    List<User> searchUserByName(String name)throws Exception;


}
