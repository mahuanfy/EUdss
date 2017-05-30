package com.eu.dss.dao.impl;

import com.eu.dss.dao.BaseDao;
import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.entity.TronClasstype;
import com.eu.dss.util.ConnUtil;
import com.eu.dss.util.PageBean;
import net.sf.json.JSONArray;
import org.junit.Test;

import java.awt.print.Pageable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/23.
 */
public class TronClassDao extends BaseDao implements ITronClassDao  {

    public List<TronClasstype> TronClasstype() {
        String sql = " SELECT * FROM eu_tronclass limit ?,?; ";
        Object[] paramsValue ={0,10};
        List <TronClasstype> list = super.query(sql,paramsValue,TronClasstype.class);
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

    public int getTotalCount() throws Exception {
    PreparedStatement pstmt = null;
    Connection conn = null;
    conn = ConnUtil.getConnextion();
    String sql = " SELECT count(*) FROM eu_tronclass  ; ";

        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()) {
            return rs.getInt(1);
        }
        ConnUtil.close(rs, pstmt, conn);

        return 0;
}
//@Test
//public void aaa(){
//    PageBean pageBean = new PageBean();
//    pageBean.setPageCurrent(2);
//    try {
//        getAll(pageBean);
//    } catch (Exception e) {
//        e.printStackTrace();
//    }
//}

    public void getAll(PageBean pageBean) throws Exception {
        int totalCount = this.getTotalCount();//总记录数
        pageBean.setTotalCount(totalCount);//填充总记录数

        /*
		 * 问题： jsp页面，如果当前页为首页，再点击上一页报错！
		 *              如果当前页为末页，再点下一页显示有问题！
		 * 解决：
		 * 	   1. 如果当前页 <= 0;       当前页设置当前页为1;
		 * 	   2. 如果当前页 > 最大页数；  当前页设置为最大页数
		 */
         // 判断
        if (pageBean.getPageCurrent() <=0) {
            pageBean.setPageCurrent(1);					    // 把当前页设置为1
        } else if (pageBean.getPageCurrent() > pageBean.getTotalPage()){
            pageBean.setPageCurrent(pageBean.getTotalPage());		// 把当前页设置为最大页数
        }

        int pageCurrent = pageBean.getPageCurrent();//当前页
        int index = (pageCurrent -1)*pageBean.getPageCount();//起始查询位置
        int count = pageBean.getPageCount();//每页显示的数量
        String sql = "select * from eu_tronclass limit ?,?";
        Object[] paramsValue = {index,count};
        List <TronClasstype> list = super.query(sql,paramsValue,TronClasstype.class);
        pageBean.setPageData(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println("getAll"+jsonArray);
    }

}



