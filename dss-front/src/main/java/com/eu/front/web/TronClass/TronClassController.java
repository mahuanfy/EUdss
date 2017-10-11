package com.eu.front.web.TronClass;

import com.eu.front.entity.TronClass;
import com.eu.front.service.TronClassService;
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
@RequestMapping("/TronClassFront")
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

}
