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
     * 分页查询数据
     */
    List<Map<String,String>>  insertProfession(PageUtil pageUtil,String year,String month) throws Exception;

    /**
     * 添加数据
     * @param tronClass
     * @throws Exception
     */
    void addTronClass(TronClass tronClass) throws Exception;
    /**
     * 通过id查询
     * @param id
     * @return
     */
    List<Map<String,Object>> queryTronClass(int id);

    /**
     * 更新数据
     * @param tronClass
     */
    void updateTronClass(TronClass tronClass);

    /**
     * 通过id删除
     * @param id
     */
    void deleteTronClass(int id);
}
