package com.eu.manage.service.impl;


import com.eu.manage.dao.LoginDao;
import com.eu.manage.entity.User;
import com.eu.manage.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    @Override
    public User login(User user) {
        try {
            if (loginDao.login(user) != null) {
                return  loginDao.login(user);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
