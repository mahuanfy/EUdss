package com.eu.dss.servic.impl;

import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.dao.impl.TronClassDao;
import com.eu.dss.entity.TronClasstype;
import com.eu.dss.servic.ITronClassService;
import com.eu.dss.util.PageBean;

import java.util.List;

/**
 * 业务逻辑层实现接口
 * 马欢欢
 * Created by pc on 2017/5/17
 */
public class TronClassService implements ITronClassService {
    private ITronClassDao tronClassDao = new TronClassDao();

    public List<TronClasstype> TronClasstypeFind() {

        try {
            return tronClassDao.TronClasstype();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public TronClasstype findByid(int id) {

        try {
            return tronClassDao.findByid(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void save(TronClasstype tronClasstype) {

        try {
            tronClassDao.save(tronClasstype);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void update(TronClasstype tronClassType) {

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

    public void getAll(PageBean pageBean) {
        try {
            tronClassDao.getAll(pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
