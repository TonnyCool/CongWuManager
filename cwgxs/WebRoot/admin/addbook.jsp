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
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	<script type="text/javascript" src="img/calendar.js"></script>
	

  </head>
  <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("���ﹷ���Ʋ���Ϊ��!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )  
				{
					alert("���ز���Ϊ��!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )  
				{
					alert("�������ڲ���Ϊ��!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )  
				{
					alert("���ز���Ϊ��!");
					document.form1.number.focus();
					return false;
				}				
				if (document.form1.price.value == ""  )  
				{
					alert("�۸���Ϊ��!");
					document.form1.price.focus();
					return false;
				}				
				if (document.form1.storage.value == ""  )  
				{
					alert("���������Ϊ��!");
					document.form1.storage.focus();
					return false;
				}				
				if (document.form1.brief.value == ""  )  
				{
					alert("˵������Ϊ��!");
					document.form1.brief.focus();
					return false;
				}
								
				if (document.form1.img.value == ""  )  
				{
					alert("�ϴ��ļ�����Ϊ��!");
					document.form1.img.focus();
					return false;
				}
				if (isNaN(document.form1.price.value)) 
				{
					alert("�۸����������!");
					document.form1.price.focus();
					return false;
				}
				if (isNaN(document.form1.storage.value)) 
				{
					alert("���������������!");
					document.form1.storage.focus();
					return false;
				}
			}
</script>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('�����ظ�!')</script><%
}
%>  
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AddBookServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table border="1" width="42%" bordercolorlight="#C0C0C0">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25" align="right">���ﹷ���ƣ�</td>
			<td height="25" >
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25" align="right">���أ�</td>
			<td height="25" >
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25" align="right">�������ڣ�</td>
			<td height="25" >
			<INPUT style="WIDTH: 130px; HEIGHT: 16px" name=publishing value="" readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd');"></td>
		</tr>
		<tr>
			<td height="25" align="right">���أ�</td>
			<td height="25" >
			<input type="text" name="number" size="45">kg</td>
		</tr>
		<tr>
			<td height="25" align="right">�۸�</td>
			<td height="25" >
			<input type="text" name="price" size="45">Ԫ</td>
		</tr>
		<tr>
			<td height="25" align="right">�������</td>
			<td height="25" >
			<input type="text" name="storage" size="45">ֻ</td>
		</tr>
		<tr>
			<td height="25" align="right">˵����</td>
			<td height="25" >
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25" align="right">���</td>
			<td height="25" >
			<select name="type">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            %>
             <option value="<%=alRow.get(0)%>"><%=alRow.get(1)%></option>
             <%}%>
			</select>
			</td>
		</tr>
		<tr>
			<td height="25" align="right">
	    �ȼ���</td>
			<td height="25">
			<select name="tate">
			<option value="1">�����Ƽ�</option>
			<option value="2">�����ϼ�</option>
			</select></td>
		</tr>
		<tr>
			<td height="25" align="right">
	    �ϴ�ͼƬ��</td>
			<td height="25">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25" align="center" colspan="2">
			<input type="submit" value="���"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>