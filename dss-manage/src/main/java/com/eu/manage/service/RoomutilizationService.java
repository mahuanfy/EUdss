package com.eu.manage.service;

import com.eu.manage.entity.Roomutilization;
import com.eu.manage.utils.PageUtil;

import java.util.List;
import java.util.Map;

public interface RoomutilizationService {

    List<Map<String, Object>> showRoomutilization(PageUtil pageUtil, Roomutilization roomutilization);

    void addRoomutilization(Roomutilization roomutilization);

    List<Map<String,Object>> findRoomutilizationById(String id);

    void updateRoomutilization(Roomutilization roomutilization);
}
