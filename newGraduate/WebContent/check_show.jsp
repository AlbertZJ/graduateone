<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>签到结果界面</title>
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
SELECT * from check_in;
</sql:query>
 
	<h1>签到结果显示</h1>
	<table border="1" width="100%">
		<tr>
			<th>签到编号</th>
			<th>签到开始时间</th>
			<th>签到结束时间</th>
			<th>签到学生编号</th>
			<th>教师编号</th>
			<th>签到次数</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.check_id}" /></td>
				<td><c:out value="${row.check_start}" /></td>
				<td><c:out value="${row.check_end}" /></td>
				<td><c:out value="${row.stu_id}" /></td>
				<td><c:out value="${row.tech_id}" /></td>
				<td><c:out value="${row.check_num}" /></td>
			</tr>
		</c:forEach>
	</table>
	 
</body>
</html>