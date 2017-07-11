package com.eu.dss.web.UserInfo;

import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.User;
import com.eu.dss.service.UserService;
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

    @RequestMapping("/findUser")
    @ResponseBody
    public Map<String, Object> findUser(PageBean pageBean) {
        System.out.println("=================="+pageBean);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("UserInfo",userService.findUser(pageBean));
        result.put("totalPage",pageBean.getTotalPage());

        System.out.println("-----------------------"+pageBean);

        return result;

    }



    @RequestMapping("/insertUser")
    @ResponseBody
    public Map<String, Object> insertUser(User user) {
        Map<String, Object> result = new HashMap<String, Object>();
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd ");//可以方便地修改日期格式
        String date = dateFormat.format( now );
        System.out.println("++++++++++++++++++++"+date);
        return result;

    }


}
