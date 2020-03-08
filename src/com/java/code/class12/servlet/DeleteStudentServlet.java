package com.java.code.class12.servlet;

import com.java.code.class12.jdbc.StudentJdbc;
import com.java.code.class12.model.Student;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;


public class DeleteStudentServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        Student s = new Student();
        StudentJdbc sj = new StudentJdbc();
        s.setStudentId(Long.parseLong(req.getParameter("id")));
        int i=sj.deleteStudent(s);

        if(i>0){
            System.out.println("true");
            out.print("<script>alert('Delete Successfully'); window.location='TDeleteStudent.jsp' </script>");
        }else{
            System.out.println("false");
            out.print("<script>alert('Failed'); window.location='TDeleteStudent.jsp' </script>");
        }

        out.flush();
        out.close();

    }
}
