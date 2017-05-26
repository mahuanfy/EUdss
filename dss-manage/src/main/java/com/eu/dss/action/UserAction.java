package com.eu.dss.action;

import com.eu.dss.entity.UserBean;
import com.eu.dss.servic.IUserServic;
import com.eu.dss.servic.impl.Userservic;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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
        }else if ("rank".equals(method)) {
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
            if(jsonArray.getJSONObject(0).get("rank").toString().equals("1")){
                System.out.println(1111111);
            }else{
                System.out.println(jsonArray.getJSONObject(0).get("rank")+"ssss");
            }

            resp.sendRedirect(req.getContextPath() + "/Admin/index1.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");

        }
    }
// 注册
    protected void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String nickname = req.getParameter("nickname");
        String passwordVerify = req.getParameter("passwordVerify");
        String sex = req.getParameter("sex");
        userBean.setUsername(username);
        userBean.setPassword(password);
        userBean.setNickname(nickname);
        userBean.setSex(sex);
        userServic.register(userBean);
    }
//验证用户名是否存在
    protected void check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    //权限
    protected void rank(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(111122233);
            HttpSession session = req.getSession();
        JSONArray jsonArray = (JSONArray) session.getAttribute("user");
        resp.getWriter().print(jsonArray.getJSONObject(0).get("rank"));
    }
}