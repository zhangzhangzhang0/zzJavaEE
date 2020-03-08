package com.java.code.class12.servlet;


import com.java.code.class12.jdbc.StudentJdbc;
import com.java.code.class12.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/add")
public class AddStudentServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        Student s = new Student();
        StudentJdbc sj=new StudentJdbc();
        PrintWriter out = resp.getWriter();
        /**
         * 赋值
         */

        s.setStudentId(Long.parseLong(req.getParameter("id")));
        s.setName(req.getParameter("name"));
        //获取当前系统时间，存入数据库创建时间
        Calendar c = Calendar.getInstance();
        Date date = c.getTime();
        s.setCreateTime(date);
        //调用jdbc中增添学生的方法
        int i=sj.addStudent(s) ;

        if(i>0){
            System.out.println("true");
            out.print("<script>alert('Add Successfully'); window.location='TAddStudent.jsp' </script>");

        }else{
            System.out.println("false");
            out.print("<script>alert('Failed'); window.location='TAddStudent.jsp' </script>");
        }
        out.flush();
        out.close();

    }
}