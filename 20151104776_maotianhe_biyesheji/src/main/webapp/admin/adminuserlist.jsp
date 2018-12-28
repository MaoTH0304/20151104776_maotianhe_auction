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
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('最后一个用户不能删除!')</script><%
}
%> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table border="0" width="800" id="table1" bgcolor="#CCFFCC"><tbody style="margin: 0; padding: 0">
					<tr class="ry">
						<td class="pl" width="726" align="center" colspan="4" height="40" bgcolor="#FFF8F0">						
						<a href="admin/modifypwd.jsp">修改密码</a>&nbsp;&nbsp;&nbsp; 
						<a href="admin/modifyname.jsp">修改用户名</a>						
						&nbsp;&nbsp;&nbsp; <a href="admin/adduser.jsp">添加系统管理员</a>
						&nbsp;&nbsp;&nbsp; <a href="admin/adminuserlist.jsp">删除系统管理员</a>
						&nbsp;&nbsp;&nbsp; <a href="admin/adminlog.jsp">管理员日志</a>
						</td>
					</tr>
		<tr>
			<td align="center">管理员ID</td>
			<td align="center">用户名</td>
			<td align="center">密码</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("admin");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(0) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(1) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(2) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/DelServlet?adminid=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
	</table>
  	</div>
  </body>
</html>