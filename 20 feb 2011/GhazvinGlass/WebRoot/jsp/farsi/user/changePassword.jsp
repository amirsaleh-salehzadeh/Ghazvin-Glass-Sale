<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="ams.ggc.common.tools.SecurityUtil"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<html>
<head>
	<script type="text/javascript" src="js/security/change.password.js"></script>
	<script type="text/javascript" src="js/jquery.form.js" ></script>
</head>
	<bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
  <body>
 	<ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
	<form action="register.do" id="changePasswordForm">
		<br><input  type="hidden" name="reqCode" value="changePassword">
		<table class="formTable" align="center">
			<tr>
				<th colspan="2" class="formHeader">
					تغییر رمز نام کاربری "<%=request.getRemoteUser() %>"
				</th>
			</tr>
			<%SecurityUtil util = new SecurityUtil();
			
			if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator,salemng,usermng")){ %>
				<tr>
					<th>
						نام کاربری
					</th>
					<td>
						<input type="text" name="username">
					</td>
				</tr>
			<%} %>
			<tr>
				<th>
					رمز قدیم
				</th>
				<td>
					<input type="password" name="oldPass">
				</td>
			</tr>
			<tr>
				<th>
					رمز جدید
				</th>
				<td>
					<input type="password" name="newPass" id="pass">
				</td>
			</tr>
			<tr>
				<th>
					تکرار رمز جدید
				</th>
				<td>
					<input type="password" id="repass">
				</td>
			</tr>
			<tr>
				<td colspan="2"  onclick="changePassFormSumbit(); " style="cursor: pointer;">
					تایید<img src="images/buttons/confirm1.png"></img>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>
