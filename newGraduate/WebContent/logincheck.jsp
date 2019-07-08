<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="com.runoob.test.Conver2MD5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录检查界面</title>
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
			//System.out.println(" 实例化Statement对象...");
			stmt = conn.createStatement();
			String type = (String) request.getParameter("type");
			String name = (String) request.getParameter("username");
			request.getSession().setAttribute("username", name);
			String password = (String) request.getParameter("password");//取出login.jsp的值
			String pwd_md5 = Conver2MD5.getMD5(password); 
			String sql;
			Boolean pwd;		
			if (type.equals("tech")) {
				sql = "select * from teacher  where tech_id='" + name + "'";
			} else {
				sql = "select * from student  where stu_id='" + name + "'";
			}
			ResultSet rs = stmt.executeQuery(sql);
			// 展开结果集数据库
			if (rs != null && rs.next()) {
				if (type.equals("tech")) {
					pwd = pwd_md5.equals(Conver2MD5.getMD5(rs.getString("tech_pwd")));
				} else {
					pwd = pwd_md5.equals(Conver2MD5.getMD5(rs.getString("stu_pwd")));
				}
				if (pwd) {
					if (type.equals("tech")) {
						response.sendRedirect("teacher.jsp");
					} else {
						response.sendRedirect("student.jsp");
					}
				} else {
					out.print("<script type='text/javascript' language='javaScript'> alert('密码错误');</script>");
					response.setHeader("refresh", "0;url=login.jsp");
				}
			} else {
				out.print("<script type='text/javascript' language='javaScript'> alert('账号错误');</script>");
				response.setHeader("refresh", "0;url=login.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>