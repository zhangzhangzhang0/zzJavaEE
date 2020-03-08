package com.java.code.class12.jdbc;

import com.java.code.class12.model.StudentHomework;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**

 * StudentHomework 查操作

 **/
//调用base类中的方法进行增和查操作
public class StudentHomeworkJdbc extends base {
    public static void main(String[] args) {
        List<StudentHomework> list = selectAll();

        for (StudentHomework sh : list){
            System.out.println(sh.getHomeworkContent());
        }
    }
    //学生上交作业
    public int addHomework(StudentHomework sh){
        String str="INSERT INTO `s_student_homework`(student_id,homework_id,homework_title,homework_content,create_time) VALUE(?,?,?,?,?)";
        Timestamp ts = new Timestamp(sh.getCreateTime().getTime());

        return executeUpdate(str, new Object[]{sh.getStudentId(),sh.getHomeworkId(),sh.getHomeworkTitle(),sh.getHomeworkContent(),ts});
    }

    //读取数据库中 s_student_homework表
    public static List<StudentHomework> selectAll(){
        String url = "jdbc:mysql://127.0.0.1:3306/j1?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT";
        String driverName = "com.mysql.cj.jdbc.Driver";
        String sqlString = "SELECT * FROM j1.s_student_homework";
        try {
            // 加载驱动
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        List<StudentHomework> list = new ArrayList<>();

        try(Connection connection =  DriverManager.getConnection(url, "root","123456");) {
            try(Statement statement = connection.createStatement()){
                try(ResultSet resultSet = statement.executeQuery(sqlString)){
                    // 获取执行结果
                    while (resultSet.next()){
                        StudentHomework sh = new StudentHomework();
                        sh.setId(resultSet.getLong("id"));
                        sh.setStudentId(resultSet.getLong("student_id"));
                        sh.setHomeworkId(resultSet.getLong("homework_id"));
                        sh.setHomeworkTitle(resultSet.getString("homework_title"));
                        sh.setHomeworkContent(resultSet.getString("homework_content"));
                        sh.setCreateTime(resultSet.getTimestamp("create_time"));
                        list.add(sh);

                    }

                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
}