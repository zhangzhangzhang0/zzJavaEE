package com.java.code.class12.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class base {
    /***
     *
     * 数据库连接类,
     *
     */

    private String driver ="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://127.0.0.1:3306/j1?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=GMT";
    Connection conn=null;

    //获取连接
    protected  Connection getconn(){
        conn=null;
        try {
            // 加载驱动
            Class.forName(driver);
            // 创建连接
            conn=DriverManager.getConnection(url, "root","123456");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    //关闭数据库连接
    protected void closeAll(Connection conn ,PreparedStatement ps,ResultSet rs){
        if(rs!=null)
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
                if(conn!=null)
                    conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

    }

    //用于增删改的方法
    //接受sql语句和对象数组
    public int executeUpdate(String sql ,Object []ob){

        conn=getconn();
        PreparedStatement ps=null;

        try {

            ps=prepareStatement(conn,sql,ob);
            int i=ps.executeUpdate();

            return i;

        } catch (SQLException e) {

            e.printStackTrace();
            return 0;

        }finally{

            closeAll(conn, ps, null);

        }

    }

    /***
     * 查询方法
     */

    protected PreparedStatement prepareStatement(Connection conn,String sql,Object []ob){
        PreparedStatement ps=null;

        try {

            int index=1;
            ps = conn.prepareStatement(sql);

            if(ps!=null&&ob!=null){

                for (int i = 0; i < ob.length; i++) {

                    ps.setObject(index, ob[i]);
                    index++;

                }
            }

        } catch (SQLException e1) {

            e1.printStackTrace();

        }

        return ps;

    }

}
