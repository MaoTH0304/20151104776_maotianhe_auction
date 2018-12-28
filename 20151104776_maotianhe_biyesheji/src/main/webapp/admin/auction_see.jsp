<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="gb2312"%>
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
  	%><script>alert('销售成功!')</script><%
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
			<td align="center">用户ID</td>
			<td align="center">真实姓名</td>
			<td align="center">邮箱地址</td>
			<td align="center">商品名称</td>
			<td align="center">拍卖结束日期</td>
			<td align="center">现在时间</td>
			<td align="center">底价(元)</td>
			<td align="center">拍卖价(元)</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList auctionprice = (ArrayList)request.getAttribute("auctionprice");
		ArrayList auctionware = (ArrayList)request.getAttribute("auctionware");
		ArrayList users = (ArrayList)request.getAttribute("users");
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd",Locale.getDefault());
		Date currentDate = new Date();
		String lastdate = formatter.format(currentDate);		
		for(int i = 0;i < auctionprice.size();i++){
			ArrayList alRow = (ArrayList)auctionprice.get(i);
			if(alRow.get(4).equals("1")){
				continue;
			}
		 %>
		<tr>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<a href="servlet/AdminShowUserServlet?id=<%=alRow.get(1) %>" title="点击查看该用户详细信息"><%=alRow.get(1) %></a></td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<a href="servlet/AdminShowUserServlet?id=<%=alRow.get(1) %>" title="点击查看该用户详细信息">
			<%
			for(int j = 0;j < users.size();j++){
				ArrayList usersRow = (ArrayList)users.get(j);
				if(usersRow.get(0).equals(alRow.get(1))){
					%><%=usersRow.get(3) %><%
					break;
				}
			}
			 %></a>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			for(int j = 0;j < users.size();j++){
				ArrayList usersRow = (ArrayList)users.get(j);
				if(usersRow.get(0).equals(alRow.get(1))){
					%><%=usersRow.get(9) %><%
					break;
				}
			}
			 %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<a href="servlet/AuctionShowServlet?id=<%=alRow.get(2) %>&adminshow=1" title="点击查看此拍卖商品详细信息">
			<%
			for(int j = 0;j < auctionware.size();j++){
				ArrayList auctionwareRow = (ArrayList)auctionware.get(j);
				if(auctionwareRow.get(0).equals(alRow.get(2))){
					%><%=auctionwareRow.get(1) %><%
					break;
				}
			}
			 %>
			</a></td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			for(int j = 0;j < auctionware.size();j++){
				ArrayList auctionwareRow = (ArrayList)auctionware.get(j);
				if(auctionwareRow.get(0).equals(alRow.get(2))){
					%><%=auctionwareRow.get(10).toString().substring(0,10) %><%
					break;
				}
			}
			 %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=lastdate %></td>
			<td bgcolor="#FFE3BB" align="center" height="20">
			<%
			for(int j = 0;j < auctionware.size();j++){
				ArrayList auctionwareRow = (ArrayList)auctionware.get(j);
				if(auctionwareRow.get(0).equals(alRow.get(2))){
					%><%=auctionwareRow.get(5) %><%
					break;
				}
			}
			 %>
			</td>
			<td bgcolor="#FFE3BB" align="center" height="20"><%=alRow.get(3) %></td>
			<td bgcolor="#FFE3BB" align="center" height="20"><a href="servlet/AuctionSaleServlet?id=<%=alRow.get(0) %>">出售</a></td>
		</tr>
		<%} %>
	</table>
  	</div>
  </body>
</html>