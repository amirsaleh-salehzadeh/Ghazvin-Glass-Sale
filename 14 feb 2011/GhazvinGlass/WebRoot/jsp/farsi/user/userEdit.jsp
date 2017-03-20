<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<script type="text/javascript">
 		function saveEdit(){
 			$("#reqCode").val("saveEdit");
 			$('#userInsertForm').submit();
 		}
 	</script>
  </head>
	<bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
  <body>
 	<ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
	<form action="t_user.do" id="userInsertForm" method="post" >
	<input type="hidden" name="reqCode" id="reqCode" value="edit">
	  <table align="center" class="formTable">
    	<tr>
    		<th valign="top" align="center" colspan="2" class="formHeader">
				<logic:notEmpty name="userENT" property="realUserENT.name">
					<input type="hidden" name="type" value="real" >
					کاربر حقیقی
				</logic:notEmpty>
				<logic:notEmpty name="userENT" property="companyUserENT.companyName">
					<input type="radio" name="type" value="real" >
	    			کاربر حقوقی
				</logic:notEmpty>    			
    		</th>
    	</tr>
    	<tr>
    		<th align="right" colspan="2" width="100%">
   				نام کاربری:
   				<bean:write property="userName" name="userENT" ></bean:write> 
				<html:hidden property="userName" name="userENT" ></html:hidden>
			</th>
    	</tr>
   		<tr>
    		<td colspan="2" valign="top" align="right">
    			<logic:notEmpty name="userENT" property="realUserENT.name">
					<table align="center" id="realTable">
				    	<tr>
				    		<th valign="top" align="right">
				   				نام:
				    		</th>
				    		<td>
				   				<html:text property="realUserENT.name" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<th valign="top" align="right">
						    	نام خانوادگی:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.familyName" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<th valign="top" align="right">
						    	کد ملی:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.nationalID" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<th valign="top" align="right">
						    	ناریخ تولد :
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.dob" name="userENT" ></html:text>
				    		</td>
				    	</tr>
<!--				    	<tr>-->
<!--				    		<th valign="top" align="right">-->
<!--						    	فعالیت :-->
<!--				    		</th>-->
<!--				    		<td>-->
<!--				    			<html:text property="realUserENT.occupation" name="userENT" ></html:text>-->
<!--				    		</td>-->
<!--				    	</tr>-->
				    	<tr>
				    		<th valign="top" align="right">
						    	شماره تلفن :
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.tel" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				 	    <tr>
				   			<th valign="top" align="right">
						    	شماره فکس:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.faxNo" name="userENT" ></html:text>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<th valign="top" align="right">
						    	آدرس اینترنتی:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.webSiteAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<th valign="top" align="right">
						    	آدرس پست الکترونیکی:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.emailAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<th  valign="top" align="right">
						    	آدرس:
				    		</th>
				    		<td>
				    			<html:text property="realUserENT.address" name="userENT" ></html:text>
				    		</td>
				    	</tr>
					  </table>
				  </logic:notEmpty>
				  <logic:notEmpty name="userENT" property="companyUserENT.companyName">
				  	  <table align="center" id="legalTable">
				    	<tr>
				    		<th  valign="top" align="right">
				   				نام سازمان:
				    		</th>
				    		<td>
				   				<html:text property="companyUserENT.companyName" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<th  valign="top" align="right">
						    	کد اقتصادی:
				    		</th>
				    		<td>
				    			<html:text property="companyUserENT.economicNumber" name="userENT" ></html:text>
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
						    	شماره فکس:
				    		</th>
				    		<td>
				    			<html:text property="companyUserENT.faxNo" name="userENT" ></html:text>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<th  valign="top" align="right">
						    	آدرس اینترنتی:
				    		</th>
				    		<td>
				    			<html:text property="companyUserENT.webSiteAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<th valign="top" align="right">
						    	آدرس پست الکترونیکی:
				    		</th>
				    		<td>
				    			<html:text property="companyUserENT.emailAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<th valign="top" align="right">
						    	آدرس:
				    		</th>
				    		<td>
				    			<html:text property="companyUserENT.address" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				  	</table>
			  	</logic:notEmpty>
    		</td>
    	</tr>
    	<tr>
   			<th valign="top" align="center">
		    	تایید شده
    		</th>
    		<td align="center">
    			<html:checkbox property="isConfirmed" name="userENT"></html:checkbox>
    		</td>
    	</tr>
   		<tr>
    		<td onclick="saveEdit();" style="cursor: pointer;">
    			<img src="images/buttons/edit48.png"></img>ویرایش
    		</td>
    		<td style="cursor: pointer;" onclick="window.location.replace('t_user.do?reqCode=list')">
    			<img src="images/buttons/return.png"></img>بازگشت
    		</td>
    	</tr>
 	  </table>
	</form>
  </body>
</html>
