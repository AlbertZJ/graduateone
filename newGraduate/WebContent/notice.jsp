<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.Notice,graduate.NoticeDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知界面</title>
</head>
<body>
	<center>
		<font face="楷体" size="6" color="#000">通知界面</font>
		 		<table border="1" bordercolor="#A0A0A0">
				<tr height="10">
					<th>通知编号</th>
					<th>通知内容</th>
					<th>发布人</th>
				</tr>
				<%
					NoticeDAO dao = new NoticeDAO();
					List<Notice> list = dao.readFirstTitle();
					for (Notice tl : list) {
				%>
				<tr>
					<td><input type="text" value="<%=tl.getNote_id()%>"
						  readonly="readonly"></td>
					<td>
					 	   <textarea name="note" rows="1" cols="15" readonly="readonly"  > <%=tl.getNote()%></textarea>       
	 			  </td>
					<td><input type="text" value="<%=tl.getTech_id()%>"
						  readonly="readonly"></td>
				</tr>
				<%
					}
				%>
			</table>
		 
	</center>
</body>
</html>