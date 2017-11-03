package com.eu.manage.web.roomutilization;

import com.eu.manage.dto.Result;
import com.eu.manage.entity.Roomutilization;
import com.eu.manage.service.RoomutilizationService;
import com.eu.manage.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("roomutilization")
public class RoomutilizationController {

    @Autowired
    RoomutilizationService roomutilizationService;

    @RequestMapping("/list")
    @ResponseBody
    public Result list(PageUtil pageUtil, Roomutilization roomutilization) {
        try{
            List<Map<String, Object>> data = roomutilizationService.showRoomutilization(pageUtil,roomutilization);
            return Result.success();

        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }
}
