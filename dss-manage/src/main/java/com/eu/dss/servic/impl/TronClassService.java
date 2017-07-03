package com.eu.dss.servic.impl;


import com.eu.dss.dao.TronClassDao;
import com.eu.dss.entity.TronClassBean;
import com.eu.dss.servic.ITronClassService;
import com.eu.dss.entity.PageBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * 业务逻辑层实现接口
 * 马欢欢
 * Created by pc on 2017/5/17
 */
public class TronClassService implements ITronClassService {
    private static TronClassDao tronClassDao ;
    private static ApplicationContext applicationContext;
    static {
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        tronClassDao = (TronClassDao) applicationContext.getBean("tronClassDao");
    }
    public List<TronClassBean> TronClasstypeFind() {

        try {
            return tronClassDao.tronClassBean();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public TronClassBean findByid(int id) {

        try {
            return tronClassDao.findByid(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void save(TronClassBean tronClasstype) {

        try {
            tronClassDao.save(tronClasstype);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void update(TronClassBean tronClassType) {

        try {
            tronClassDao.update(tronClassType);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int id) {

        try {
            tronClassDao.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
//    总页数
    public int getTotalCount()  {
        try {
          return tronClassDao.getTotalCount();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public List<TronClassBean> getAll(PageBean pageBean) {
        int totalCount = this.getTotalCount();//总记录数
        System.out.println("totalCount"+totalCount);
        pageBean.setTotalCount(totalCount);//填充总记录数

        /*
		 * 问题： jsp页面，如果当前页为首页，再点击上一页报错！
		 *              如果当前页为末页，再点下一页显示有问题！
		 * 解决：
		 * 	   1. 如果当前页 <= 0;       当前页设置当前页为1;
		 * 	   2. 如果当前页 > 最大页数；  当前页设置为最大页数
		 */
        // 判断
        if (pageBean.getPageCurrent() <=0) {
            pageBean.setPageCurrent(1);					    // 把当前页设置为1
        } else if (pageBean.getPageCurrent() > pageBean.getTotalPage()){
            pageBean.setPageCurrent(pageBean.getTotalPage());		// 把当前页设置为最大页数
        }

        int pageCurrent = pageBean.getPageCurrent();//当前页
        int index = (pageCurrent -1)*pageBean.getPageCount();//起始查询位置
        pageBean.setIndex(index);
        try {
            System.out.println(pageBean);
           return tronClassDao.getAll(pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
    return null;
    }


}
