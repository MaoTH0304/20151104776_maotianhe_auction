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
	<div align="center">
		<table border="0" height="35">
			<tr>
				<td><a href="admin/auction_add.jsp">添加新拍卖商品</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="admin/auction_see.jsp">拍卖查看</a></td>
			</tr>
		</table>
	</div>
  	<table border="0" width="800" id="table1" bgcolor="#CCFFCC">
		<tr>
			<td align="center">商品名称</td>
			<td align="center">生产厂家</td>
			<td align="center">生产日期</td>
			<td align="center">底价(元)</td>
			<td align="center">　</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("auctionware");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/AuctionShowServlet?id=<%=alRow.get(0) %>&adminshow=1" title="点击查看此拍卖商品详细信息"><%=alRow.get(1) %></a></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(2) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(3) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(5) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/AuctionShowServlet?id=<%=alRow.get(0) %>&adminupdate=1">修改</a></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/DelServlet?auctionware=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
	</table>
  	</div>
  </body>
</html>