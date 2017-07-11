package com.eu.dss.service.impl;


import com.eu.dss.dao.LoginDao;
import com.eu.dss.dao.UserDao;
import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.User;
import com.eu.dss.service.UserService;
import com.eu.dss.utils.ConnUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public int getTotalCount()  {
        return userDao.getTotalCount();
    }

    @Override
    public List<User> findUser(PageBean pageBean) {
        int totalCount = this.getTotalCount();//总记录数
        pageBean.setTotalCount(totalCount);//填充总记录数
        // 判断
        if (pageBean.getPageCurrent() <=0) {
            pageBean.setPageCurrent(1);		// 1.如果当前页 <= 0 当前页设置当前页为1;
        } else if (pageBean.getPageCurrent() > pageBean.getTotalPage()){
            pageBean.setPageCurrent(pageBean.getTotalPage());// 2.如果当前页>最大页数 当前页设置为最大页数
        }
        int pageCurrent = pageBean.getPageCurrent();//当前页
        pageBean.setIndex((pageCurrent -1)*pageBean.getPageCount()); //起始查询位置
        return userDao.findUser(pageBean);
    }
}
