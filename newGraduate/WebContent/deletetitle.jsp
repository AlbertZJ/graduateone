<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.TitleDAO"%>
<%@page import="graduate.Title"%>

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
<title>删除课题界面</title>
</head>
<body>
	<script language="JavaScript" type="text/JavaScript">
		/* 是否全选标记 */
		var checkedAll = false;

		/* 全选/取消全选 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function selectAll(formName, checkboxName) {
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (checkedAll) {
					e.checked = false;
					form.alls.checked = false;
				} else {
					e.checked = true;
					form.alls.checked = true;
				}
			}
			if (checkedAll) {
				checkedAll = false;
			} else {
				checkedAll = true;
			}
		}
		/* 检查是否有checkbox被选中 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function checkAll(formName, checkboxName) {
			var hasCheck = false;
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (e.checked) {
					hasCheck = true;
				}
			}
			return hasCheck;
		}
		/* 执行操作 */
		function do_action() {
			if (!checkAll("formName", "no")) {
				alert("没有多选框被选中，若要提交至少选择一个！");
			} /* else {
				alert("已有checkbox被选中，可以继续后续操作！");
			} */
		}
	</script>
	<center>
		<font face="楷体" size="6" color="#000">处理签到界面</font>
		<form name="formName" action="addtitle.jsp" method="post"
			onsubmit="return validate()">
			<table border="1">
				<tr height="10">
					<th><input type="checkbox" name="alls"
						onClick="selectAll('formName','no')" title="全选/取消全选"> 选择</th>
					<th>课题编号</th>
					<th>课题名字</th>
					<th>教师编号</th>
					<th>课题状态</th>
					<th>课题要求</th>
					<th>选题人</th>
					<th>学生提交课题内容</th>
					<th>教师评语</th>
				</tr>
				<%
					String start = (String) request.getParameter("start");
					String end = (String) request.getParameter("end");
					 

					String tech_id = (String) request.getSession().getAttribute("username").toString();
					TitleDAO dao = new TitleDAO();
					List<Title> list = dao.readFirstTitle();
					for (Title tl : list) {
						if (tl.getTech_id().equals(tech_id)) {
							 
				%>

				<tr>
					<td><input type="checkbox" name="no" title="选择/不选择"
						value="<%=tl.getTitle_id()%>"></td>
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
       <td   >               
      <textarea name="stu_title" rows="1" cols="15"  readonly="readonly"><%=tl.getStu_title() %></textarea>   
          </td>
      <td   >       
  <textarea name="tech_title" rows="1" cols="15"  readonly="readonly"><%=tl.getTech_title() %></textarea>    
      </td>
				</tr>
				<%
					}
						}
					 
				%>
				<tr height="30">
					<td colspan="9" align="center"><input type="submit"
					name="sub"	value="删除" onClick="do_action()">     <input type="reset"
						value="重  置"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>