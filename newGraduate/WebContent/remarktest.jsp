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
<title>教师点评检验</title>
</head>
<body>
	<center>
		<form name="formName" action="addtitle.jsp" method="post"
			onsubmit="return validate()">			 
			<%
				request.setCharacterEncoding("UTF-8");
				String title_id = (String) request.getParameter("no");
				TitleDAO dao = new TitleDAO();
				List<Title> list = dao.readFirstTitle();
				for (Title tl : list) {
					if (tl.getTitle_id().equals(title_id)) { /*  {out.println(tl.getTitle_state().equals("未选")); */
			%>
			课题编号： <input type="text" name="title_id"
				value="<%=tl.getTitle_id()%>" readonly="readonly" /> <br />学生编号： <input
				type="text" name="stu_id" value="<%=tl.getStu_id()%>"
				readonly="readonly" /> <br />
			<h1>学生提交课题内容</h1>
			<textarea rows="10" cols="100" id="textone"  readonly="readonly"><%=tl.getStu_title()%></textarea>
			<%
				}
				}
			%>
			<h1>教师评语</h1>
			<textarea rows="10" cols="100" name="texta" autofocus></textarea>
			<br /> <input type="submit" name="sub" value="点评" onClick="do_action()">    
			<input type="reset" value="重  置">
		</form>
	</center>
</body>
</html>