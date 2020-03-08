<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/2/27
  Time: 11:56
  To change this template use File | Settings | File Templates. 标签要放在<% %>外面，否则不识别
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.code.class12.model.StudentHomework" %>
<%@ page import="com.java.code.class12.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.code.class12.jdbc.StudentHomeworkJdbc" %>
<%@ page import="com.java.code.class12.jdbc.StudentJdbc" %>
<%@ page import="com.java.code.class12.model.Homework" %>
<%@ page import="com.java.code.class12.jdbc.HomeworkJdbc" %>
<html>
  <head>
    <title>My Homework</title>
  </head>
  <body>

  <style type="text/css">  <!--  .red {   color: #880000;   font-size: 24px;  }  -->  </style>
  <div   style="position: relative; width: 100%; display: table; * position: absolute; * top: 10%; * left: 0;">
    <p    style="position: absolute; top: 10%; left: 0; text-align: center; width: 100%; * top: 0;">
    <strong class="red">学生名单及作业</strong>   </p>  </div>

    <tr align="center" bgcolor="#7fffd4" height="50">
  <table style="margin:50px 0 20px 0;" align="center" width="960" border="1"
         bgcolor="black" cellpadding="1" cellspacing="1">

    <tr align="center" bgcolor="#FFC8B4" height="50">
      <td>ID</td>
      <td>学生学号</td>
      <td>作业编号</td>
      <td>作业标题</td>
      <td>作业内容</td>
      <td>创建时间</td>
    </tr>
    <%
      List<StudentHomework> list = StudentHomeworkJdbc.selectAll();
      if(null == list || list.size() <= 0){
        out.print("None data.");
      }else {
        for (StudentHomework sh : list){
    %>

    <tr align="center" bgcolor="white" height="30">
      <td><%=sh.getId()%></td>
      <td><%=sh.getStudentId()%></td>
      <td><%=sh.getHomeworkId()%></td>
      <td><%=sh.getHomeworkTitle()%></td>
      <td><%=sh.getHomeworkContent()%></td>
      <td><%=sh.getCreateTime()%></td>
    </tr>

    <%
        }
      }
    %>


    <table style="margin:20px 0 20px 0;"align="center" width="960" border="1"
           bgcolor="black" cellpadding="1" cellspacing="1">
      <tr align="center" bgcolor="#FFC8B4" height="50">
        <td>学生学号</td>
        <td>学生姓名</td>
        <td>创建时间</td>
      </tr>
      <%
        List<Student> list2 = StudentJdbc.selectAll();
        if(null == list || list.size() <= 0){
          out.print("None data.");
        }else {
          for (Student s : list2){
      %>
      <tr align="center" bgcolor="white" height="30">
        <td><%=s.getStudentId()%></td>
        <td><%=s.getName()%></td>
        <td><%=s.getCreateTime()%></td>
      </tr>
      <%
          }
        }
      %>

  </table>
      <table style="margin:20px 0 20px 0;"align="center" width="960" border="1"
             bgcolor="black" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFC8B4" height="50">
              <td>作业号</td>
              <td>作业题目</td>
              <td>作业要求</td>
              <td>创建时间</td>
          </tr>
          <%
              List<Homework> list3 = HomeworkJdbc.selectAll();
              if(null == list3 || list3.size() <= 0){
                  out.print("None data.");
              }else {
                  for (Homework h : list3){
          %>
          <tr align="center" bgcolor="white" height="30">
              <td><%=h.getId()%></td>
              <td><%=h.getHomeworkTitle()%></td>
              <td><%=h.getHomeworkContent()%></td>
              <td><%=h.getCreateTime()%></td>
          </tr>
          <%
                  }
              }
          %>

      </table>
    <form action="TChoose.jsp" method=post >
      <table class="table"align="center" border="1" width="50%" cellpadding="6">
        <tr>
          <th colspan="2" align="center" ><input type="submit" value="返回" /></th>
        </tr>
      </table>
    </form>
  </body>
</html>
