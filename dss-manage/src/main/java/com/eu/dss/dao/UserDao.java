package com.eu.dss.dao;

import com.eu.dss.entity.UserBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */

public interface UserDao {
    /**
     * 登录
     * @param userBean
     * @return
     */
   UserBean login(UserBean userBean);


    /**
     * 校验用户名是否存在
     * @param username
     * @return
     */
    int verify(String username);

}
