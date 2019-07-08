<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>
<%@page import="java.sql.*"%>

<%@ page import="java.text.*"%>
<%@page import="graduate.NoticeDAO"%>
<%@page import="graduate.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布通知界面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//JDBC 驱动名及数据库 URL
		NoticeDAO dao = new NoticeDAO();
		List<Notice> list = dao.readFirstTitle();
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			stmt = conn.createStatement();
			String sql;
			String sub = (String) request.getParameter("sub");
			if (sub.equals("发布")) {
				String note_id = (String) request.getParameter("note_id");
				String note = (String) request.getParameter("note");
					String tech_id = (String) request.getParameter("tech_id");//取出login.jsp的值
				Boolean pwd;
				sql = "insert into   notice (note,tech_id) values('" + note + "','" + tech_id + "')";
				stmt.executeUpdate(sql);
				out.print("<script type='text/javascript' language='javaScript'> alert('发布通知成功');</script>");
				response.setHeader("refresh", "0;url=addnote.jsp");
			} else if (sub.equals("删除")) {
				String[] note_id = request.getParameterValues("no");
				int i;
				String check_num;
				check_num = (String) request.getParameter("check_num");
				for (Notice tl : list) {
					for (i = 0; i < note_id.length; i++) {
						if (tl.getNote_id().equals(note_id[i])) {
							sql = "DELETE FROM notice WHERE note_id='" + note_id[i] + "'";
							stmt.executeUpdate(sql);
						}
					}
				}
				out.print("<script type='text/javascript' language='javaScript'> alert('删除通知成功');</script>");
				response.setHeader("refresh", "0;url=deletenotice.jsp");
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}
	%>
</body>
</html>