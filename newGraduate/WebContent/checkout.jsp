<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签退界面</title>
</head>
<body>
	<center>
		<font face="楷体" size="6" color="#000">签退界面</font>
		<form action="addcheck.jsp" method="post" onsubmit="return validate()">
			<table width="300" height="180" border="5" bordercolor="#A0A0A0">
			<tr>
					<th>签退时间：</th>
					<td><input type="text" name="check_end"
						value="<%out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));%>"
						  readonly="readonly"></td>
				</tr>
				<tr>
					<th>学生编号：</th>
					<%
						String stu_i = (String) request.getSession().getAttribute("username").toString();
					%>
				<td><input type="text" name="stu_id" value="<%=stu_i%>"
						 readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						name="check" value="签退">    </td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>