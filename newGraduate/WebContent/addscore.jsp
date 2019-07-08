<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生分数界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			// 执行查询
			stmt = conn.createStatement();
			String usual_grade = (String) request.getParameter("usual_grade");
			String reply_grade = (String) request.getParameter("reply_grade");
			String total_grade = (String) request.getParameter("total_grade");//取出login.jsp的值
			String tech_id = (String) request.getParameter("tech_id");
			String stu_id = (String) request.getParameter("stu_id");
			String sql;
			Boolean pwd;
			sql = "insert into score (usual_grade,reply_grade,total_grade,tech_id,stu_id) values('" + usual_grade
					+ "','" + reply_grade + "','" + total_grade + "','" + tech_id + "','" + stu_id + "')";
			stmt.executeUpdate(sql);
			out.print("<script type='text/javascript' language='javaScript'> alert('添加学生分数成功');</script>");
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
		response.setHeader("refresh", "0;url=score.jsp");
	%>
</body>
</html>