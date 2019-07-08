 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="graduate.DataConner"%>
     <%@page import="com.runoob.test.UploadServlet" %>
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
<title>上传论文界面</title>
</head>
<body>
<center>
<font face="楷体"   size="6" color="#000">上传论文界面</font>
	<!-- <form name="formName" action = "checkselecttitle.jsp" method = "post" onsubmit = "return validate()">
   -->
   <form name="formName" action = "stu_file.jsp" method = "post" onsubmit = "return validate()">
  
   
   	<table      border="1"  >
  	  <tr    height="10">
  	  <th>选择</th>  
		<th>课题编号</th>
		<th>课题名称</th>
		<th>作者编号</th>
		<th>课题状态</th>
		<th>课题内容</th>	
		<th>选题学生编号</th>	
		<!-- <th>学生上交课题内容</th>	
		<th>教师评语</th> -->
		<th>学生上传的文件</th>
		<th>教师批改后的文件</th>		 
  	  </tr>
  	  <% 
  	request.setCharacterEncoding("UTF-8");
  		String stu_id=(String)request.getSession().getAttribute("username").toString();
  		TitleDAO dao=new TitleDAO();
List<Title> list =dao.readFirstTitle();    
 
for(Title tl:list)    	  
{
	 
     
	    if(stu_id.equals(tl.getStu_id())){     		        	    	
 %>  
  <tr>
    <td> 
  <input type="radio" name="no"   title="选择/不选择" value="<%=tl.getTitle_id() %>"></td>  
     <td   ><input type="text" name="title_id" value="<%=tl.getTitle_id() %>"     readonly="readonly"/></td>
     <td   >
        <textarea name="title_name" rows="1" cols="15"  readonly="readonly"><%=tl.getTitle_name() %></textarea>    
     </td>
          <td ><input type="text" name="tech_id" value="<%=tl.getTech_id() %>"    readonly="readonly"/></td>
        <td ><input type="text" name="title_state" value="<%=tl.getTitle_state() %>"     readonly="readonly"/></td>
       <td >
         <textarea name="title_show" rows="1" cols="15"  readonly="readonly"><%=tl.getTitle_show() %></textarea>    
       </td>
      <td ><input type="text" name="stu_id" value="<%=tl.getStu_id() %>"     readonly="readonly"/></td>
        
     
      <td >  
      <a href="http://localhost:8080/newGraduate/download/<%=tl.getStu_file()%>" download="<%=tl.getStu_file()%>"><%=tl.getStu_file()%></a>
        </td>  
   <td > 
      <a href="http://localhost:8080/newGraduate/download/<%=tl.getTech_file()%>" download="<%=tl.getTech_file()%>"><%=tl.getTech_file()%></a>
    
        </td> 
    
      </tr>     
     <%}  }
          %> 
          
          <tr >
         <td colspan = "9" align = "center">
        上传的文件名： <input type="text" name="stu_fil"  value="${file}"   readonly="readonly"/> </td>
    
          </tr>  	    
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