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
	 ArrayList order = (ArrayList)request.getAttribute("order");
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">订 单 号：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
			for(int i = 0;i < order.size();i++){
			ArrayList orerRow = (ArrayList)order.get(i);
			%><%=orerRow.get(2)%><%
			break;
			}
			 %>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">订 购 人：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
			for(int i = 0;i < order.size();i++){
			ArrayList orerRow = (ArrayList)order.get(i);
			%><%=orerRow.get(3)%><%
			break;
			}
			 %>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">联系方式：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
			for(int i = 0;i < order.size();i++){
			ArrayList orerRow = (ArrayList)order.get(i);
			%><%=orerRow.get(4)%><%
			break;
			}
			 %>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">家庭住址：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%
			for(int i = 0;i < order.size();i++){
			ArrayList orerRow = (ArrayList)order.get(i);
			%><%=orerRow.get(5)%><%
			break;
			}
			 %>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">所订商品：</td>
			<td height="25" bgcolor="#FFE3BB">
			<table width="100%" border="1" bordercolor="#C0C0C0">
			<tr><td align="center">商品名称</td><td align="center">商品单价(元)</td>
				<td align="center">合计(元)</td></tr>
			<%
			int flag = 0;
			for(int i = 0;i < order.size();i++){
			ArrayList orerRow = (ArrayList)order.get(i);
			%>
			<tr><td align="center"><%=orerRow.get(6)%></td><td align="center"><%=orerRow.get(7)%></td>
				<td align="center"><%=Integer.parseInt(orerRow.get(7).toString())*Integer.parseInt(orerRow.get(8).toString())%></td></tr>
			<%
			flag += Integer.parseInt(orerRow.get(7).toString())*Integer.parseInt(orerRow.get(8).toString());
			}
			 %>
			 </table>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">应 付 款：</td>
			<td height="25" bgcolor="#FFE3BB">
			<%=flag %>元</td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>