package com.eu.dss.service;

import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.TronClass;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by 马欢欢 on 17-7-11.
 */
public interface TronClassService {

    /**
     * 查询创课点击次数
     *
     */
    List<TronClass> tronClass();


    /**
     * 分页查询数据
     */
    List<TronClass>  insertProfession(PageBean pageBean) throws Exception;

}
