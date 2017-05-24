package com.eu.dss.dao;

import com.eu.dss.entity.UserBean;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
public interface IUserDao {
    /**
     *登录
     */
    int login(UserBean userBean);

    /**
     * 注册
     */
    void register(UserBean userBean);
}
