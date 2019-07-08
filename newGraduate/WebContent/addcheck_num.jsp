<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>

<%@ page import="java.text.*"%>
<%@page import="graduate.ManageDAO"%>
<%@page import="graduate.Manage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加签到次数界面处理</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String[] check_id = request.getParameterValues("no");
		int i;
		ManageDAO dao = new ManageDAO();
		List<Manage> list = dao.readFirstTitle();
		/*  for (Manage tl : list) {
				for (i = 0; i < check_id.length; i++) {
					if (tl.getCheck_id().equals(check_id[i])) {   */
		//JDBC 驱动名及数据库 URL
		DataConner manager = DataConner.getInstance();
		Connection conn = manager.connect();
		try {
			Statement stmt = null;
			// 执行查询
			stmt = conn.createStatement();
			String check_num;
			check_num = (String) request.getParameter("check_num");
			String sql;
			int s;
			for (Manage tl : list) {
				for (i = 0; i < check_id.length; i++) {
					if (tl.getCheck_id().equals(check_id[i])) {
						s = 0;

						if ((Object) tl.getCheck_num() == null) {
							check_num = "1";
						} else {
							s = Integer.parseInt(tl.getCheck_num());
							s += 1;
							check_num = String.valueOf(s);
						}
						sql = "UPDATE check_in SET check_num='" + check_num + "' WHERE check_id='" + check_id[i]
								+ "'";
						stmt.executeUpdate(sql);
 		}
				}
			}
		} finally {
			// 完成后关闭
			manager.disconnect(conn);
		}

		out.print(
				"<script type='text/javascript' language='javaScript'> alert('签到处理成功！');</script>");

		response.setHeader("refresh", "0;url=checktest.jsp");
	%>
</body>
</html>