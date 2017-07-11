package com.eu.dss.service.impl;


import com.eu.dss.dao.UserDao;
import com.eu.dss.entity.UserBean;
import com.eu.dss.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
@Service
public class UserService implements IUserService {

    @Autowired
    private  UserDao userDao;

    @Override
    public UserBean login(UserBean userBean) {
        try {
            System.out.println(userDao.login(userBean));
            if (userDao.login(userBean) != null) {
                return  userDao.login(userBean);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public int verify(String username) {
        try {
            return userDao.verify(username);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
