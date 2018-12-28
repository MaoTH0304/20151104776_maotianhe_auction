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
					alert("商品名称不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )  
				{
					alert("厂家不能为空!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )  
				{
					alert("生产日期不能为空!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )  
				{
					alert("规格不能为空!");
					document.form1.number.focus();
					return false;
				}				
				if (document.form1.price.value == ""  )  
				{
					alert("拍卖底价不能为空!");
					document.form1.price.focus();
					return false;
				}				
				if (document.form1.storage.value == ""  )  
				{
					alert("库存量不能为空!");
					document.form1.storage.focus();
					return false;
				}				
				if (document.form1.brief.value == ""  )  
				{
					alert("产品介绍不能为空!");
					document.form1.brief.focus();
					return false;
				}
				if (document.form1.endyear.value == ""  )  
				{
					alert("结束时间年份不能为空!");
					document.form1.endyear.focus();
					return false;
				}				
				if (document.form1.img.value == ""  )  
				{
					alert("上传文件不能为空!");
					document.form1.img.focus();
					return false;
				}
				if (isNaN(document.form1.price.value)) 
				{
					alert("拍卖底价必须是数字!");
					document.form1.price.focus();
					return false;
				}
				if (isNaN(document.form1.storage.value)) 
				{
					alert("库存量必须是数字!");
					document.form1.storage.focus();
					return false;
				}				
				if (isNaN(document.form1.endyear.value)  )  
				{
					alert("结束时间年份必须是数字!");
					document.form1.endyear.focus();
					return false;
				}
			}
</script>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('名称重复!')</script><%
}
%>  
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AuctionAddServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table border="1" width="43%" bordercolorlight="#C0C0C0">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">添加新拍卖商品</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品名称：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产厂家：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">生产日期：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="publishing" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">规&nbsp;&nbsp;&nbsp; 格：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="number" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">拍卖底价：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="price" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">库 存 量：</td>
			<td height="25" bgcolor="#FFE3BB">
			<input type="text" name="storage" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">产品介绍：</td>
			<td height="25" bgcolor="#FFE3BB">
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">商品类别：</td>
			<td height="25" bgcolor="#FFE3BB">
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
			<td height="25" bgcolor="#66CCFF" align="right">
			拍卖结束时间：</td>
			<td height="25" bgcolor="#66CCFF">
			&nbsp;<input class="input7" type="text" name="endyear" size="12"> 
						年 <select name="endmonth">
						<%
						for(int i = 1;i <= 12;i++){
							if(i <= 9){
							%><option value="0<%=i%>">0<%=i%></option><%
							}else{
						%>
						<option value="<%=i%>"><%=i%></option>
						<%}}%>
						</select> 月 
						<select name="endday">
						<%
						for(int i = 1;i <= 31;i++){
							if(i <= 9){
							%><option value="0<%=i%>">0<%=i%></option><%
							}else{
						%>
						<option value="<%=i%>"><%=i%></option>
						<%}}%>
						</select> 日</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right">
			上传图片：</td>
			<td height="25" bgcolor="#66CCFF">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">
			<input type="submit" value="添加"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>