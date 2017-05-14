package com.eu.dss.action;

import com.eu.dss.dao.UserDao;
import com.eu.dss.dao.impl.UserDaoImpl;

/**
 * Created by pc on 2017/5/13.
 */
public class UserAction {


    public static void main(String[] args) {
        UserDao userDao = new UserDaoImpl();
        try {
            userDao.delete(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
