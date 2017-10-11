package com.eu.front.service.impl;

import com.eu.front.dao.TronClassDao;
import com.eu.front.entity.TronClass;
import com.eu.front.service.TronClassService;
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

    public List<TronClass> tronClass() {
        return tronClassDao.tronClass();
    }

}
