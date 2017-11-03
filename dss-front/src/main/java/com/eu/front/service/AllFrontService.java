package com.eu.front.service;

import java.util.List;
import java.util.Map;

public interface AllFrontService {

    /**
     * 创客数据查询
     * @return
     */
    List<Map<String,String>> tronClass();

    /**
     * 查询年级学生人数
     * @return
     */
    List<Map<String,String>> queryStudentInfo();
}
