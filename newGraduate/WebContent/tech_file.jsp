<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>
<%@page import="graduate.TitleDAO"%>
<%@page import="graduate.Title"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生上传文件检验界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title_id = (String) request.getParameter("no");
		String tech_file = (String) request.getParameter("tech_fil");
		 
		  char[] strChar=tech_file.toCharArray();  
		 
		  String tech_id = (String) request.getSession().getAttribute("username").toString();
		 TitleDAO dao = new TitleDAO();
		List<Title> list = dao.readFirstTitle();
		for (Title tl : list) {
			if (tl.getTitle_id().equals(title_id)) {
				//JDBC 驱动名及数据库 URL
				DataConner manager = DataConner.getInstance();
				Connection conn = manager.connect();
				try {
					Statement stmt = null;
					// 执行查询
					stmt = conn.createStatement();
				String sql;
				 
				 sql = "UPDATE title SET  tech_file='" + tech_file + "' WHERE title_id='" + title_id
							+ "'"; 
					/* System.out.println(sql); */
					stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('教师批改文件上传成功');</script>");
				} finally {
					// 完成后关闭
					manager.disconnect(conn);
				}
				response.setHeader("refresh", "0;url=techfileupload.jsp");
			}
		}
	%>
</body>
</html>