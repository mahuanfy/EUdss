package com.eu.manage.web.tronClass;

import com.eu.manage.entity.TronClass;
import com.eu.manage.service.TronClassService;
import com.eu.manage.utils.Constant;
import com.eu.manage.utils.PageUtil;
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
@RequestMapping("/tronClass")
public class TronClassController {

    @Autowired
    private TronClassService tronClassService;

    @RequestMapping("/insertProfession")
    @ResponseBody
    public Map<String, Object> insertProfession(PageUtil page,String year,String month) {
        Map<String, Object> data = new HashMap<String, Object>();
        List<Map<String, String>> TronClass;
        try {
            TronClass = tronClassService.insertProfession(page,year,month);
            data.put("TronClass", TronClass);
            data.put("page", page);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("/addTronClass")
    @ResponseBody
    private Map<String, Object> addTronClass(TronClass tronClass) {
        Map<String, Object> data = new HashMap<String, Object>();

        try {
            tronClassService.addTronClass(tronClass);
            data.put("msg", Constant.ADD_SUCCESS);
            data.put("result",true);
        } catch (Exception e) {
            data.put("msg", Constant.ADD_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("/queryTronClass")
    @ResponseBody
    private Map<String, Object> queryTronClass(int id) {
        Map<String, Object> data = new HashMap<String, Object>();

        try {
            List<Map<String, Object>> info = tronClassService.queryTronClass(id);
            data.put("info", info);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("/updateTronClass")
    @ResponseBody
    private Map<String, Object> updateTronClass(TronClass tronClass) {
        Map<String, Object> data = new HashMap<String, Object>();

        try {
            tronClassService.updateTronClass(tronClass);
            data.put("msg", Constant.UPDATE_SUCCESS);
            data.put("result",true);
        } catch (Exception e) {
            data.put("msg", Constant.UPDATE_FAILURE);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("/deleteTronClass")
    @ResponseBody
    private Map<String ,Object> deleteTronClass(int id){
        Map<String ,Object> data = new HashMap<String, Object>();

        try{
            tronClassService.deleteTronClass(id);
            data.put("msg",Constant.DELETE_SUCCESS);
            data.put("result",true);
        }catch(Exception e){
            data.put("msg",Constant.DELETE_FAILURE);
            e.printStackTrace();
        }

        return data;
    }
}
