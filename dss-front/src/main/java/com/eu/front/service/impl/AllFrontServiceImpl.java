package com.eu.front.service.impl;

import com.eu.front.dao.AllFrontDao;
import com.eu.front.service.AllFrontService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by 马欢欢 on 17-7-11.
 */
@Service
public class AllFrontServiceImpl implements AllFrontService {
    @Autowired
    private AllFrontDao allFrontDao;

    public List<Map<String,String>> tronClass() {
        return allFrontDao.tronClass();
    }

}
