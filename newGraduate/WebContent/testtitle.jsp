<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>SELECT 操作</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/graduate?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="123456"/> 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from testtitle;
</sql:query>
<h1>JSP 数据库实例 - 菜鸟教程</h1>
<table border="1" width="100%">
<tr>
   <th>评测编号</th>
   <th>学生编号</th>
   <th>教师编号</th>
   <th>课题名字</th>
   <th>学生提交课题内容</th>
   <th>教师评语</th>    
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.test_id}"/></td>
   <td><c:out value="${row.stu_id}"/></td>
   <td><c:out value="${row.tech_id}"/></td>
   <td><c:out value="${row.title_name}"/></td>
   <td><c:out value="${row.stu_title}"/></td>
   <td><c:out value="${row.tech_title}"/></td>
</tr>
</c:forEach>
</table> 
</body>
</html>