package com.eu.manage.web.userInfo;

import com.eu.manage.dto.Result;
import com.eu.manage.entity.PageBean;
import com.eu.manage.entity.User;
import com.eu.manage.service.UserService;
import com.eu.manage.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
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
    public Map<String, Object> findSuperUser(PageBean pageBean,String username) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("UserInfo", userService.findUser(pageBean,username));
            result.put("totalPage", pageBean.getTotalPage());
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return result;
    }


    @RequestMapping("/findFirstUser")
    @ResponseBody
    public Map<String, Object> findFirstUser(PageBean pageBean,String username) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("UserInfo", userService.findUser(pageBean,username));
            result.put("totalPage", pageBean.getTotalPage());
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return result;
    }

    @RequestMapping("/findSecondUser")
    @ResponseBody
    public Map<String, Object> findSecondUser(PageBean pageBean,String username) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("UserInfo", userService.findUser(pageBean,username));
            result.put("totalPage", pageBean.getTotalPage());
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return result;
    }

    @RequestMapping("/findThirdUser")
    @ResponseBody
    public Map<String, Object> findThirdUser(PageBean pageBean,String username) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("UserInfo", userService.findUser(pageBean,username));
            result.put("totalPage", pageBean.getTotalPage());
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return result;
    }


    @RequestMapping("/insertUser")
    @ResponseBody
    public Result insertUser(User user) {
        try {
            userService.insertUser(user);
            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Map<String, Object> findById(int id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("user", userService.findById(id));
            result.put("msg", Constant.SEARCH_SUCCESS);
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", Constant.SEARCH_FAILURE);
        }

        return result;
    }

    @RequestMapping("/deleteById")
    @ResponseBody
    public Map<String, Object> deleteById(int id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            userService.deleteById(id);
            result.put("msg", Constant.DELETE_SUCCESS);
            result.put("result", true);
        } catch (Exception e) {
            new RuntimeException(e);
            result.put("msg", Constant.DELETE_FAILURE);
        }
        return result;
    }

    @RequestMapping("/insertUserById")
    @ResponseBody
    public Result insertUserById(User user) {
        try {
            userService.insertUser(user);

            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

    @RequestMapping("searchUserByName")
    @ResponseBody
    public Result searchUserByName(String username) {
        List<User> users;
        try {
            users = userService.searchUserByName(username);

            return Result.success(users, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            new RuntimeException(e);
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
