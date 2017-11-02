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

    //创客访问量
    @RequestMapping("/tronClass")
    public String tronClass() {
        return "tronClass/tronClass";
    }

    //教室利用率
    @RequestMapping("/classUserRate")
    public String classUserRate() {
        return "UserRate/classUserRate/classUserRate";
    }

    //工作室利用率
    @RequestMapping("/studioClassFront")
    public String studioClassFront() {
        return "UserRate/studioClassFront/studioClassFront";
    }

    //学籍异动
    @RequestMapping("/leaveReason")
    public String leaveReason() {
        return "schoolChange/leaveReason/leaveReason";
    }

    //权限菜单
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
        return "userInfo/thirdUserInfo";
    }

    @RequestMapping("/studentNumber")
    public String studentNumber() {
        return "studentNumber/studentNumber";
    }


}
