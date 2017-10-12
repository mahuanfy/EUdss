package com.eu.front.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

public class LoginController2 {
    @RequestMapping(value="login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam("userName") String username, @RequestParam("pwd") String pwd, @RequestParam("autoLogin") String autoLogin, @RequestParam("remember") String remember){
        Map<String, Object> oMap = new HashMap<String, Object>();
        Map<String, Object> errorInfo = new HashMap<String, Object>();
        //得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
        try {
            //登录，即身份验证
            if (!subject.isAuthenticated()) {//判断时候已经登录
                subject.login(token);
            }
            //处理登录后信息保存
            UserInfo userinfo = loginService.selectUserInfoByName(username);
            Session session = subject.getSession();
            session.setAttribute(SessionConstant.LOGIN_USER_INFO, userinfo);
            LOGGER.info("账号密码登录验证------------------------success");
            oMap.put("success", "success");
        } catch (UnknownAccountException e) {
            LOGGER.info("------------------账号不存在--------------");
            errorInfo.put("userName", "账号不存在");
            oMap.put("errorInfo", errorInfo);
            oMap.put("success", "error");
            return oMap;
        } catch (IncorrectCredentialsException e) {
            LOGGER.info("------------------密码错误--------------");
            errorInfo.put("pwd", "密码错误");
            oMap.put("errorInfo", errorInfo);
            oMap.put("success", "error");
            return oMap;
        } catch (ShiroException e) {
            LOGGER.info("------------------账号密码错误--------------");
            errorInfo.put("pwd", "密码错误");
            errorInfo.put("userName", "账号错误");
            oMap.put("errorInfo", errorInfo);
            oMap.put("success", "error");
            return oMap;
        }
        return oMap;
    }
}
