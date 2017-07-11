package com.eu.dss.web.menu;

import com.eu.dss.entity.UserBean;
import com.eu.dss.service.IUserService;
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
@RequestMapping("/menu")
public class menuController extends HttpServlet {
    @Autowired
    private IUserService userService;

    @RequestMapping("/tronClass")
    public String tronClass() {
        return "TronClass/tronClass";
    }
    @RequestMapping("/userInfo")
    public String userInfo() {
        return "UserInfo/userInfo";
    }



}
