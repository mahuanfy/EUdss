package com.eu.manage.service.impl;

import com.eu.manage.dao.StudentNumberDao;
import com.eu.manage.entity.StudentNumber;
import com.eu.manage.service.StudentNumberService;
import com.eu.manage.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentNumberServiceImpl implements StudentNumberService {

    @Autowired
    private StudentNumberDao studentNumberDao;
    @Override
    public List<Map<String, Object>> queryStudentNumberInfo(PageUtil page,String grade) {
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("start",(page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", page.getPageSize());
        data.put("grade", grade);
        page.setTotalSize(studentNumberDao.queryStudentNumberInfoCount(data));
        return studentNumberDao.queryStudentNumberInfo(data);
    }

    @Override
    public void addStudentNumberInfo(StudentNumber studentNumber) {
        studentNumberDao.addStudentNumberInfo(studentNumber);
    }

    @Override
    public List<Map<String, Object>> queryStudentNumberInfoById(int id) {
        return studentNumberDao.queryStudentNumberInfoById(id);
    }

    @Override
    public void updateStudentNumberInfo(StudentNumber studentNumber) {
        studentNumberDao.updateStudentNumberInfo(studentNumber);
    }

    @Override
    public void deleteStudentNumberInfoById(int id) {
        studentNumberDao.deleteStudentNumberInfoById(id);
    }
}
