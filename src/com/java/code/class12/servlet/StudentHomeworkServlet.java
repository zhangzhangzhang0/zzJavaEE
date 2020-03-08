package com.java.code.class12.servlet;

import com.java.code.class12.jdbc.StudentHomeworkJdbc;
import com.java.code.class12.model.StudentHomework;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**

 * StudentHomeworkServlet

 */
//老师拿到学生作业
@WebServlet("/list")
public class StudentHomeworkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<StudentHomework> list = StudentHomeworkJdbc.selectAll();
        req.setAttribute("list", list);
        //将信息转到前端
        req.getRequestDispatcher("TSearch.jsp").forward(req, resp);
    }

}