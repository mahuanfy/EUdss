package com.eu.manage.web;

import com.eu.manage.entity.User;
import com.eu.manage.service.LoginService;
import com.eu.manage.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("/login")
public class LoginController extends HttpServlet {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/index")
    public String index() {
        return "redirect:/public/index.jsp";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(HttpSession session, User user) {
        Map<String, Object> result = new HashMap<String, Object>();

        User userInfo = loginService.login(user);
        if (userInfo != null) {

            session.setAttribute("user", userInfo);
            result.put("success", true);

        } else {
            result.put("success", false);
        }
        return result;
    }

    //权限
    @RequestMapping("/rank")
    @ResponseBody
    public Map<String, Object> rank(HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            User user = (User) session.getAttribute("user");

            result.put("rank", user.getRank());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    //登出
    @RequestMapping("/out")
    @ResponseBody
    public Map<String, Object> out(HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            session.removeAttribute("user");
            result.put("msg", Constant.ACCOUNT_OUT);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


}
