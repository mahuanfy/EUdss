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
 * Created by pc on 2017/5/16.
 */
@WebServlet(name = "TronClassServlet" ,urlPatterns = "/TronClassServlet")
public class TronClassServlet extends HttpServlet {
   private ITronClassService tronClassService = new TronClassService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        tronClasstype(req,resp);

    }
    protected void tronClasstype(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List <TronClasstype> tronClasstype = tronClassService.TronClasstype();
//        resp.getWriter().print(tronClasstype);
//        System.out.println(tronClasstype);
        JSONArray jsonArray = JSONArray.fromObject(tronClasstype);
//        resp.setHeader("Cache-Control","no-cache");
//        resp.setContentType("aplication/json;charset=UTF-8");
        resp.getWriter().print(jsonArray);
        for(Object t : jsonArray){
            System.out.println(t);

        }

    }

}
