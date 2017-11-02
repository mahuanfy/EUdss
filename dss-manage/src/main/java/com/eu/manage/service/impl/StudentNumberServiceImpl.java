package com.eu.manage.service.impl;

import com.eu.manage.dao.StudentNumberDao;
import com.eu.manage.entity.StudentNumber;
import com.eu.manage.service.studentNumberService;
import com.eu.manage.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentNumberServiceImpl implements studentNumberService {

    @Autowired
    private StudentNumberDao studentNumberDao;
    @Override
    public List<Map<String, Object>> queryStudentNumberInfo(PageUtil page) {
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("start",(page.getCurrentIndex() - 1) * page.getPageSize());
        return null;
    }

    @Override
    public Long queryStudentNumberInfoCount(Map<String, Object> data) {
        return null;
    }

    @Override
    public void addStudentNumberInfo(StudentNumber studentNumber) {

    }

    @Override
    public List<Map<String, Object>> queryStudentNumberInfoById(int id) {
        return null;
    }

    @Override
    public void updateStudentNumberInfo(StudentNumber studentNumber) {

    }

    @Override
    public void deleteStudentNumberInfoById(int id) {

    }
}
