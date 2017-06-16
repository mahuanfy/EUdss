package com.eu.dss.dao;

import com.eu.dss.entity.TronClassBean;
import com.eu.dss.utils.PageBean;

import java.sql.SQLException;
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
    List<TronClassBean> tronclassBean();

    /**
     *根据主键查询
     * 更新时获取信息
     */
    TronClassBean findByid(int id);

    /**
     * 添加
     */
    void save(TronClassBean tronClassBean);

    /**
     * 更新
     */
    void update(TronClassBean tronClassBean);

    /**
     *删除
     */
    void delete(int id);

    /**
     * 总记录数
     */
    int getTotalCount() throws SQLException, Exception;

    /**
     * 分页查询数据
     */
    void getAll(PageBean pageBean) throws Exception;



}
