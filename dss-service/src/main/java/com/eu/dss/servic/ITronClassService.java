package com.eu.dss.servic;

import com.eu.dss.entity.TronClasstype;

import java.util.List;

/**
 * 创课数据逻辑层 接口设计
 * 马欢欢
 * Created by pc on 2017/5/17.
 */
public interface ITronClassService {
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
}
