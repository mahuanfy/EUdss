package com.eu.manage.web;

import com.eu.manage.dto.Result;
import com.eu.manage.entity.User;
import com.eu.manage.service.LoginService;
import com.eu.manage.service.UserService;
import com.eu.manage.utils.Constant;
import com.eu.manage.utils.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created 马欢欢 pc on 2017/5/23.
 */
@Controller
@RequestMapping("")
public class LoginController extends HttpServlet {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/index")
    public String index() {
        return "/index";
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

    //判断是否有session
    @RequestMapping("/session")
    @ResponseBody
    public Map<String, Object> session(HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        Boolean haveSession=true;
        try {
            User user = (User) session.getAttribute("user");
            if(user == null){
                haveSession = false;
            }
            result.put("haveSession",haveSession);
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

    //用户信息
    @RequestMapping("/userInfo")
    @ResponseBody
    public Map<String, Object> userInfo(HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String username = ((User)session.getAttribute("user")).getUsername();
           User user = loginService.queryUserInfo(username);
            result.put("msg", Constant.ACCOUNT_OUT);
            result.put("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    //用户信息
    @RequestMapping("/updateInfoAjax")
    @ResponseBody
    public Map<String, Object> updateInfoAjax(User user) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            loginService.updateUserInfo(user);
            result.put("msg", Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", Constant.UPDATE_FAILURE);
        }

        return result;
    }

    @RequestMapping("/updateImage")
    @ResponseBody
    public Result updateImage(MultipartFile file, HttpServletRequest request) {
        try {
            String imgPath = ImgUtil.saveImg(file, request.getServletContext().getRealPath("/images") + Constant.USER_IMAGE_PATH);
            String imgName = imgPath.substring(imgPath.lastIndexOf("/"));

            return Result.success(imgName, Constant.UPLOAD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }


}
