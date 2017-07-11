package com.eu.dss.web.UserInfo;

import com.eu.dss.entity.UserBean;
import com.eu.dss.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("/UserInfo")
public class UserInfoController extends HttpServlet {
    @Autowired
    private IUserService userService;
    @RequestMapping("/index")
    public String index() {
        return "redirect:/public/index.jsp";
    }
    @RequestMapping("/login")
    @ResponseBody
    public  Map<String ,Object> login( HttpSession session, UserBean userBean) {
        Map<String ,Object> result = new HashMap<String, Object>();

        UserBean user = userService.login(userBean);
        if (user !=null) {

            session.setAttribute("user", user);
            result.put("success",true);

        }else {
            result.put("success",false);
        }
        return result;
    }

    //权限
    @RequestMapping("/rank")
    @ResponseBody
    public Map<String ,Object> rank(HttpSession session) {
        Map<String ,Object> result = new HashMap<String, Object>();
        try {
            UserBean userBean = (UserBean) session.getAttribute("user");

            result.put("rank",userBean.getRank());
        }catch (Exception e){
            e.printStackTrace();
        }

    return result;
    }


}
