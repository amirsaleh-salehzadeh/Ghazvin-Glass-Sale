<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
  </head>
  <body>
	<form action="user.do" id="userInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table align="center" class="formTable">
    	<tr>
    		<th align="center" colspan="2">
   				ثبت نام کاربر
    		</th>
    	</tr>
    	<tr>
    		<td align="right" nowrap="nowrap">
   				نام کاربری:
    		</td>
    		<td width="100%">
   				<bean:write property="userName" name="userENT"></bean:write> 
    		</td>
    	</tr>
   		<tr>
    		<td colspan="2" valign="top" align="right">
    			<logic:empty name="userENT" property="companyUserENT.companyName">
					<table align="center" id="realTable">
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
				   				نام :
				    		</td>
				    		<td>
				   				<bean:write property="realUserENT.name" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	نام خانوادگی :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.familyName" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	 کد ملی :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.nationalID" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	ناریخ تولد :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.dob" name="userENT" ></bean:write>
				    			
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	فعالیت :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.occupation" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	شماره تلفن :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.tel" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				 	    <tr>
				   			<td colspan="6" valign="top" align="right">
						    	شماره فکس :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.faxNo" name="userENT" ></bean:write>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس اینترنتی :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.webSiteAddress" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس پست الکترونیکی :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.emailAddress"  name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس :
				    		</td>
				    		<td>
				    			<bean:write property="realUserENT.address" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
					  </table>
				  </logic:empty>
				  <logic:notEmpty name="userENT" property="companyUserENT.companyName">
				  	  <table align="center" id="legalTable">
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
				   				نام سازمان :
				    		</td>
				    		<td>
				   				<bean:write property="companyUserENT.companyName" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	کد اقتصادی :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.economicNumber" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td colspan="6" valign="top" align="right">
						    	شماره تماس :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.tel" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				 	    <tr>
				   			<td colspan="6" valign="top" align="right">
						    	شماره فکس :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.faxNo" name="userENT" ></bean:write>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس اینترنتی :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.webSiteAddress" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس پست الکترونیکی :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.emailAddress" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td colspan="6" valign="top" align="right">
						    	آدرس :
				    		</td>
				    		<td>
				    			<bean:write property="companyUserENT.address" name="userENT" ></bean:write>
				    		</td>
				    	</tr>
				  	</table>
			  	</logic:notEmpty>
    		</td>
    	</tr>
    	<tr>
			<td colspan="2" align="center">
				کاربر گرامی اطلاعات شما با موفقیت ثبت گردید. <br/>
				نام کاربری شما در مدت 48 ساعت کاری فعال می گردد.
			</td>    	
    	</tr>
 	  </table>
	</form>
  </body>
</html>
