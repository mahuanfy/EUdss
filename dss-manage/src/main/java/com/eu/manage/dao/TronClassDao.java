package com.eu.manage.dao;

import com.eu.manage.entity.PageBean;
import com.eu.manage.entity.TronClass;

import java.util.List;
import java.util.Map;

/**
 * 创课点击次数
 * 马欢欢
 * Created by 马欢欢 on 2017/5/13.
 */
public interface TronClassDao {

    /**
     * 分页查询数据
     * @param data
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> queryProfession(Map<String, Object> data) throws Exception;

    /**
     * 查询总数
     * @return
     * @throws Exception
     */
    Long queryProfessionCount(Map<String, Object> data) throws Exception;

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
     * 通过Id删除
     * @param id
     */
    void deleteTronClass(int id);
}
