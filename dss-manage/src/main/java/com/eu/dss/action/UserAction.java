package com.eu.dss.action;

import com.eu.dss.entity.UserBean;
import com.eu.dss.service.IUserService;
import com.eu.dss.service.impl.UserService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@WebServlet(name = "UserAction" ,urlPatterns = "/UserAction")
public class UserAction extends HttpServlet {
    private IUserService userServic = new UserService();

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
            System.out.println(121212);
            login(req, resp);
        } else if ("rank".equals(method)) {
            rank(req, resp);
        }
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        userBean.setUsername(username);
        userBean.setPassword(password);
        if (userServic.login(userBean) !=null) {
            JSONArray jsonArray = JSONArray.fromObject(userServic.login(userBean));
            req.getSession().setAttribute("user",jsonArray);
            resp.sendRedirect(req.getContextPath() + "/public/index.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
    //权限
    protected void rank(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
        JSONArray jsonArray = (JSONArray) session.getAttribute("user");
        resp.getWriter().print(jsonArray.getJSONObject(0).get("rank"));
    }
}
