package com.eu.dss.dao.impl;

import com.eu.dss.dao.BaseDao;
import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.entity.TronClasstype;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by pc on 2017/5/13.
 */
public class TronClassDao extends BaseDao implements ITronClassDao  {

    public List<TronClasstype> TronClasstype() {
        String sql = " SELECT * FROM eu_tronclass ; ";
        List <TronClasstype> list = super.query(sql,null,TronClasstype.class);
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println("bbbb"+jsonArray);
        return list;
    }

    public TronClasstype findByid(int id) {
        String sql = " SELECT * FROM eu_tronclass where id=? ; ";
        List <TronClasstype> list = super.query(sql,new Object[id],TronClasstype.class);
        return (list!=null && list.size()>0) ? list.get(0) : null;
    }

    public void save(TronClasstype tronClasstype) {
        String sql = " INSERT INTO eu_tronclass (year,tron_month,eu_rj,eu_xin,eu_rw,eu_ts,eu_xiu,eu_gz,eu_kuai,eu_ad,eu_wc,eu_wu,eu_jr) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?); ";
        Object[] paramsValue = {tronClasstype.getYear(),tronClasstype.getTron_month(),
                tronClasstype.getEu_rj(),   tronClasstype.getEu_xin(),
                tronClasstype.getEu_rw(),   tronClasstype.getEu_ts(),
                tronClasstype.getEu_xiu(),  tronClasstype.getEu_gz(),
                tronClasstype.getEu_kuai(), tronClasstype.getEu_ad(),
                tronClasstype.getEu_wc(),   tronClasstype.getEu_wu(),
                tronClasstype.getEu_jr()};
        super.update(sql,paramsValue);
    }

    public void update(TronClasstype tronClassType) {

    }

    public void delete(int id) {
        String sql = " ";
        Object[] paramsValue = {id};
        super.update(sql,paramsValue);
    }


}



