package com.eu.manage.dao;

import com.eu.manage.entity.Roomutilization;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoomutilizationDao {
    List<Map<String,Object>> showRoomutilization(Map<String,Object> data);

    Long selectTotalSize(@Param("roomutilization") Roomutilization roomutilization);
}
