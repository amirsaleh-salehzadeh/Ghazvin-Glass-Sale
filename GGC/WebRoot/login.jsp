<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ggc.Classes.UserENT"%>
<%@taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
  <script type="text/javascript">
  <%
  	String error=null;
  	if(session.getAttribute("error")!=null){
  		error = "true";
  	}
  %>
  	function loginFormSubmit(){
  		try{
				$('form#loginForm').ajaxSubmit(function(){
					$('div#loginDIV').load('login.jsp?error='+<%=error%>);
				});
			}catch(e){
				alert(e);
			}
  	}
  	function logOut(){
		$('div#loginDIV').load('logOut.do?reqCode=logOut');
  	}
  </script>
  <body>
    <form method="POST" action="logIn" dir="rtl" id="loginForm" >
		<table>
		<%
			if(session.getAttribute("loggedInUser")==null){
		 %>
			<tr>
				<td id="userNameText" nowrap="nowrap">نام کاربری</td>
				<td><input type="text" name="username" dir="ltr" class="defaultFocus" id="userName" tabindex="1"></td>
			</tr>
			<tr>
				<td id="passwordText">کلمه عبور</td>
				<td><input type="password" name="password" dir="ltr" id="password" tabindex="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="loginFormSubmit();" value="ورود"  id="login">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<%
						if(request.getParameter("error")!=null&&request.getParameter("error").equalsIgnoreCase("true")){
							out.print("<font color=\"red\">");
							out.print("نام کاربر یا کلمه عبور اشتباه است . لطفا مجددا سعی کنید");
						}
			 		%>
				</td>
			</tr>
			<%} %>
			<tr>
				<td colspan="1" align="center">
					<%
						if(session.getAttribute("loggedInUser")!=null){
							UserENT ent = (UserENT)session.getAttribute("loggedInUser");
							if(!ent.isCompany()){
								out.print("خانم/آقای </br>");
								out.print(ent.getRealUserENT().getName()+" "+ent.getRealUserENT().getFamilyName()+"</br>");
								out.print("خوش آمدید.");
							}else{
								out.print("نماینده محترم شرکت </br>");
								out.print(ent.getCompanyUserENT().getCompanyName()+"</br>");
								out.print("خوش آمدید");
							}
						}
						%>
				</td>
			</tr>
			<%
			if(session.getAttribute("loggedInUser")!=null){
		 %>
			<tr>
				<td colspan="1" align="center" style="cursor: pointer; background-color: #A2D1FB; color: #001A43; font-weight: bold" onclick="logOut()">
					خروج
				</td>
			</tr>
						<%} %>
		</table>
	</form>
  </body>
</html>
