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
	

  </head>
  <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("公告名称不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.content.value == ""  )  
				{
					alert("公告内容不能为空!");
					document.form1.content.focus();
					return false;
				}
			}
</script> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<%
	ArrayList al = (ArrayList)request.getAttribute("affiches");
	ArrayList affiches = (ArrayList)al.get(0);
	 %>
	<form action="servlet/AfficheReworkServlet?id=<%=affiches.get(0) %>" method="post" name="form1" onSubmit="return check11()">
	<table border="1" width="40%" bordercolorlight="#C0C0C0">
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">公告名称：</td>
			<td height="25" bgcolor="#FFE3BB" align="center">
			<%=affiches.get(1) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center">
			公告内容：</td>
			<td height="25" bgcolor="#66CCFF" align="center">
			<textarea rows="25" name="content" cols="46"><%=affiches.get(2) %></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">公告名称：</td>
			<td height="25" bgcolor="#FFE3BB" align="center">
			<%
			String str[] = affiches.get(3).toString().substring(0,11).split("-");
			 %>
			 <%=str[0]%>年<%=str[1]%>月<%=str[2].toString().trim() %>日 <%=affiches.get(3).toString().substring(11,16) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">
			<input type="submit" value="修改"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>