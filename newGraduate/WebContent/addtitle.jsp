<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="graduate.TitleDAO"%>
<%@page import="graduate.Title"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课题界面</title>
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

			String sql;
			String sub = (String) request.getParameter("sub");
			if (sub.equals("增加")) {

				String title_name = (String) request.getParameter("title_name");
				String tech_id = (String) request.getParameter("tech_id");//取出login.jsp的值
				String title_state = (String) request.getParameter("title_state");
				String title_show = (String) request.getParameter("title_show");

				Boolean pwd;
				sql = "insert into title (title_name,tech_id,title_state,title_show) values('" + title_name + "','"
						+ tech_id + "','" + title_state + "','" + title_show + "')";
				stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('添加课题数据成功');</script>");
				response.setHeader("refresh", "0;url=settitle.jsp");
			} else if (sub.equals("删除")) {
				String[] title_id = request.getParameterValues("no");
				int i;
				TitleDAO dao = new TitleDAO();
				List<Title> list = dao.readFirstTitle();
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Title tl : list) {
					for (i = 0; i < title_id.length; i++) {
						if (tl.getTitle_id().equals(title_id[i])) {
							sql = "DELETE FROM title WHERE title_id='" + title_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除课题成功');</script>");
				response.setHeader("refresh", "0;url=deletetitle.jsp");
			} else if (sub.equals("点评")) {
				String title_id = (String) request.getParameter("title_id");
				String textarea = (String) request.getParameter("texta");
				TitleDAO dao = new TitleDAO();
				List<Title> list = dao.readFirstTitle();
				for (Title tl : list) {
					if (tl.getTitle_id().equals(title_id)) {
						sql = "UPDATE title SET tech_title='" + textarea + "'  WHERE title_id='" + title_id + "'";
						stmt.executeUpdate(sql);
						out.print(
								"<script type='text/javascript' language='javaScript'> alert('教师点评成功');</script>");
						response.setHeader("refresh", "0;url=techremark.jsp");
					}
				}
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>