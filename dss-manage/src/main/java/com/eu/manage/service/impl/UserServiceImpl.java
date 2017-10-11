package com.eu.manage.service.impl;


import com.eu.manage.dao.UserDao;
import com.eu.manage.entity.PageBean;
import com.eu.manage.entity.User;
import com.eu.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 马欢欢 on 2017/5/24.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public int getTotalCount(PageBean pageBean,String username)  throws Exception{
        return userDao.getTotalCount(pageBean,username);
    }

    @Override
    public List<User> findUser(PageBean pageBean,String username) throws Exception{
        String user="%"+username+"%";
        int totalCount = this.getTotalCount(pageBean,user);//总记录数
        pageBean.setTotalCount(totalCount);//填充总记录数
        // 判断
        if (pageBean.getPageCurrent() <=0) {
            pageBean.setPageCurrent(1);		// 1.如果当前页 <= 0 当前页设置当前页为1;
        } else if (pageBean.getPageCurrent() > pageBean.getTotalPage()){
            pageBean.setPageCurrent(pageBean.getTotalPage());// 2.如果当前页>最大页数 当前页设置为最大页数
        }
        int pageCurrent = pageBean.getPageCurrent();//当前页
        pageBean.setIndex((pageCurrent -1)*pageBean.getPageCount()); //起始查询位置
        return userDao.findUser(pageBean,user);
    }
    @Override
    public void insertUser(User user) throws Exception{

        int rank = user.getRank();
        String rankValue = "";
        switch (rank){
            case 0:rankValue="超级管理员";break;
            case 1:rankValue="一级管理员";break;
            case 2:rankValue="二级管理员";break;
            case 3:rankValue="三级管理员";break;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd ");//可以方便地修改日期格式
        String date = dateFormat.format( now );
        user.setRankValue(rankValue);
        user.setDate(date);

        userDao.insertUser(user);

    }

    @Override
    public List<User> findById(int id)throws Exception {
        return userDao.findById(id);
    }

    @Override
    public void deleteById(int id) throws Exception{
        userDao.deleteById(id);
    }

    @Override
    public List<User> searchUserByName(String username) throws Exception{
        String name ="%"+username+"%";

        return userDao.searchUserByName(name);
    }
}
