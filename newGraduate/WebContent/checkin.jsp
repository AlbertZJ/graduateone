<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page language="java"%> 
 <%@ page import="java.util.*"%>
 <%@ page import="java.text.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签到界面</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <style>
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
  <script>
  $(function() {
    $( document ).tooltip({
      track: true
    });
  });
  </script>
</head>
<body>
<center>
	<font face="楷体" size="6" color="#000">签到界面</font>
	<form action = "addcheck.jsp" method = "post" onsubmit = "return validate()">
  	<table width="300" height = "180" border="5" bordercolor="#A0A0A0">
  	    <tr>
		<th>签到开始时间：</th>
		<td><input type="text" name="check_start" value="<% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %>"    readonly="readonly" ></td>
 	  </tr>
 	  <tr>
		<th>学生编号：</th>
		 <%String stu_id=(String)request.getSession().getAttribute("username").toString();%>
		<td><input type="text" name="stu_id" value="<%=stu_id %>"   readonly="readonly"></td>
 	  </tr>
 	   <tr>
		<th>教师编号：</th>
		<td><input type="text" name="tech_id" title="输入 教师编号" maxlength = "255" onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>
 	  </tr>
	  <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" name="check" value="签到">    
 		</td>
	  </tr>
	</table>
    </form>
    </center> 
</body>
</html>