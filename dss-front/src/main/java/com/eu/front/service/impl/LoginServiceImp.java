package com.eu.front.service.impl;

import java.util.List;

public class LoginServiceImp {
    @Override
    public String selectPwdByName(String userName) {
        return sysManageMapper.selectPwdByName(userName);
    }
    @Override
    public List selectRolesByName(String userName) {
        return sysManageMapper.selectRolesByName(userName);
    }
    @Override
    public List selectHasPermissionsByName(String userName) {
        return sysManageMapper.selectHasPermissionsByName(userName);
    }
    @Override
    public UserInfo selectUserInfoByName(String username) {
        return sysManageMapper.selectUserInfoByName(username);
    }
}
