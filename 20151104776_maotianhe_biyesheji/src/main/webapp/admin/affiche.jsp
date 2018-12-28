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
  <body>
  <%
  String ok = (String)request.getAttribute("ok");
  if(ok != null && !ok.equals("")){
  	%><script>alert('添加成功!')</script><%
  }
   %>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table border="0" width="800" id="table1" bgcolor="#CCFFCC">
		<tr>
			<td align="center">公告名称</td>
			<td align="center">公告内容</td>
			<td align="center">添加时间</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("affiche");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			if(alRow.get(1).toString().length() > 20){
			%><a href="servlet/AfficheShowServlet?show=<%=alRow.get(0) %>" title="<%=alRow.get(1) %>"><%=alRow.get(1).toString().substring(0,17) %>...</a><%
			}else{
			%><a href="servlet/AfficheShowServlet?show=<%=alRow.get(0) %>" title="<%=alRow.get(1) %>"><%=alRow.get(1) %></a><%
			}
			 %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			if(alRow.get(2).toString().length() > 30){
			%><%=alRow.get(2).toString().substring(0,27) %>...<%
			}else{
			%><%=alRow.get(2) %><%
			}
			 %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			String str[] = alRow.get(3).toString().substring(0,11).split("-");
			 %>
			 <%=str[0]%>年<%=str[1]%>月<%=str[2].toString().trim() %>日 <%=alRow.get(3).toString().substring(11,16) %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<a href="servlet/AfficheShowServlet?rework=<%=alRow.get(0) %>">修改</a>&nbsp;&nbsp;
			<a href="servlet/DelServlet?afficheid=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" colspan="4" height="25"><a href="admin/addaffiche.jsp">添加新公告</a></td>
		</tr>
	</table>
  	</div>
  </body>
</html>