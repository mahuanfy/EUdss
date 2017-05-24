package com.eu.dss.dao.impl;

import com.eu.dss.dao.BaseDao;
import com.eu.dss.dao.IUserDao;
import com.eu.dss.entity.UserBean;

import java.util.*;


/**
 * 登录页面dao层
 * Created by 马欢欢 on 2017/5/24.
 */
public class UserDao extends BaseDao implements IUserDao{

//        List<TronClasstype> list = super.query(sql,new Object[id],TronClasstype.class);
//        return (list!=null && list.size()>0) ? list.get(0) : null;
//    }

    public int login(UserBean userBean) {
        String sql = " SELECT * FROM dssuser WHERE dss_username=? AND dss_password=? ; ";
        Object[] paramsValue = {userBean.getUsername(),userBean.getPassword()};
        List<UserBean> list = super.query(sql,paramsValue,UserBean.class);
        return (list!=null && list.size()>0 ? 1 : 0);
    }

    public void register(UserBean userBean) {

    }
}
