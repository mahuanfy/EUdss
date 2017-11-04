package com.eu.manage.web.roomutilization;

import com.eu.manage.dto.Result;
import com.eu.manage.entity.Roomutilization;
import com.eu.manage.service.RoomutilizationService;
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
@RequestMapping("roomutilization")
public class RoomutilizationController {

    @Autowired
    RoomutilizationService roomutilizationService;

    @RequestMapping("list")
    @ResponseBody
    public Result list(PageUtil pageUtil, Roomutilization roomutilization) {
        try{
            System.out.println("传进来的数据："+roomutilization);
            System.out.println("传进来的数据："+pageUtil);
            Map<String, Object> roomutilizationInfo = new HashMap<>();
            List<Map<String, Object>> data = roomutilizationService.showRoomutilization(pageUtil,roomutilization);
            System.out.println("查询出来的数据：" + data);

            roomutilizationInfo.put("data", data);
            roomutilizationInfo.put("totalSize", pageUtil.getTotalSize());
            return Result.success(roomutilizationInfo, Constant.SEARCH_SUCCESS);

        }catch (Exception e){
            e.printStackTrace();
        }

        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
}
