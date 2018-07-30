<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
	
	
  </head>
  
  <body>
  <jsp:include flush="true" page="/servlet/ListServlet"/>
   <jsp:include flush="true" page="top.jsp"/>
  <div align="center">
	<table border="0" width="800" cellspacing="0" cellpadding="0" id="table1" style="border-style: solid; border-width: 1px" bordercolor="#C0C0C0" height="600">
		<tr>
			<td align="center" valign="top">
			<br>
			公告信息<br>
			<table border="1" width="610" id="table1" background="img/tu_bg.gif">
		<tr>
			<td align="center">公告名称</td>
			<td align="center">公告内容</td>
			<td align="center">添加时间</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("affiche");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20">
			<%
			if(alRow.get(1).toString().length() > 15){
			%><a href="servlet/AfficheShowServlet?usershow=<%=alRow.get(0) %>" title="<%=alRow.get(1) %>"><%=alRow.get(1).toString().substring(0,12) %>...</a><%
			}else{
			%><a href="servlet/AfficheShowServlet?usershow=<%=alRow.get(0) %>" title="<%=alRow.get(1) %>"><%=alRow.get(1) %></a><%
			}
			 %>
			</td>
			<td  align="center" height="20">
			<%
			if(alRow.get(2).toString().length() > 25){
			%><%=alRow.get(2).toString().substring(0,22) %>...<%
			}else{
			%><%=alRow.get(2) %><%
			}
			 %>
			</td>
			<td  align="center" height="20">
			<%
			String str[] = alRow.get(3).toString().substring(0,11).split("-");
			 %>
			 <%=str[0]%>年<%=str[1]%>月<%=str[2].toString().trim() %>日 <%=alRow.get(3).toString().substring(11,16) %>
			</td>
		</tr>
		<%} %>
	</table>
			</td>
		</tr>
	</table>
	</div>
	<jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>