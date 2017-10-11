package com.eu.manage.service.impl;

import com.eu.manage.dao.TronClassDao;
import com.eu.manage.entity.PageBean;
import com.eu.manage.entity.TronClass;
import com.eu.manage.service.TronClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 马欢欢 on 17-7-11.
 */
@Service
public class TronClassServiceImpl implements TronClassService{
    @Autowired
    private TronClassDao tronClassDao;

    @Override
    public List<TronClass> tronClass() {
        return tronClassDao.tronClass();
    }



    @Override
    public List<TronClass>  insertProfession(PageBean pageBean) throws Exception {
       return  tronClassDao.insertProfession(pageBean);
    }
}
