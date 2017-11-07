package com.eu.manage.web.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends HttpServlet {

    //创客访问量
    @RequestMapping("/tronClass")
    public String tronClass() {
        return "tronClass/tronClass";
    }

    //教学空间利用率
    @RequestMapping("/roomutilization")
    public String classUserRate() {
        return "roomutilization/roomutilization";
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

    @RequestMapping("/semesterClick")
    public String semesterClick() {
        return "semesterClick/semesterClick";
    }
}
