<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师侧边栏</title>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <script>
  $(function() {
    $( "#menu" ).menu();
  });
  </script>
  <style>
  .ui-menu { width: 150px; }
  </style>
</head>
<body>
	 
		<ul id="menu">
			<li><a>签到相关</a>
			
			<ul> 
			<li><a href="checktest.jsp" target="mainFrame">处理签到</a></li>
			 
			<li><a href="check_show.jsp" target="mainFrame">签到结果</a></li>
</ul></li>
			 <li><a>课题相关</a>
			<ul>
			 	 
			<li><a href="settitle.jsp" target="mainFrame">增加课题</a></li>
			 
			<li><a href="deletetitle.jsp" target="mainFrame">删除课题</a></li>
			 
			<li><a href="techremark.jsp" target="mainFrame">点评课题</a></li>
			<li><a href="techfileupload.jsp" target="mainFrame">上传论文批改</a></li>
			 
			 
			<li><a href="titleshow.jsp" target="mainFrame">课题结果展示</a></li>
</ul></li>
<li><a>分数相关</a>
			<ul>
			 
			<li><a href="score.jsp" target="mainFrame">打分</a></li>
			 
			<li><a href="scoreShow.jsp" target="mainFrame">分数显示 </a></li>
			 
			<li><a href="deletescore.jsp" target="mainFrame">删除分数记录</a></li>
</ul></li>
<li><a>通知相关</a>
			<ul>
			 
			<li><a href="addnote.jsp" target="mainFrame">发布通知</a></li>
			
			 
			<li><a href="notice.jsp" target="mainFrame">通知</a></li>
 
			<li><a href="deletenotice.jsp" target="mainFrame">删除通知</a></li>
</ul></li>
			 
			<li><a href="technews.jsp" target="mainFrame">信息修改</a></li>
		</ul>
	 
</body>
</html>