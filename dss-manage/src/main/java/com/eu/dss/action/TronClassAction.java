package com.eu.dss.action;


import com.eu.dss.entity.TronClassBean;
import com.eu.dss.servic.ITronClassService;
import com.eu.dss.servic.impl.TronClassService;
import com.eu.dss.entity.PageBean;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created 马欢欢 pc on 2017/5/20.
 */
@WebServlet(name = "TronClassServlet", urlPatterns = "/TronClassServlet")
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

        if ("save".equals(method)) {
            save(req, resp);
        } else if ("pool".equals(method)) {
            pool(req, resp);
        } else if ("pages".equals(method)) {
            pages(req, resp);
        }

    }


    /**
     * 查出创课信息
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void tronClasstypeFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<TronClassBean> tronClasstype = tronClassService.TronClasstypeFind();
        JSONArray jsonArray = JSONArray.fromObject(tronClasstype);
        resp.getWriter().print(jsonArray);
    }

    /**
     * 保存创客信息
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TronClassBean tronClasstype = new TronClassBean();
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
        resp.sendRedirect(req.getContextPath() + "/Admin/web/TronClass/tronClass.jsp");
    }

    /**
     * 查询分页显示
     */
    protected void pool(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PageBean pageBean = new PageBean();
        int pageCurrent = Integer.parseInt(req.getParameter("curr"));
//        int pageCurrent=1;
        pageBean.setPageCurrent(pageCurrent);

        List<TronClassBean> TronClasstypelist = tronClassService.getAll(pageBean);

        List<Object> list = new ArrayList<Object>();
        list.add(TronClasstypelist);
        list.add(pageBean);
        JSONArray jsonArray = JSONArray.fromObject(list);
        resp.getWriter().print(jsonArray);
        System.out.println("servlet" + jsonArray);
    }

    protected void pages(HttpServletRequest req, HttpServletResponse resp) {
        PageBean pageBean = new PageBean();
        tronClassService.getAll(pageBean);
        System.out.println("99999:"+pageBean.getTotalPage());
        req.getSession().setAttribute("pages",pageBean.getTotalPage());

        try {
            resp.getWriter().print(pageBean.getTotalPage());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}


