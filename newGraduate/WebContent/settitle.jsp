<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加课题界面</title>
</head>
<body>
<center>
	<font face="楷体" size="6" color="#000">出题界面</font>
	<form action = "addtitle.jsp" method = "post" onsubmit = "return validate()">
  	<table width="300" height = "180" border="5" bordercolor="#A0A0A0">  	 
  	  <tr>
		<th>课题名字：</th>
		<td>
	 	    <textarea name="title_name" rows="3" cols="20"   > </textarea>    
		</td>
 	  </tr>
 	    <tr>
		<th>出题教师编号：</th>
		<%String tech_id=(String)request.getSession().getAttribute("username").toString();%>
		<td ><input type="text" name="tech_id" value="<%=tech_id %>"     readonly="readonly"></td>
 	  	  </tr>
 	  <tr>
		<th>课题状态：</th>
		<td><input type="text" name="title_state" value="未选"   readonly="readonly" ></td>
 	  </tr>
 	  <tr>
		<th>课题内容：</th>
		<td>
		 	 <textarea name="title_show" rows="3" cols="20"   > </textarea>       
		</td>
 	  </tr> 	   
	  <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" name="sub" value="增加">    
 		  <input type="reset" value="重  置">
 		</td>
	  </tr>
	</table>
    </form>
    </center> 
</body>
</html>