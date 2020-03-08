package com.java.code.class12.jdbc;

import com.java.code.class12.model.Homework;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**

 * Homework 操作

 **/
//调用base类中的方法进行增和查操作
public class HomeworkJdbc extends base {
    public static void main(String[] args) {
        List<Homework> list = selectAll();

        for (Homework h : list){
            System.out.println(h.getHomeworkContent());
        }
    }

    //老师增加作业
    public int addHomework(Homework h){
        String str="INSERT INTO `s_homework`(title,content,create_time) VALUE(?,?,?)";
        //Date转为Timestamp
        Timestamp ts = new Timestamp(h.getCreateTime().getTime());

        return executeUpdate(str, new Object[]{h.getHomeworkTitle(),h.getHomeworkContent(),ts});
    }

    //读取数据库中 s_homework表
    public static List<Homework> selectAll(){
        String url = "jdbc:mysql://127.0.0.1:3306/j1?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT";
        String driverName = "com.mysql.cj.jdbc.Driver";
        String sqlString = "SELECT * FROM j1.s_homework";
        try {
            // 加载驱动
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        List<Homework> list = new ArrayList<>();

        try(Connection connection =  DriverManager.getConnection(url, "root","123456");) {
            try(Statement statement = connection.createStatement()){
                try(ResultSet resultSet = statement.executeQuery(sqlString)){
                    // 获取执行结果
                    while (resultSet.next()){
                        Homework h = new Homework();
                        h.setId(resultSet.getLong("id"));
                        h.setHomeworkTitle(resultSet.getString("title"));
                        h.setHomeworkContent(resultSet.getString("content"));
                        h.setCreateTime(resultSet.getTimestamp("create_time"));
                        list.add(h);

                    }

                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}
