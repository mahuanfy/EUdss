package com.eu.manage.web.studentNumber;

import com.eu.manage.entity.StudentNumber;
import com.eu.manage.service.StudentNumberService;
import com.eu.manage.utils.Constant;
import com.eu.manage.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/studentNumber")
public class StudentNumberController {
    @Autowired
    private StudentNumberService studentNumberService;

    @RequestMapping("list")
    @ResponseBody
    public Map<String,Object> queryStudentNumberInfo(PageUtil page,String grade){
        Map<String,Object> data = new HashMap<String, Object>();
        List<Map<String,Object>> studentInfo ;

        try{
            studentInfo = studentNumberService.queryStudentNumberInfo(page, grade);
            data.put("studentInfo",studentInfo);
            data.put("page",page);
            data.put("result",true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        }catch(Exception e){
            data.put("msg",Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("add")
    @ResponseBody
    public Map<String,Object> addStudentNumberInfo(StudentNumber studentNumber){
        Map<String,Object> data = new HashMap<String,Object>();

        try{
            studentNumberService.addStudentNumberInfo(studentNumber);
            data.put("result",true);
            data.put("msg",Constant.ADD_SUCCESS);
        }catch(Exception e){
            data.put("msg",Constant.ADD_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("queryById")
    @ResponseBody
    public Map<String ,Object> queryStudentNumberInfoById(int id){
        Map<String,Object> data = new HashMap<String,Object>();
        List<Map<String,Object>> studentInfo ;

        try{
            studentInfo = studentNumberService.queryStudentNumberInfoById(id);
            data.put("studentInfo",studentInfo);
            data.put("result",true);
            data.put("msg",Constant.SEARCH_SUCCESS);
        }catch(Exception e){
            data.put("msg",Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("update")
    @ResponseBody
    public Map<String ,Object> updateStudentNumberInfo(StudentNumber studentNumber){
        Map<String,Object> data = new HashMap<String,Object>();

        try{
            studentNumberService.updateStudentNumberInfo(studentNumber);
            data.put("result",true);
            data.put("msg",Constant.UPDATE_SUCCESS);
        }catch(Exception e){
            data.put("msg",Constant.UPDATE_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map<String ,Object> deleteStudentNumberInfoById(int id){
        Map<String,Object> data = new HashMap<String,Object>();

        try{
            studentNumberService.deleteStudentNumberInfoById(id);
            data.put("result",true);
            data.put("msg",Constant.DELETE_SUCCESS);
        }catch(Exception e){
            data.put("msg",Constant.DELETE_FAILURE);
            e.printStackTrace();
        }

        return data;
    }
}
