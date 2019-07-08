<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.ManageDAO"%>
<%@page import="graduate.Manage"%>
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
<title>处理签到界面</title>
</head>
<body>
	<center>
		<font face="楷体" size="6" color="#000">处理签到界面</font>
		<form name="formName" action="managecheck.jsp" method="post"
			onsubmit="return validate()">
			<table border="1">
				<tr>
					<th>签到开始时间：</th>
					<td><input type="datetime-local" name="start" maxlength="16"></td>
				</tr>
				<tr>
					<th>签到结束时间：</th>
					<td><input type="datetime-local" name="end" maxlength="16"></td>
				</tr>
				<tr height="30">
					<td colspan="7" align="center"><input type="submit"
						value="提 交" onClick="do_action()">     <input type="reset"
						value="重  置"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>