package com.eu.manage.web.TronClass;

import com.eu.manage.entity.PageBean;
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

    @RequestMapping("/tronClass")
    @ResponseBody
    public Map<String, Object> tronClass(){
        Map<String, Object> result = new HashMap<String, Object>();
        List<TronClass> TronClass = tronClassService.tronClass();
        result.put("TronClass",TronClass);

        return result;
    }

    @RequestMapping("/insertProfession")
    @ResponseBody
    public Map<String, Object> insertProfession(PageUtil page){
        Map<String, Object> data = new HashMap<String, Object>();
        List<Map<String,String>> TronClass;
        try {
            TronClass = tronClassService.insertProfession(page);
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

}
