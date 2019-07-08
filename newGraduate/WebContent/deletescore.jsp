<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="graduate.ScoreDAO"%>
<%@page import="graduate.Score"%>

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
<title>删除分数界面</title>
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
				alert("没有checkbox被选中，至少选择一个！");
			} /* else {
				alert("已有checkbox被选中，可以继续后续操作！");
			} */
		}
	</script>
	<center>
		<font face="楷体" size="6" color="#000">删除分数界面</font>
		<form name="formName" action="adeletescore.jsp" method="post"
			onsubmit="return validate()">
			<table border="1">
				<tr height="10">
					<th><input type="checkbox" name="alls"
						onClick="selectAll('formName','no')" title="全选/取消全选"> 选择</th>
					<th>分数编号</th>
					<th>平时成绩</th>
					<th>答辩成绩</th>
					<th>最终成绩</th>
					<th>教师编号</th>
					<th>学生编号</th>
					 
				</tr>
				<%
					 
					String tech_id = (String) request.getSession().getAttribute("username").toString();
					ScoreDAO dao = new ScoreDAO();
					List<Score> list = dao.readFirstTitle();
					for (Score tl : list) {
						if (tl.getTech_id().equals(tech_id)) {						 
				%>
				<tr>
					<td><input type="checkbox" name="no" title="选择/不选择"
						value="<%=tl.getScore_id()%>"></td>
				<td><input type="text" name="score_id"
						value="<%=tl.getScore_id()%>"   readonly="readonly" /></td>

		
					<td><input type="text" name="usual_grade"
						value="<%=tl.getUsual_grade()%>"   readonly="readonly" /></td>

					<td><input type="text" name="reply_grade"
						value="<%=tl.getReply_grade()%>"  
						readonly="readonly" /></td>
					<td><input type="text" name="total_grade"
						value="<%=tl.getTotal_grade()%>"   readonly="readonly" /></td>
					<td><input type="text" name="tech_id"
						value="<%=tl.getTech_id()%>"   readonly="readonly" /></td>
					<td><input type="text" name="stu_id"
						value="<%=tl.getStu_id()%>"  readonly="readonly" /></td>
					 					 
				</tr>
				<%
					}
						}
					 
				%>
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