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
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AuctionAddServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table border="1" width="43%" bordercolorlight="#C0C0C0">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
 	 ArrayList al = (ArrayList)request.getAttribute("auctionwares");
 	 ArrayList auctionwares = (ArrayList)al.get(0);
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">拍卖商品详细信息</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品名称：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(1) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产厂家：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(2) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产日期：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(3) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">规&nbsp;&nbsp;&nbsp; 格：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(4) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">拍卖底价：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(5) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">库 存 量：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(6) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">产品介绍：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(7) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品类别：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            	if(alRow.get(0).equals(auctionwares.get(8))){
            		%>&nbsp;<%=alRow.get(1) %><%
            		break;
            	}}%>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">
			拍卖开始时间：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(9).toString().substring(0,10) %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">
			拍卖结束时间：</td>
			<td height="25" bgcolor="#FFE3BB">
			&nbsp;<%=auctionwares.get(10).toString().substring(0,10) %></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>