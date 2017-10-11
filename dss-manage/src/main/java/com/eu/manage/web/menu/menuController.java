package com.eu.manage.web.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("/menu")
public class menuController extends HttpServlet {

    @RequestMapping("/tronClass")
    public String tronClass() {
        return "tronClass/tronClass";
    }
    @RequestMapping("/superUserInfo")
    public String superUserInfo() {
        return "userInfo/superUserInfo";
    }
    @RequestMapping("/firstUserInfo")
    public String firstUserInfo() {
        return "userInfo/firstUserInfo";
    }
    @RequestMapping("/secondUserInfo")
    public String secondUserInfo() {
        return "userInfo/secondUserInfo";
    }
    @RequestMapping("/thirdUserInfo")
    public String thirdUserInfo() {
        return "UserInfo/thirdUserInfo";
    }



}
