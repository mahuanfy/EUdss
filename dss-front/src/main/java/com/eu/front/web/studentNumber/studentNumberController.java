package com.eu.front.web.studentNumber;

import com.eu.front.service.AllFrontService;
import com.eu.front.utils.Constant;
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
@RequestMapping("/studentNumberFront")
public class studentNumberController {

    @Autowired
    private AllFrontService allFrontService;

    @RequestMapping("/queryStudentInfo")
    @ResponseBody
    public Map<String, Object> queryStudentInfo(){
        Map<String, Object> data = new HashMap<String, Object>();
        List<Map<String,String>> studentInfo;
        try {
            studentInfo = allFrontService.queryStudentInfo();
            data.put("studentInfo", studentInfo);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }
        return data;
    }
}
