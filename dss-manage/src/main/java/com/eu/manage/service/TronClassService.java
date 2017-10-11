package com.eu.manage.service;

import com.eu.manage.entity.TronClass;
import com.eu.manage.utils.PageUtil;

import java.util.List;
import java.util.Map;

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
    List<Map<String,String>>  insertProfession(PageUtil pageUtil) throws Exception;

}
