<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
  	<script type="text/javascript" src="js/security/user.registration.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<style type="text/css">
 	.containerDIV{
 		visibility: hidden;
 	}
 	</style>
  </head>
<bean:define id="error" name="error" type="java.lang.String"></bean:define>
<bean:define id="success" name="success" type="java.lang.String"></bean:define>
 <body>
  <ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
	<form action="t_register.do" id="userInsertForm" method="post" onsubmit="return validateForm()">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table align="center" class="formTable" height="100%">
	  <%if("save".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
	  	<tr>
    		<th align="center" colspan="2" >
   				<span style="color: red;"> خطا در عملیات ثبت</span>
    		</th>
    	</tr>
    	<%} %>
    	<tr>
    		<th align="center" class="formHeader" colspan="2">
   				ثبت نام کاربر
    		</th>
    	</tr>
    	<tr>
    		<th align="right">
   				نام کاربری:
    		</th>
    		<td ><html:text property="userName" name="userENT" styleId="userName"></html:text>
    		وضعیت نام کاربری<img src="images/buttons/search.png" onclick="checkValidty()" style="cursor:pointer"></img>
   				 
   				<logic:equal value="isNotValid" name="availability">
					<span style="color: red; " >
   						ثبت شده
   					</span>
   				</logic:equal>
   				<logic:equal value="isValid" name="availability">
   					<span style="color: green;" >
   						آزاد
					</span>
   				</logic:equal>
    		</td>
    	</tr>
    	<tr>
    		<th align="right">
		    	رمز عبور:
    		</th>
    		<td>
    			<html:password property="password" styleId="pass" name="userENT" ></html:password>
    		</td>
    	</tr>
    	<tr>
    		<th align="right">
		    	تکرار رمز عبور:
    		</th>
    		<td>
    			<input type="password" id="repass">
    		</td>
    	</tr>
   		<tr>
    		<td valign="top" align="right">
				کاربر حقیقی<input type="radio" name="type" value="real" onclick="changeUserType(this)" class="typeCombo">
    		</td>
    		<td>
    			کاربر حقوقی	<input type="radio" name="type" value="legal" onclick="changeUserType(this)" class="typeCombo">
    		</td>
    	</tr>
   		<tr id="userRow">
    		<td colspan="2" valign="top" align="center" style="">
			  	  <div id="mainContainer"></div>
    		</td>
    	</tr>
    	<tr>
    		<td onclick="submitRegisterForm()" colspan="7" style="cursor: pointer;">
    			ثبت نام<img src="images/buttons/new.png"></img>
    		</td>
    	</tr>
 	  </table>
	</form>
	<div id="realUser" class="containerDIV">
		<table align="center" >
	    	<tr>
	    		<th  valign="top" align="right">
	   				نام :
	    		</th>
	    		<td>
	   				<html:text property="realUserENT.name" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	نام خانوادگی :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.familyName" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	 کد ملی :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.nationalID" name="userENT" styleId="nationalID"></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	تاریخ تولد :
	    		</th>
	    		<th>
	    		سال:
	    			<select name="year" id="year">
	    				<option></option>
	    				<%for(int i = 1389 ; i >= 1300 ; i-- ){ %>
	    				<option value="<%=i %>"><%=i %></option>
	    				<%} %>
	    			</select>
	    		ماه:
	    			<select name="month" id="month">
	    				<option></option>
	    				<%for(int i = 1 ; i <= 12 ; i++ ){ %>
	    				<option value="<%=i %>"><%=i %></option>
	    				<%} %>
	    			</select>
				روز:
	    			<select name="day" id="day">
	    				<option></option>
	    				<%for(int i = 1 ; i <= 31 ; i++ ){ %>
	    				<option value="<%=i %>"><%=i %></option>
	    				<%} %>
	    			</select>
	    		</th>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	شماره تلفن :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.tel" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	 	    <tr>
	   			<th  valign="top" align="right">
			    	شماره فکس :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.faxNo" name="userENT" ></html:text>
	    		</td>
	    	</tr> 
	    	<tr>
	   			<th  valign="top" align="right">
			    	آدرس اینترنتی :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.webSiteAddress" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	   			<th  valign="top" align="right">
			    	آدرس پست الکترونیکی :
	    		</th>
	    		<td>
	    			<html:text property="realUserENT.emailAddress" styleId="realemail" name="userENT" styleClass="email"></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	   			<th  valign="top" align="right">
			    	آدرس :
	    		</th>
	    		<td>
	    			<html:textarea property="realUserENT.address" name="userENT" ></html:textarea>
	    		</td>
	    	</tr>
		  </table>
	</div>
	<div id="legalUser" class="containerDIV">
		<table align="center" >
	    	<tr>
	    		<th  valign="top" align="right">
	   				نام سازمان :
	    		</th>
	    		<td>
	   				<html:text property="companyUserENT.companyName" name="userENT" styleId="companyName"></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	کد اقتصادی :
	    		</th>
	    		<td>
	    			<html:text property="companyUserENT.economicNumber" name="userENT" styleId="econNo"></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th  valign="top" align="right">
			    	شماره تماس :
	    		</th>
	    		<td>
	    			<html:text property="companyUserENT.tel" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	 	    <tr>
	   			<th  valign="top" align="right">
			    	شماره فکس :
	    		</th>
	    		<td>
	    			<html:text property="companyUserENT.faxNo" name="userENT" ></html:text>
	    		</td>
	    	</tr> 
	    	<tr>
	   			<th valign="top" align="right">
			    	آدرس اینترنتی :
	    		</th>
	    		<td>
	    			<html:text property="companyUserENT.webSiteAddress" name="userENT" ></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	   			<th valign="top" align="right">
			    	آدرس پست الکترونیکی :
	    		</th>
	    		<td>
	    			<html:text property="companyUserENT.emailAddress" name="userENT" styleClass="email" styleId="legalemail"></html:text>
	    		</td>
	    	</tr>
	    	<tr>
	   			<th valign="top" align="right">
			    	آدرس :
	    		</th>
	    		<td><html:textarea property="companyUserENT.address" name="userENT" ></html:textarea>
	    		</td>
	    	</tr>
	  	</table>
	</div>
  </body>
</html>
