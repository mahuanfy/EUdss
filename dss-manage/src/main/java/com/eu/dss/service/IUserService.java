package com.eu.dss.service;

import com.eu.dss.entity.UserBean;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
public interface IUserService {
    /**
     * 登录页面验证
     */
    UserBean login(UserBean userBean);

    /**
     * 校验用户名手否存在
     */
    int verify(String username);


}
