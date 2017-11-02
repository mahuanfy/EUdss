package com.eu.manage.service;

import com.eu.manage.entity.StudentNumber;
import com.eu.manage.utils.PageUtil;

import java.util.List;
import java.util.Map;

public interface studentNumberService {

    List<Map<String,Object>> queryStudentNumberInfo(PageUtil pageUtil);

    Long queryStudentNumberInfoCount(Map<String,Object> data);

    void addStudentNumberInfo(StudentNumber studentNumber);

    List<Map<String,Object>> queryStudentNumberInfoById(int id);

    void updateStudentNumberInfo(StudentNumber studentNumber);

    void deleteStudentNumberInfoById(int id);
}
