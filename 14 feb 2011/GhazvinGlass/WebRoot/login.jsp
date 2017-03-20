<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="tiles"
	uri="http://jakarta.apache.org/struts/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript" src="jquery/jquery.js"></script>
		<%
			if (request.getRemoteUser() != null) {
		%>
		<script type="text/javascript">
				window.location="t_requestForPage.do?reqCode=farsi";
			</script>
		<%
			}
		%>
		<style type="text/css">
		table#signupform{
			background-image: url("images/welcomePage/middle.png");
			max-width: 210px;
		}
		</style>
	</head>
	<body dir="LTR">
		<form method="POST" action="j_security_check" dir="rtl" id="loginForm">
			<br>

			<table id="signupform" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2" valign="top" align="left">
						<img src="images/welcomePage/top.png"></img>
					</td>
				</tr>
				<tr>
					<td align="left">

						<table align="center" class="formTable"
							cellpadding="0" cellspacing="0">

							<tr>
								<th colspan="2" class="formHeader" valign="top">
									ورود به سیستم
								</th>
							</tr>
							<tr>
								<th id="userNameText" nowrap="nowrap" align="center">
									نام کاربری
								</th>
								<td>
									<input size="16" type="text" name="j_username" dir="ltr"
										class="defaultFocus" tabindex="1">
									<br />
								</td>
							</tr>
							<tr>
								<th  id="passwordText" align="center">
									کلمه عبور
								</th>
								<td>
									<input size="16" type="password" name="j_password" dir="ltr" tabindex="2">

								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<br />
						<img src="images/welcomePage/login0.png"
							onclick="$('form#loginForm').submit();" style="cursor: pointer;"
							onmouseover="$(this).attr('src','images/welcomePage/login1.png')"
							onmouseout="$(this).attr('src','images/welcomePage/login0.png')"></img>
					</td>
				</tr>
				<tr>
					<td align="center">
						<br />
						<img src="images/welcomePage/register0.png"
							onclick="window.location.replace('t_register.do');"
							style="cursor: pointer;"
							onmouseover="$(this).attr('src','images/welcomePage/register1.png')"
							onmouseout=
	$(this).attr('src', 'images/welcomePage/register0.png');
></img>
					</td>
				</tr>
				<tr>
					<td align="left">
						<img src="images/welcomePage/bottom.png"></img>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
