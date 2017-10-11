package com.eu.manage.dao;

import com.eu.manage.entity.User;


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
