<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.DataConner"%>

<%@ page import="java.text.*"%>
<%@page import="graduate.ScoreDAO"%>
<%@page import="graduate.Score"%>

<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除学生分数界面处理</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String[] score_id = request.getParameterValues("no");
		int i;
		ScoreDAO dao = new ScoreDAO();
		List<Score> list = dao.readFirstTitle();
		/* for (Score tl : list) {
			for (i = 0; i < score_id.length; i++) {
				if (tl.getScore_id().equals(score_id[i])) { */
					//JDBC 驱动名及数据库 URL
					DataConner manager = DataConner.getInstance();
					Connection conn = manager.connect();
					try {
						Statement stmt = null;
						// 执行查询
						stmt = conn.createStatement();
					 	String sql;
						 
						//sql = "UPDATE check_in SET check_num='" + check_num + "' WHERE check_id='" + check_id[i]
						//		+ "'";
						for (Score tl : list) {
			for (i = 0; i < score_id.length; i++) {
				if (tl.getScore_id().equals(score_id[i])) {
						sql="DELETE FROM score WHERE score_id='" + score_id[i]+"'";
						stmt.executeUpdate(sql);
						out.print(
								"<script type='text/javascript' language='javaScript'> alert('删除学生分数成功');</script>");			
				}
			}
			}						 
			 		} finally {
						// 完成后关闭
						manager.disconnect(conn);
					}
 		response.setHeader("refresh", "0;url=deletescore.jsp");
	%>
</body>
</html>