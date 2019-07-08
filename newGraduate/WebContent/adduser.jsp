<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="com.runoob.test.Conver2MD5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
		stmt = conn.createStatement();
			String userid = (String) request.getParameter("userid");
			String name = (String) request.getParameter("username");
			String password = (String) request.getParameter("password");//取出login.jsp的值
			String pwd_md5 = Conver2MD5.getMD5(password); 
			
			String repassword = (String) request.getParameter("newword");
			String tel = (String) request.getParameter("tel");
			String type = (String) request.getParameter("type");
			if (!repassword.equals(password)) {
				out.print("<script type='text/javascript' language='javaScript'> alert('密码不一致!');</script>");
				response.setHeader("refresh", "0;url=register.jsp");
			}
			String sql;
			Boolean pwd;
			
			if (type.equals("tech")) {
				type = "教师";
				sql = "insert into teacher values('" + userid + "','" + name + "','" + pwd_md5 + "','" + tel
						+ "','" + type + "')";
				stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('添加教师用户成功');</script>");
			} else {
				type = "学生";
					sql = "insert into student values('" + userid + "','" + name + "','" + pwd_md5 + "','" + tel
						+ "','" + type + "')";
				stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('添加学生用户成功');</script>");
			}

		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
		response.setHeader("refresh", "0;url=register.jsp");
	%>
</body>
</html>