<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/3/7
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to the Homework Platform</title>
</head>
<body>
<style type="text/css">  <!--  .red {   color: #880000;   font-size: 24px;  }  -->  </style>

<div   style="position: relative; width: 100%; display: table; * position: absolute; * top: 10%; * left: 0;">
    <p    style="position: absolute; top: 10%; left: 0; text-align: center; width: 100%; * top: 0;">
        <strong class="red">JavaEE 作业管理系统</strong>   </p>  </div>

<form action="TChoose.jsp" method=post >
    <table style="margin:60px 0 20px 0;"class="table"align="center" border="1" width="50%" cellpadding="6">
        <tr>
            <th colspan="2" align="center" ><input type="submit" value="老师" /></th>
        </tr>
    </table>
</form>

<form action="SSubmit.jsp" method=post >
    <table class="table"align="center" border="1" width="50%" cellpadding="6">
        <tr>
            <th colspan="2" align="center" ><input type="submit" value="学生" /></th>
        </tr>
    </table>
</form>

</body>
</html>
