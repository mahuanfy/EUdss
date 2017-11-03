package com.eu.manage.service;

import com.eu.manage.entity.Roomutilization;
import com.eu.manage.utils.PageUtil;

import java.util.List;
import java.util.Map;

public interface RoomutilizationService {

    List<Map<String, Object>> showRoomutilization(PageUtil pageUtil, Roomutilization roomutilization);
}
