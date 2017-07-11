package com.eu.dss.web.TronClass;

import com.eu.dss.entity.PageBean;
import com.eu.dss.entity.TronClass;
import com.eu.dss.service.TronClassService;
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
    public Map<String, Object> insertProfession(PageBean pageBean){
        Map<String, Object> result = new HashMap<String, Object>();
        List<TronClass> TronClass = null;
        try {
            TronClass = tronClassService.insertProfession(pageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("TronClass",TronClass);

        return result;
    }

}
