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

    public List<UserBean> login(UserBean userBean) {
        String sql = " SELECT * FROM dssuser WHERE username=? AND password=? ; ";
        Object[] paramsValue = {userBean.getUsername(),userBean.getPassword()};
        List<UserBean> list = super.query(sql,paramsValue,UserBean.class);
        return (list!=null && list.size()>0 ? list : null);
    }

    public void register(UserBean userBean) {
            String sql = " INSERT INTO dssuser (username,password,nickname,sex) VALUES(?,?,?,?); ";
            Object[] paramsValue = {userBean.getUsername(),userBean.getPassword(),
                    userBean.getNickname(),userBean.getSex()};
            super.update(sql,paramsValue);
        }

    public int verify(String username) {
        String sql = " SELECT * FROM dssuser WHERE username=? ; ";
        Object[] paramsValue = {username};
        List<UserBean> list = super.query(sql,paramsValue,UserBean.class);
        return (list!=null && list.size()>0 ? 1 : 0);
    }

}
