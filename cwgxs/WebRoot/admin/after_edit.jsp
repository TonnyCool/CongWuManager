<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="cata" scope="page" class="bean.AllBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id");
String mark = request.getParameter("mark");
String str1 = "",str2 = "";
ArrayList pub = cata.getAfter(id); 
if(mark != null && mark.equals("add")){
	str1 = "添加售后服务";
}
if(mark != null && mark.equals("show")){
	str1 = "售后服务详细信息";
	str2 = "readonly";
}
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
	<script src="<%=path %>/img/date.js" type="text/jscript"></script>
  </head>
  <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("客户姓名不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.phone.value == ""  )  
				{
					alert("联系电话不能为空!");
					document.form1.phone.focus();
					return false;
				}
				if (document.form1.content.value == ""  )  
				{
					alert("服务内容不能为空!");
					document.form1.content.focus();
					return false;
				}
			}
</script>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('名称重复!')</script><%
}
%> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AfterServlet?mark=<%=mark %>" method="post" name="form1" onSubmit="return check11()">
	<table border="1" width="45%" bordercolorlight="#C0C0C0">
		<tr>
		  <td height="25" colspan="2" align="center" bgcolor="#66CCFF"><%=str1 %></td>
</tr>
		<tr>
		  <td height="25"  align="right">客户姓名：</td>
		  <td height="25" ><input type="text" name="name" size="45" <%=str2 %> value="<%=pub != null && pub.size() !=0?pub.get(1):"" %>"></td>
	  </tr>
		<tr>
		  <td height="25"  align="right">联系电话：</td>
		  <td height="25" ><input type="text" name="phone" size="45" <%=str2 %> value="<%=pub != null && pub.size() !=0?pub.get(2):"" %>"></td>
	  </tr>
		<tr>
			<td height="25"  align="right">服务时间：</td>
			<td height="25" >
			<%
			if(mark != null && !mark.equals("show")){
			 %>
			<select name="year">
			<%
			for(int i = 2010;i < 2050;i++){
				%>
				<option value="<%=i %>"><%=i %>年</option>
				<%
			}
			 %>
			</select>
			<select name="month">
			<%
			for(int i = 1;i <= 12;i++){
				%>
				<option value="<%=i %>"><%=i %>月</option>
				<%
			}
			 %>
			</select>
			<select name="day">
			<%
			for(int i = 1;i <= 31;i++){
				%>
				<option value="<%=i %>"><%=i %>日</option>
				<%
			}
			 %>
			</select>
			<%}else{ %>
			<input type="text" name="times" size="45" <%=str2 %> value="<%=pub.get(3) %>">
			<%} %>
			</td>
		</tr>
		<tr>
			<td height="25"  align="right">服务内容：</td>
			<td height="25" >
			<textarea rows="15" name="content" cols="46" <%=str2 %>><%=pub != null && pub.size() !=0?pub.get(4):"" %></textarea></td>
		</tr>
		<%
			if(mark != null && mark.equals("add")){
			 %>
		<tr>
			<td height="25"  align="center" colspan="2">
			<input type="submit" value="添加"></td>
		</tr>
		<%} %>
		</table>
	</form>
  	</div>
  </body>
</html>