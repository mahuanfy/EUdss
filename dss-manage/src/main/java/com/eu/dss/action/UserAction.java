package com.eu.dss.action;

import com.eu.dss.entity.UserBean;
import com.eu.dss.servic.IUserServic;
import com.eu.dss.servic.impl.Userservic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@WebServlet(name = "UserAction" ,urlPatterns = "/UserAction")
public class UserAction extends HttpServlet {
    private IUserServic userServic = new Userservic();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if ("login".equals(method)) {
            login(req, resp);
        } else if ("register".equals(method)) {
            register(req, resp);
        } else if ("check".equals(method)) {
            check(req, resp);
        }
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        userBean.setUsername(username);
        userBean.setPassword(password);

        req.setAttribute("user", userBean);
        if (userServic.login(userBean) == 1) {
            resp.sendRedirect(req.getContextPath() + "/Admin/index1.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");

        }
    }

    protected void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        userBean.setUsername(username);
        userBean.setPassword(password);

    }

    protected void check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}