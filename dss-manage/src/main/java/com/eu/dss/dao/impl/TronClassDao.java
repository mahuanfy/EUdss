package com.eu.dss.dao.impl;

import com.eu.dss.dao.ITronClassDao;
import com.eu.dss.entity.TronClassBean;
import com.eu.dss.utils.BaseDaoUtil;
import com.eu.dss.utils.ConnUtil;
import com.eu.dss.utils.PageBean;
import net.sf.json.JSONArray;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 * Created by 马欢欢 on 2017/5/23.
 */
public class TronClassDao extends BaseDaoUtil implements ITronClassDao  {

    public List<TronClassBean> tronclassBean() {
        String sql = " SELECT * FROM eu_tronclass limit ?,?; ";
        Object[] paramsValue ={0,10};
        List <TronClassBean> list = super.query(sql,paramsValue,TronClassBean.class);
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println("bbbb"+jsonArray);
        return list;
    }

    public TronClassBean findByid(int id) {
        String sql = " SELECT * FROM eu_tronclass where id=? ; ";
        List <TronClassBean> list = super.query(sql,new Object[id],TronClassBean.class);
        return (list!=null && list.size()>0) ? list.get(0) : null;
    }

    public void save(TronClassBean TronClassBean) {
        String sql = " INSERT INTO eu_tronclass (year,tron_month,eu_rj,eu_xin,eu_rw,eu_ts,eu_xiu,eu_gz,eu_kuai,eu_ad,eu_wc,eu_wu,eu_jr) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?); ";
        Object[] paramsValue = {TronClassBean.getYear(),TronClassBean.getTron_month(),
                TronClassBean.getEu_rj(),   TronClassBean.getEu_xin(),
                TronClassBean.getEu_rw(),   TronClassBean.getEu_ts(),
                TronClassBean.getEu_xiu(),  TronClassBean.getEu_gz(),
                TronClassBean.getEu_kuai(), TronClassBean.getEu_ad(),
                TronClassBean.getEu_wc(),   TronClassBean.getEu_wu(),
                TronClassBean.getEu_jr()};
        super.update(sql,paramsValue);
    }

    public void update(TronClassBean TronClassBean ) {
        String sql = " UPDATE eu_tronclass SET year = ?,tron_month =?,eu_rj =?," +
                "eu_xin =?,eu_rw=?,eu_ts=?,eu_xiu=?,eu_gz=?,eu_kuai=?," +
                "eu_ad=?,eu_wc=?,eu_wu=?,eu_jr=? where id=?";
        Object[] paramsValue = {TronClassBean.getYear(),TronClassBean.getTron_month(),
                TronClassBean.getEu_rj(),   TronClassBean.getEu_xin(),
                TronClassBean.getEu_rw(),   TronClassBean.getEu_ts(),
                TronClassBean.getEu_xiu(),  TronClassBean.getEu_gz(),
                TronClassBean.getEu_kuai(), TronClassBean.getEu_ad(),
                TronClassBean.getEu_wc(),   TronClassBean.getEu_wu(),
                TronClassBean.getEu_jr(),   TronClassBean.getId()};
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
        List <TronClassBean> list = super.query(sql,paramsValue,TronClassBean.class);
        pageBean.setPageData(list);
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println("getAll"+jsonArray);
    }

}



