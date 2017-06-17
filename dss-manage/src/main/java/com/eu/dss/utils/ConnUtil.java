package com.eu.dss.utils;

import java.sql.*;

/**
 * 数据库连接类
 * 马欢欢
 * Created by pc on 2017/05/16.
 */
public class ConnUtil {

    public static Connection getConnextion() {
         Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//1.加载数据库驱动

//            String url="jdbc:mysql://localhost:3306/eudsstest?useUnicode=true&characterEncoding=utf-8";//2.指定连接数据库的地址名称
//            String url="jdbc:mysql://39.108.72.222:3306/eudsstest?useUnicode=true&characterEncoding=utf-8";//远程数据库
            String url="jdbc:mysql://192.168.1.112:3306/eudsstest?useUnicode=true&characterEncoding=utf-8";//远程数据库
            String user="root";
            String passWord = "root";//指定用户名和密码

            conn= (Connection) DriverManager.getConnection(url,user,passWord);//3获取数据库连接

            if(null!=conn){//判断是否连接成功！
                System.out.println("恭喜！数据库连接成功！");
            }
        } catch (Exception e) {
            System.out.println("很遗憾！数据库连接失败！");
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(Statement stmt,Connection conn){
        if(null!=stmt){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if(null!=conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.print("关闭成功");
    }
    public static void close(ResultSet rs,PreparedStatement pstmt,Connection conn) {
        if (null!=rs){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if (null!=pstmt){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }if (null!=conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}