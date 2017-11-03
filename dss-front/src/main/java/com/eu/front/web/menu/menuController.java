package com.eu.front.web.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("/menuFront")
public class menuController extends HttpServlet {

    @RequestMapping("/tronClass")
    public String tronClass() {
        return "tronClassFront/tronClass";
    }
    @RequestMapping("/professionalDiscipline")
    public String superUserInfo() {
        return "professionalDisciplineFront/professionalDiscipline";
    }
    @RequestMapping("/studentNumber")
    public String firstUserInfo() {
        return "studentNumber/studentNumber";
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
