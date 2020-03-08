<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/3/7
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher</title>
</head>
<body>

<style type="text/css">  <!--  .red {   color: #880000;   font-size: 24px;  }  -->  </style>
<div   style="position: relative; width: 100%; display: table; * position: absolute; * top: 10%; * left: 0;">
    <p    style="position: absolute; top: 10%; left: 0; text-align: center; width: 100%; * top: 0;">
        <strong class="red">欢迎老师</strong>   </p>  </div>

<form action="TAddStudent.jsp" method=post >
   <table style="margin:50px 0 20px 0;"class="table"align="center" border="1" width="50%" cellpadding="6">

       <tr>
           <th colspan="2" align="center" ><input type="submit" value="增加学生" /></th>

       </tr>
   </table>
</form>

<form action="TDeleteStudent.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
       <tr>
           <th colspan="2" align="center" ><input type="submit" value="删除学生" /></th>

       </tr>
    </table>
</form>

<form action="TSearch.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
       <tr>
           <th colspan="2" align="center" ><input type="submit" value="查询作业及学生名单" /></th>
       </tr>
    </table>
</form>

<form action="TAddHomework.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
       <tr>
           <th colspan="2" align="center" ><input type="submit" value="增加作业" /></th>
       </tr>
    </table>
</form>

<form action="main.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
        <tr>
            <th colspan="2" align="center" ><input type="submit" value="返回" /></th>
        </tr>
    </table>
</form>

</body>
</html>
