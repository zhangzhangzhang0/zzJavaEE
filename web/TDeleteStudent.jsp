<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/3/7
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.code.class12.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.code.class12.jdbc.StudentJdbc" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>select</title>
</head>
<body>

<style type="text/css">  <!--  .red {   color: #880000;   font-size: 24px;  }  -->  </style>
<div   style="position: relative; width: 100%; display: table; * position: absolute; * top: 10%; * left: 0;">
    <p    style="position: absolute; top: 10%; left: 0; text-align: center; width: 100%; * top: 0;">
        <strong class="red">删除学生</strong>   </p>  </div>

<table style="margin:50px 0 20px 0;"align="center" width="960" border="1"
       bgcolor="black" cellpadding="1" cellspacing="1">
    <tr align="center" bgcolor="#FFC8B4" height="50">
        <td>学生学号</td>
        <td>学生姓名</td>
        <td>创建时间</td>
        <td>删除学生</td>
    </tr>
    <%
        List<Student> list2 = StudentJdbc.selectAll();
        if(null == list2 || list2.size() <= 0){
            out.print("None data.");
        }else {
            for (Student s : list2){
    %>
    <tr align="center" bgcolor="white" height="30">
        <td><%=s.getStudentId()%></td>
        <td><%=s.getName()%></td>
        <td><%=s.getCreateTime()%></td>

        <td><a href="DeleteStudentServlet?id=<%=s.getStudentId()%>"><input type="button" value="删除"></a></td>
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
