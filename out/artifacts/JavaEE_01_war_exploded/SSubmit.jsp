<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/3/7
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.code.class12.model.Homework" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.code.class12.jdbc.HomeworkJdbc" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Student Homepage</title>
</head>
<body>

<style type="text/css">  <!--  .red {   color: #880000;   font-size: 24px;  }  -->  </style>
<div   style="position: relative; width: 100%; display: table; * position: absolute; * top: 10%; * left: 0;">
    <p    style="position: absolute; top: 10%; left: 0; text-align: center; width: 100%; * top: 0;">
        <strong class="red">学生提交作业</strong>   </p>  </div>

<table style="margin:50px 0 20px 0;"align="center" width="960" border="1"
       bgcolor="black" cellpadding="1" cellspacing="1">
    <tr align="center" bgcolor="#FFC8B4" height="50">
        <td>ID</td>
        <td>作业标题</td>
        <td>作业内容</td>
        <td>创建时间</td>
    </tr>
    <%
        List<Homework> list = HomeworkJdbc.selectAll();
        if(null == list || list.size() <= 0){
            out.print("None data.");
        }else {
            for (Homework h : list){
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

<form action="SubmitHomeworkServlet" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">

        <tr>
            <td align="center" >学生学号</td>
            <td align="left" ><input type="text" name="studentId"></td>
        </tr>
        <tr>
            <td align="center" >第几次作业</td>
            <td align="left" ><input type="text" name="homeworkId"></td>
        </tr>
        <tr>
            <td align="center" >作业标题</td>
            <td align="left" ><input type="text" name="homeworkTitle"></td>
        </tr>
        <tr>
            <td align="center" >作业内容</td>
            <td align="left" ><input type="text" name="homeworkContent"></td>
        </tr>
        <tr>
            <th colspan="2" align="center" ><input type="submit" name="submit" value="提交"></th>
        </tr>
    </table>
</form>

</table>
<form action="main.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
        <tr>
            <th colspan="2" align="center" ><input type="submit" value="返回" /></th>
        </tr>
    </table>
</form>

</body>
</html>
