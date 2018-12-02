<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	
	.lo{
		width:1300px;
		height:500px;
	}
	
	.up{
		width:100%;
		height:50%;

	}
	.down{
		position:absolute;
		left:30%;
		top:50%;
		width:100%;
		height:50%;
	}

</style> 

<body>

<div class = "lo">
	<div class = "up">
	</div>
<div class = "down">
	
	<form action="<%= request.getContextPath() %>/BloginServlet?action=denglu" method="post" >

	<table>
	<tr>
	
	<th align="left" style="font-size:15px">用户名：<input type="text" name="Bu_phone" required placeholder="请输入帐号" /></th>
	<th></th>
	<th align="right" style="font-size:15px">密码：<input type="text" name="Bul_password" required placeholder="请输入密码" /></th>
	<th></th>	
	</tr>

	<tr>
	<th></th>
	<th></th>
	<th align="right"><input type="submit" value="确定"/></th>
	<th><input type="button" onclick="window.location.href='Register.jsp'" value="新用户注册"/></th>
	</tr>	
	</table>
		</form>
		</div>
	</div>

</body>
</html>