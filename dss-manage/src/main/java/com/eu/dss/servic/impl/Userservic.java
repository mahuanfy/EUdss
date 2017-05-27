package com.eu.dss.servic.impl;

import com.eu.dss.dao.IUserDao;
import com.eu.dss.dao.impl.UserDao;
import com.eu.dss.entity.UserBean;
import com.eu.dss.servic.IUserServic;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
public class Userservic implements IUserServic {
    private IUserDao userDao =new UserDao();
    public List<UserBean> login(UserBean userBean) {
        try {
            return  userDao.login(userBean);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void register(UserBean userBean) {
            try {
                userDao.register(userBean);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

    }

    public int verify(String username) {
        try {
            return userDao.verify(username);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
