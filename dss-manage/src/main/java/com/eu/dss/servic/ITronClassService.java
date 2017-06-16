package com.eu.dss.servic;

import com.eu.dss.entity.TronClassBean;
import com.eu.dss.utils.PageBean;

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
    List<TronClassBean> TronClasstypeFind();

    /**
     *根据主键查询
     * 更新时获取信息
     */
    TronClassBean findByid(int id);

    /**
     * 添加
     */
    void save(TronClassBean tronClasstype);

    /**
     * 更新
     */
    void update(TronClassBean tronClassType);

    /**
     *删除
     */
    void delete(int id);

    /**
     * 分页查询数据
     */
    void getAll(PageBean pageBean);


}
