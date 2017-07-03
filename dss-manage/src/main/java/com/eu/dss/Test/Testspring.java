package com.eu.dss.Test;


import com.eu.dss.dao.UserDao;
import com.eu.dss.entity.UserBean;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by 马欢欢  on 17-7-3.
 */
public class Testspring {
    private ApplicationContext applicationContext;

    @Before
    public void setUp()throws Exception{
        applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
    }
    @Test
    public void testLogin() throws  Exception{
        UserDao userDao = (UserDao) applicationContext.getBean("userDao");
        UserBean userBean1 = new UserBean();
        userBean1.setUsername("admin");
        userBean1.setPassword("admin");
        List<UserBean> userBean = userDao.login(userBean1);
        System.out.println(userBean);
    }
}
