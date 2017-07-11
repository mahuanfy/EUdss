package com.eu.dss.service.impl;

import com.eu.dss.dao.TronClassDao;
import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.TronClass;
import com.eu.dss.service.TronClassService;
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
