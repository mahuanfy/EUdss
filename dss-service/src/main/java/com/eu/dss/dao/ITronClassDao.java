package com.eu.dss.dao;

import com.eu.dss.entity.TronClasstype;

import java.util.List;

/**
 * 创课点击次数
 * 马欢欢
 * Created by pc on 2017/5/13.
 */
public interface ITronClassDao {
    /**
     * 查询创课点击次数
     *
     */
    List<TronClasstype> TronClasstype();

    /**
     *根据主键查询
     * 更新时获取信息
     */
    TronClasstype findByid (int id);

    /**
     * 添加
     */
    void save(TronClasstype tronClasstype);

    /**
     * 更新
     */
    void update(TronClasstype tronClassType);

    /**
     *删除
     */
    void delete(int id);

    /**
     *
     */


}
