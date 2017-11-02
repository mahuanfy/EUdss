package com.eu.manage.service.impl;

import com.eu.manage.dao.TronClassDao;
import com.eu.manage.entity.PageBean;
import com.eu.manage.entity.TronClass;
import com.eu.manage.service.TronClassService;
import com.eu.manage.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 马欢欢 on 17-7-11.
 */
@Service
public class TronClassServiceImpl implements TronClassService{

    @Autowired
    private TronClassDao tronClassDao;

    @Override
    public List<Map<String,String>>  insertProfession(PageUtil page,String year,String month) throws Exception {

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", page.getPageSize());
        data.put("year", year);
        data.put("month", month);
        page.setTotalSize(tronClassDao.queryProfessionCount(data));

        return tronClassDao.queryProfession(data);
    }

    @Override
    public void addTronClass(TronClass tronClass) throws Exception {
        tronClassDao.addTronClass(tronClass);
    }

    @Override
    public List<Map<String, Object>> queryTronClass(int id) {
        return tronClassDao.queryTronClass(id);
    }

    @Override
    public void updateTronClass(TronClass tronClass) {
        tronClassDao.updateTronClass(tronClass);
    }

    @Override
    public void deleteTronClass(int id) {
        tronClassDao.deleteTronClass(id);
    }
}
