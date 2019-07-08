<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>课题结果展示界面</title>
</head>
<body>
	<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/graduate?useUnicode=true&characterEncoding=utf-8"
		user="root" password="123456" />
	<sql:query dataSource="${snapshot}" var="result">
SELECT * from title;
</sql:query>
	<center>
		<h1>课题结果展示</h1>
	</center>
	<table border="1" width="100%">
		<tr>
			<th>课题编号</th>
			<th>课题名字</th>
			<th>作者编号</th>
			<th>课题状态</th>
			<th>课题内容</th>
			<th>选题人</th>
			<th>学生提交课题内容</th>
			<th>教师评语</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.title_id}" /></td>
				<td><c:out value="${row.title_name}" /></td>
				<td><c:out value="${row.tech_id}" /></td>
				<td><c:out value="${row.title_state}" /></td>
				<td><c:out value="${row.title_show}" /></td>
				<td><c:out value="${row.stu_id}" /></td>
				<td><c:out value="${row.stu_title}" /></td>
				<td><c:out value="${row.tech_title}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>