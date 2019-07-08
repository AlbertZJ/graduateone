<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息界面</title>
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
<%	
request.setCharacterEncoding("UTF-8");
 
String stu_id=(String)request.getSession().getAttribute("username").toString();
%>
<center>
	<font face="楷体" size="6" color="#000">学生信息修改界面</font>
	<form action = "addstunews.jsp" method = "post" onsubmit = "return validate()">
  	<table width="300" height = "180" border="5" bordercolor="#A0A0A0">
  	  <tr>
		<th>用户编号：</th>
		<td><input type="text" name="userid" value="<%=stu_id %>" readonly="readonly"></td>
 	  </tr>
  	  <tr>
		<th>用户名：</th>
		<td><input type="text" name="username" title="输入用户名" maxlength = "16" onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<th>新密码：</th>
 		<td><input type="text" name="password" title="输入新密码" maxlength = "20" onfocus = "if(this.value == '输入20个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<th>确认密码：</th>
 		<td><input type="text" name="newword" title="重新输入密码" maxlength = "20" onfocus = "if(this.value == '重新输入密码') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<th>电话号码：</th>
 		<td><input type="text" name="tel" title="输入电话号码" maxlength = "15" onfocus = "if(this.value == '输入15个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
		<th>用户类型：</th>
		<td><input  type="radio" checked="checked" name="type" value="stu" readonly="readonly"/>学生
       <!--  <input  type="radio" name="type" value="tech"/>教师 --></td>
 	  </tr>
	  <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" value="提 交">    
 		  <input type="reset" value="重  置">
 		</td>
	  </tr>
	</table>
    </form>
    </center> 
</body>
</html>