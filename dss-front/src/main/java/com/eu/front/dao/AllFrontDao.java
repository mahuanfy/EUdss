package com.eu.front.dao;

import java.util.List;
import java.util.Map;

public interface AllFrontDao {
    /**
     * 查询创课点击次数
     *
     */
    List<Map<String,String>> tronClass();

    List<Map<String,String>> queryStudentInfo();
}
