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
	<form action="" method="post" name="form1">
	<table border="1" width="38%" bordercolorlight="#C0C0C0">
	<%
	 ArrayList al = (ArrayList)request.getAttribute("bookinf");
 	 ArrayList bookinf = (ArrayList)al.get(0);
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品名称：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T1" size="45" disabled value="<%=bookinf.get(1)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产厂家：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T2" size="45" disabled value="<%=bookinf.get(2)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产日期：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T3" size="45" disabled value="<%=bookinf.get(3)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">规&nbsp;&nbsp;&nbsp; 格：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T4" size="45" disabled value="<%=bookinf.get(4)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">单&nbsp;&nbsp;&nbsp; 价：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T5" size="45" disabled value="<%=bookinf.get(5)%>元"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">库 存 量：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="T6" size="45" disabled value="<%=bookinf.get(6)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">产品介绍：</td>
			<td height="25" bgcolor="#FFE3BB">
			<textarea rows="12" name="S1" cols="43" disabled><%=bookinf.get(7)%></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品类别：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            	if(alRow.get(0).equals(bookinf.get(8))){ 
            %>
             <%=alRow.get(1)%>
              <%break;}} %></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">已销数量：</td>
			<td height="25" bgcolor="#FFE3BB"><%=bookinf.get(10)%></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>