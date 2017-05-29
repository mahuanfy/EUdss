package com.eu.dss.dao.impl;

import com.eu.dss.dao.BaseDao;
import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.entity.TronClasstype;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/23.
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

    public void save(TronClasstype tronClassType) {
        String sql = " INSERT INTO eu_tronclass (year,tron_month,eu_rj,eu_xin,eu_rw,eu_ts,eu_xiu,eu_gz,eu_kuai,eu_ad,eu_wc,eu_wu,eu_jr) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?); ";
        Object[] paramsValue = {tronClassType.getYear(),tronClassType.getTron_month(),
                tronClassType.getEu_rj(),   tronClassType.getEu_xin(),
                tronClassType.getEu_rw(),   tronClassType.getEu_ts(),
                tronClassType.getEu_xiu(),  tronClassType.getEu_gz(),
                tronClassType.getEu_kuai(), tronClassType.getEu_ad(),
                tronClassType.getEu_wc(),   tronClassType.getEu_wu(),
                tronClassType.getEu_jr()};
        super.update(sql,paramsValue);
    }

    public void update(TronClasstype tronClassType ) {
        String sql = " UPDATE eu_tronclass SET year = ?,tron_month =?,eu_rj =?," +
                "eu_xin =?,eu_rw=?,eu_ts=?,eu_xiu=?,eu_gz=?,eu_kuai=?," +
                "eu_ad=?,eu_wc=?,eu_wu=?,eu_jr=? where id=?";
        Object[] paramsValue = {tronClassType.getYear(),tronClassType.getTron_month(),
                tronClassType.getEu_rj(),   tronClassType.getEu_xin(),
                tronClassType.getEu_rw(),   tronClassType.getEu_ts(),
                tronClassType.getEu_xiu(),  tronClassType.getEu_gz(),
                tronClassType.getEu_kuai(), tronClassType.getEu_ad(),
                tronClassType.getEu_wc(),   tronClassType.getEu_wu(),
                tronClassType.getEu_jr(),   tronClassType.getId()};
        super.update(sql,paramsValue);
    }

    public void delete(int id) {
        String sql = " delete from eu_tronclass where id =? ";
        Object[] paramsValue = {id};
        super.update(sql,paramsValue);
    }


}



