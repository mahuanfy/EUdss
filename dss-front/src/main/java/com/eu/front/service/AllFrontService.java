package com.eu.front.service;

import java.util.List;
import java.util.Map;

public interface AllFrontService {

    /**
     * 查询创课点击次数
     *
     */
    List<Map<String,String>> tronClass();


    List<Map<String,String>> queryStudentInfo();
}
