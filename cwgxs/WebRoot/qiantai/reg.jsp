<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
  </head>
  <script language="JavaScript">
		function check11()
			{
				var pattern = /^[a-zA-Z0-9_]+$/;
				var ints = /^[0-9_]+$/;
				if (document.form2.name.value == "" ) 
				{
					alert("�û�������Ϊ��!");
					document.form2.name.focus();
					return false;
				}
				if (!pattern.test(document.form2.name.value) )  
				{
					alert("�û���ֻ�ܰ�����ĸ������!");
					document.form2.name.focus();
					return false;
				}
				if (document.form2.pwd.value == ""  )  
				{
					alert("���벻��Ϊ��!");
					document.form2.pwd.focus();
					return false;
				}
				if (document.form2.pwd.value.length<3  )  
				{
					alert("���볤�Ȳ���С��3λ!");
					document.form2.pwd.focus();
					return false;
				}
				if (!pattern.test(document.form2.pwd.value) )  
				{
					alert("����ֻ�ܰ�����ĸ������!");
					document.form2.pwd.focus();
					return false;
				}
				if (document.form2.qpwd.value == ""  )  
				{
					alert("ȷ�����벻��Ϊ��!");
					document.form2.qpwd.focus();
					return false;
				}
				if (document.form2.qpwd.value != document.form2.pwd.value  )  
				{
					alert("�������벻һ��!");
					document.form2.qpwd.focus();
					return false;
				}
				if (document.form2.zname.value == ""  )  
				{
					alert("��ʵ��������Ϊ��!");
					document.form2.zname.focus();
					return false;
				}
				if (document.form2.age.value == ""  )  
				{
					alert("���䲻��Ϊ��!");
					document.form2.age.focus();
					return false;
				}
				if (!ints.test(document.form2.age.value) )  
				{
					alert("����ֻ��������!");
					document.form2.age.focus();
					return false;
				}
				if (document.form2.noid.value == ""  )  
				{
					alert("���֤����Ϊ��!");
					document.form2.noid.focus();
					return false;
				}
				if (document.form2.address.value == ""  )  
				{
					alert("��ͥסַ����Ϊ��!");
					document.form2.address.focus();
					return false;
				}
				if (document.form2.phone.value == ""  )  
				{
					alert("�绰���벻��Ϊ��!");
					document.form2.phone.focus();
					return false;
				}
				if (!ints.test(document.form2.phone.value) )  
				{
					alert("�绰����ֻ��������!");
					document.form2.phone.focus();
					return false;
				}
				if (document.form2.email.value == ""  )  
				{
					alert("�������䲻��Ϊ��!");
					document.form2.email.focus();
					return false;
				}
				if (document.form2.code.value == ""  )  
				{
					alert("�������벻��Ϊ��!");
					document.form2.code.focus();
					return false;
				}
				if (!ints.test(document.form2.code.value) )  
				{
					alert("��������ֻ��������!");
					document.form2.code.focus();
					return false;
				}
			}
</script>
<%
String error1 = (String)request.getAttribute("error1");
if(error1 != null && error1.equals("1")){
%><script>alert('�û����ظ�!')</script><%
}
%>
  <body>
  <jsp:include flush="true" page="top.jsp"/>
  <form action="servlet/RegServlet" name="form2" method="post" onSubmit="return check11()">
  <div align="center"><br>
    <table style="border-style: solid; border-width: 1px" width="800" height="450" bordercolor="#C0C0C0"><tr>
	<td align="center" valign="top">
	<br>
  <table bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" border="1">
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#666666">����д�û���Ϣ(��<font color="red">*</font>Ϊ������)</font>
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�� �� ����</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="name"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>��������¼���û���
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">��&nbsp;&nbsp; &nbsp;�룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input name="pwd" type="password" class="input7" maxlength="10"/>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>���ȱ������3��С��10���ַ���ֻ��ΪӢ���֡�����
					</td>
				</tr>				
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">ȷ�����룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="password" name="qpwd"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>�뽫����������ٴ�����
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">��ʵ������</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="zname"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>��д������ʵ������
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">��&nbsp; &nbsp;&nbsp;��</font>
					</td>
					<td align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input type="radio" name="sex" checked value="��">
						��&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="Ů">
						Ů
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д������ʵ��Ϣ
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">��&nbsp;&nbsp; &nbsp;�䣺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="age"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>������������ʵ����
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">���֤�ţ�</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="noid"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д������ʵ��Ϣ
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">��ͥסַ��</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="address"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д������ʵ��Ϣ
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�绰���룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="phone"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д������ʵ��Ϣ(��ʽΪ02411111111��13911111111) </td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�������䣺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="email"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д����Ч���ʼ���ַ���Ա�������Ϊ���ṩ��Ч�ķ���
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�������룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="code"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>����д������ʵ��Ϣ(��ʽΪ111111)</td>
				</tr>
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input type="submit" value="ע��">
					</td>
				</tr>
				<tr>
				<%
				if(request.getAttribute("ok") != null){
				%>
					<th colspan="3" height="40" style="border: 2px groove #D5CD71" bgcolor="#FCCE8F">
						<font size="3" color="red"> ��ϲ��ע��ɹ���������</font><br>
						��ҳ����5���Ӻ��Զ���ת����ҳ����û�Զ���ת�밴<a href="qiantai/index.jsp">����</a>
					</th>
				<%}%>
				</tr>
			</table>
			</td></tr></table>
  </div>
  </form>
  <jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>