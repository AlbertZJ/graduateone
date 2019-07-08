<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="graduate.TitleDAO"%>
<%@page import="graduate.Title"%>
<%@page import="java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改教师信息界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String tech_id = (String) request.getSession().getAttribute("username").toString();
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			stmt = conn.createStatement();
			String name = (String) request.getParameter("username");
			String password = (String) request.getParameter("password");//取出login.jsp的值
			String repassword = (String) request.getParameter("newword");
			String tel = (String) request.getParameter("tel");
			String type = (String) request.getParameter("type");
			if (!repassword.equals(password)) {
				out.print("<script type='text/javascript' language='javaScript'> alert('密码不一致!');</script>");
				response.setHeader("refresh", "0;url=technews.jsp");
			}
			String sql;
			Boolean pwd;
			sql = "UPDATE teacher SET tech_name='" + name + "',tech_pwd='" + password + "',tech_tel='" + tel
					+ "'  WHERE tech_id='" + tech_id + "'";
			stmt.executeUpdate(sql);
			out.print("<script type='text/javascript' language='javaScript'> alert('修改教师信息成功');</script>");
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
		response.setHeader("refresh", "0;url=technews.jsp");
	%>
</body>
</html>