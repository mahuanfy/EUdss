package com.eu.front.dao;

import java.util.List;

public interface TestMapper {
    /**
     *
     * @Title: selectPwdByName
     * @Description: 根据用户查询密码
     * @param username
     * @return String    返回类型
     * @throws
     */
    String selectPwdByName(String username);
    /**
     *
     * @Title: selectRolesByName
     * @Description: 根据用户账号查询角色集合
     * @param username
     * @return List<String> 返回类型
     * @throws
     */
    List<String> selectRolesByName(String userName);
    /**
     *
     * @Title: selectPermissionsByName
     * @Description: 根据用户账号查询用戶權限集合标识
     * @param @param userName
     * @return List<String> 返回类型
     * @throws
     */
    List<String> selectHasPermissionsByName(String userName);
    /**
     *
     * @Title: selectUserInfoByName
     * @Description: 根据用户名查询用户
     * @param @param username
     * @return UserInfo    返回类型
     * @throws
     */
    UserInfo selectUserInfoByName(String username);
}
