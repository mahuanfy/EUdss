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
        return "TronClass/tronClass";
    }
    @RequestMapping("/superUserInfo")
    public String superUserInfo() {
        return "UserInfo/superUserInfo";
    }
    @RequestMapping("/firstUserInfo")
    public String firstUserInfo() {
        return "UserInfo/firstUserInfo";
    }
    @RequestMapping("/secondUserInfo")
    public String secondUserInfo() {
        return "UserInfo/secondUserInfo";
    }
    @RequestMapping("/thirdUserInfo")
    public String thirdUserInfo() {
        return "UserInfo/thirdUserInfo";
    }



}
