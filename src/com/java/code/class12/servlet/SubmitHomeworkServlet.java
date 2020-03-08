package com.java.code.class12.servlet;

import com.java.code.class12.jdbc.HomeworkJdbc;
import com.java.code.class12.jdbc.StudentHomeworkJdbc;
import com.java.code.class12.jdbc.StudentJdbc;
import com.java.code.class12.model.Homework;
import com.java.code.class12.model.Student;
import com.java.code.class12.model.StudentHomework;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class SubmitHomeworkServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        StudentHomework sh = new StudentHomework();
        StudentHomeworkJdbc shj=new StudentHomeworkJdbc();
        StudentJdbc sj=new StudentJdbc();
        /**
         * 赋值
         */
            sh.setStudentId(Long.parseLong(req.getParameter("studentId")));
            sh.setHomeworkId(Long.parseLong(req.getParameter("homeworkId")));
            sh.setHomeworkTitle(req.getParameter("homeworkTitle"));
            sh.setHomeworkContent(req.getParameter("homeworkContent"));
            Calendar c = Calendar.getInstance();
            Date date = c.getTime();
            sh.setCreateTime(date);

            //   if(req.getParameter(!"studentId").equals())

            int i=shj.addHomework(sh);

            if(i>0){
                System.out.println("true");
                out.print("<script>alert('Submit Successfully'); window.location='SSubmit.jsp' </script>");

            }else{
                System.out.println("false");
                out.print("<script>alert('Failed'); window.location='SSubmit.jsp' </script>");
            }



        out.flush();
        out.close();

    }

}
