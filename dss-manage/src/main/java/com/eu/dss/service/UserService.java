package com.eu.dss.service;

import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.User;

import java.util.List;


/**
 * Created by 马欢欢 on 2017/5/24.
 */
public interface UserService {
    /**
     * 用户信息
     * @param
     * @return
     */
    List<User> findUser(PageBean pageBean);

    /**
     * 总页数
     * @return：总页数
     */
    int getTotalCount(PageBean pageBean);

    /**
     * 插入管理员
     * @param user
     */
    void insertUser(User user);

}
