<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签到界面处理</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int i = 1;
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			stmt = conn.createStatement();
			String check = (String) request.getParameter("check");
			String stu_i = (String) request.getParameter("stu_id");
			String tech_id = (String) request.getParameter("tech_id");//取出login.jsp的值
			String sql;
			Boolean pwd;
			i = 0;
			String check_end = (String) request.getParameter("check_end");
			String check_start = (String) request.getParameter("check_start");
			sql = "UPDATE check_in SET check_start='" + check_start + "',check_end='" + check_end
					+ "'  WHERE stu_id='" + stu_i + "' and check_end is not true";
			stmt.executeUpdate(sql);
			out.print("<script type='text/javascript' language='javaScript'> alert('签到成功！');</script>");
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
		response.setHeader("refresh", "0;url=checkout.jsp");
	%>
</body>
</html>