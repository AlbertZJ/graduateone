<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="graduate.TitleDAO" %>
    <%@page import="graduate.Title" %>
    <%@page import="java.util.List" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery UI 缩放（Resizable） - 文本框</title>
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <style>
  .ui-resizable-se {
    bottom: 17px;
  }
  </style>
  <script>
  $(function() {
    $( "textarea" ).resizable({
      handles: "se"
    });
  });
  </script>
</head>
<body> 
 
<center>
<font face="楷体"   size="6" color="#000">教师点评界面</font>
  	<form name="formName" action = "remarktest.jsp" method = "post" onsubmit = "return validate()"> 
  	<table      border="1"  >
  	  <tr    height="10">
  	     <th>选择</th>
		<th>课题编号</th>
		<th>课题名称</th>
		<th>作者编号</th>
		<th>课题状态</th>
		<th>课题内容</th>	
		<th>选题学生编号</th>
		<th>学生上交课题内容</th>	
		<th>教师评语</th>		 
  	  </tr>
  	  		<%
  	  		String tech_id=(String)request.getSession().getAttribute("username").toString();
  	TitleDAO dao=new TitleDAO();
     List<Title> list =dao.readFirstTitle();    
      for(Title tl:list)    	  
   {if(tech_id.equals(tl.getTech_id())&&!"null".equals(tl.getStu_id()))    
   {	
    %>    
  <tr> 
   <td> 
  <input type="radio" name="no"   title="选择/不选择" value="<%=tl.getTitle_id() %>"   ></td>  
    <td   ><input type="text" name="title_id" value="<%=tl.getTitle_id() %>"     readonly="readonly"/></td>
     <td   ><input type="text" name="title_name" value="<%=tl.getTitle_name() %>"   readonly="readonly"/></td>
          <td ><input type="text" name="tech_id" value="<%=tl.getTech_id() %>"    readonly="readonly"/></td>
        <td ><input type="text" name="title_state" value="<%=tl.getTitle_state() %>"     readonly="readonly"/></td>
       <td ><input type="text" name="title_show" value="<%=tl.getTitle_show() %>"     readonly="readonly"/></td>
      <td ><input type="text" name="stu_id" value="<%=tl.getStu_id() %>"     readonly="readonly"/></td>
       <td   >
        
         <%--  <input type="text"   name="stu_title" value="<%=tl.getStu_title() %>"    readonly="readonly"/>
       --%>
     <textarea name="stu_title" rows="1" cols="15"><%=tl.getStu_title() %></textarea>
          </td>
      <td   ><input type="text" name="tech_title" value="<%=tl.getTech_title() %>"    readonly="readonly"/></td>
     </tr>
     <%}  }
          %>
   	     <tr       height="30">
 		<td colspan = "9" align = "center">
 		  <input type="submit" value="提 交"   >    
 		  <input type="reset" value="重  置">
 		</td>
	  </tr>
	 	</table>  
    </form>
     
    
    </center> 
</body>
</html>