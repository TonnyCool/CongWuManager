<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="cata" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	
  <%
  String ok = (String)request.getAttribute("ok");
  if(ok != null && !ok.equals("")){
  	%><script>alert('添加成功!')</script><%
  }
   %>
  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table border="0" width="800" id="table1" bgcolor="#CCFFCC">
		<tr>
			<td align="center">客户姓名</td>
			<td align="center">联系电话</td>
			<td align="center">服务时间</td>
			<td align="center">服务内容</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList books = cata.getAfter();
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="admin/after_edit.jsp?mark=show&id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(2) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(3) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(4).toString().length()>30?alRow.get(4).toString().substring(0,29)+"" :alRow.get(4) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/DelServlet?after=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" colspan="6" height="25"><a href="admin/after_edit.jsp?mark=add">添加售后服务</a></td>
		</tr>
	</table>
  	</div>
  </body>
</html>