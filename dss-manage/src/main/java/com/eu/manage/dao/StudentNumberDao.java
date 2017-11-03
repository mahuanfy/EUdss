package com.eu.manage.dao;
import com.eu.manage.entity.StudentNumber;
import java.util.List;
import java.util.Map;

public interface StudentNumberDao {

    List<Map<String,Object>> queryStudentNumberInfo(Map<String,Object> data);

    Long queryStudentNumberInfoCount(Map<String,Object> data);

    void addStudentNumberInfo(StudentNumber studentNumber);

    List<Map<String,Object>> queryStudentNumberInfoById(int id);

    void updateStudentNumberInfo(StudentNumber studentNumber);

    void deleteStudentNumberInfoById(int id);

}
