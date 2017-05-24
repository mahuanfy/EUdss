package com.eu.dss.servic;

import com.eu.dss.entity.UserBean;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
public interface IUserServic {
    /**
     * 登录页面验证
     */
    int login(UserBean userBean);

    /**
     * 注册页面
     */
    void register(UserBean userBean);
}