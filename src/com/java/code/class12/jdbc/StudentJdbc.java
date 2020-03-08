package com.java.code.class12.jdbc;
import com.java.code.class12.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**

 * Student 查操作

 **/

//调用base类中的方法进行增删查操作
public class StudentJdbc extends base {
    public static void main(String[] args) {
        List<Student> list = selectAll();

        for (Student s : list){
            System.out.println(s.getStudentId());
        }
    }

//老师添加学生
    public int addStudent(Student s){
        String str="INSERT INTO `s_student`(id,name,create_time) VALUE(?,?,?)";
        Timestamp ts = new Timestamp(s.getCreateTime().getTime());

        return executeUpdate(str, new Object[]{s.getStudentId(),s.getName(),s.getCreateTime()});
    }
//老师删除学生
    public int deleteStudent(Student s){
        String sql="DELETE FROM `s_student` WHERE id=?";
        return executeUpdate(sql, new Object[]{s.getStudentId()});
    }

//读取数据库中 s_student表
    public static List<Student> selectAll(){
        String url = "jdbc:mysql://127.0.0.1:3306/j1?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT";
        String driverName = "com.mysql.cj.jdbc.Driver";
        String sqlString = "SELECT * FROM j1.s_student";
        try {
            // 加载驱动
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        List<Student> list = new ArrayList<>();

        try(Connection connection =  DriverManager.getConnection(url, "root","123456");) {
            try(Statement statement = connection.createStatement()){
                try(ResultSet resultSet = statement.executeQuery(sqlString)){
                    // 获取执行结果
                    while (resultSet.next()){
                        Student s = new Student();
                        s.setStudentId(resultSet.getLong("id"));
                        s.setName(resultSet.getString("name"));
                        s.setCreateTime(resultSet.getTimestamp("create_time"));
                        list.add(s);

                    }

                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}