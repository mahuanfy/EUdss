package com.eu.dss.dao;

import com.eu.dss.entity.User;


/**
 * Created by 马欢欢 on 2017/5/24.
 */

public interface LoginDao {
    /**
     * 登录
     * @param user
     * @return
     */
   User login(User user);


}
