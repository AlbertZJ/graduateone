<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.runoob.test.UploadServlet" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传论文界面</title>
</head>
<body>
<center>
上传论文界面<br/>
   <form method="post" action="UploadServlet" enctype="multipart/form-data"> 
	 选择一个文件:
    <input type="file" name="uploadFile" />
    <br/><br/>
    <input type="submit" value="上传" />	
    </form>
    </center>     
</body>
</html>