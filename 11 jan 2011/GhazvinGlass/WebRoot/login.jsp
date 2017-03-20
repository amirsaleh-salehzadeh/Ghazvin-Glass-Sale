<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="tiles" uri="http://jakarta.apache.org/struts/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="css/common.css" type="text/css" rel="stylesheet" />
<!--		<%if(request.getRemoteUser()!=null){%>-->
<!--		<script type="text/javascript">-->
<!--			window.location("/t_requestForPage.do?reqCode=farsi");-->
<!--		</script>-->
<!--		<%} %>-->
	</head>
	<body dir="LTR">
		<form method="POST" action="j_security_check" dir="rtl" id="loginForm">
			<br>
			<table align="center" class="dataList">
				<tr>
					<th colspan="2">
						ورود به سیستم
					</th>
				</tr>
				<tr>
					<td id="userNameText">
						نام کاربری
					</td>
					<td>
						<input type="text" name="j_username" dir="ltr" class="defaultFocus" id="userName" tabindex="1">
					</td>
				</tr>
				<tr>
					<td id="passwordText">
						کلمه عبور
					</td>
					<td>
						<input type="password" name="j_password" dir="ltr" id="password" tabindex="2">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="ورود" id="login" style="cursor: pointer;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
