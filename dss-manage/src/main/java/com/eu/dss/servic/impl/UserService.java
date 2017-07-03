package com.eu.dss.servic.impl;


import com.eu.dss.dao.UserDao;
import com.eu.dss.entity.UserBean;
import com.eu.dss.servic.IUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
public class UserService implements IUserService {
    private static ApplicationContext applicationContext;
    private static UserDao userDao;
    static {
        applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        userDao = (UserDao) applicationContext.getBean("userDao");
    }
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
