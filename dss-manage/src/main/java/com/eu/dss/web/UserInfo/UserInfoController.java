package com.eu.dss.web.UserInfo;

import com.eu.dss.dto.Result;
import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.User;
import com.eu.dss.service.UserService;
import com.eu.dss.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 马欢欢 on 17-7-11.
 */
@Controller
@RequestMapping("UserInfo")
public class UserInfoController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findSuperUser")
    @ResponseBody
    public Map<String, Object> findSuperUser(PageBean pageBean) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("UserInfo",userService.findUser(pageBean));
        result.put("totalPage",pageBean.getTotalPage());

        return result;
    }


    @RequestMapping("/findFirstUser")
    @ResponseBody
    public Map<String, Object> findFirstUser(PageBean pageBean) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("UserInfo",userService.findUser(pageBean));
        result.put("totalPage",pageBean.getTotalPage());

        return result;
    }

    @RequestMapping("/findSecondUser")
    @ResponseBody
    public Map<String, Object> findSecondUser( PageBean pageBean) {

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("UserInfo",userService.findUser(pageBean));
        result.put("totalPage",pageBean.getTotalPage());

        return result;
    }
    @RequestMapping("/findThirdUser")
    @ResponseBody
    public Map<String, Object> findThirdUser(PageBean pageBean) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("UserInfo",userService.findUser(pageBean));
        result.put("totalPage",pageBean.getTotalPage());

        return result;
    }


    @RequestMapping("/insertUser")
    @ResponseBody
    public Result insertUser(User user) {
        try {
            userService.insertUser(user);
            return Result.success(null, Constant.UPDATE_SUCCESS);
        }catch (Exception e){
            new  RuntimeException(e);
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }


}
