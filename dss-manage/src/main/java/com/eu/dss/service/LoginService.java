package com.eu.dss.service;

import com.eu.dss.entity.User;


/**
 * Created by 马欢欢 on 2017/5/24.
 */
public interface LoginService {
    /**
     * 登录页面验证
     * @param user
     * @return
     */
    User login(User user);




}
