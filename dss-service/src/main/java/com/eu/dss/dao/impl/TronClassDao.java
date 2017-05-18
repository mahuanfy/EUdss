package com.eu.dss.dao.impl;

import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.entity.TronClasstype;
import com.eu.dss.util.ConnUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by pc on 2017/5/13.
 */
public class TronClassDao implements ITronClassDao {

    public List<TronClasstype> TronClasstype() {
        Connection conn = ConnUtil.getConnextion();
        String sql = " SELECT * FROM eu_tronclass ; ";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            List<TronClasstype> list = new ArrayList<TronClasstype>();
            TronClasstype tronInfo = null;
            while (rs.next()) {
                tronInfo = new TronClasstype();
                tronInfo.setId(rs.getInt("id"));
                tronInfo.setTron_month(rs.getString("tron_month"));
                tronInfo.setEu_rj(rs.getInt("eu_rj"));
                tronInfo.setEu_xin(rs.getInt("eu_xin"));
                tronInfo.setEu_rw(rs.getInt("eu_rw"));
                tronInfo.setEu_ts(rs.getInt("eu_ts"));
                tronInfo.setEu_xiu(rs.getInt("eu_xiu"));
                tronInfo.setEu_gz(rs.getInt("eu_gz"));
                tronInfo.setEu_kuai(rs.getInt("eu_kuai"));
                tronInfo.setEu_ad(rs.getInt("eu_ad"));
                tronInfo.setEu_wc(rs.getInt("eu_wc"));
                tronInfo.setEu_wu(rs.getInt("eu_wu"));
                tronInfo.setEu_jr(rs.getInt("eu_jr"));
                list.add(tronInfo);
            }
            ConnUtil.close(rs, conn, pstmt);
            return  list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public TronClasstype findByid(int id) {
        return null;
    }

    public void save(TronClasstype tronClasstype) {

    }

    public void update(TronClasstype tronClassType) {

    }

    public void delete(int id) {

    }
}



