package com.eu.dss.action;


import com.eu.dss.entity.TronClasstype;
import com.eu.dss.servic.ITronClassService;
import com.eu.dss.servic.impl.TronClassService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 * Created 马欢欢 pc on 2017/5/20.
 */
@WebServlet(name = "TronClassServlet" ,urlPatterns = "/TronClassServlet")
public class TronClassAction extends HttpServlet {
   private ITronClassService tronClassService = new TronClassService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");

        if("tronClasstype".equals(method)){
            tronClasstypeFind(req,resp);
        }else
        if("save".equals(method)){
            save(req,resp);
        }
    }


    //查询
    protected void tronClasstypeFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<TronClasstype> tronClasstype = tronClassService.TronClasstypeFind();
        JSONArray jsonArray = JSONArray.fromObject(tronClasstype);
        resp.getWriter().print(jsonArray);
    }
    //保存
    protected void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TronClasstype tronClasstype = new TronClasstype();
        tronClasstype.setYear(req.getParameter("year"));
        tronClasstype.setTron_month(req.getParameter("tron_month"));
        tronClasstype.setEu_rj(Integer.parseInt(req.getParameter("eu_rj")));
        tronClasstype.setEu_xin(Integer.parseInt(req.getParameter("eu_xin")));
        tronClasstype.setEu_rw(Integer.parseInt(req.getParameter("eu_rw")));
        tronClasstype.setEu_ts(Integer.parseInt(req.getParameter("eu_ts")));
        tronClasstype.setEu_xiu(Integer.parseInt(req.getParameter("eu_xiu")));
        tronClasstype.setEu_gz(Integer.parseInt(req.getParameter("eu_gz")));
        tronClasstype.setEu_kuai(Integer.parseInt(req.getParameter("eu_kuai")));
        tronClasstype.setEu_ad(Integer.parseInt(req.getParameter("eu_ad")));
        tronClasstype.setEu_wc(Integer.parseInt(req.getParameter("eu_wc")));
        tronClasstype.setEu_wu(Integer.parseInt(req.getParameter("eu_wu")));
        tronClasstype.setEu_jr(Integer.parseInt(req.getParameter("eu_jr")));
         tronClassService.save(tronClasstype);
        resp.sendRedirect(req.getContextPath()+"/Admin/button.jsp");
    }


}


