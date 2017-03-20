<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<script type="text/javascript">
 		function saveEdit(){
 			$("#reqCode").val("saveEdit");
 			try{
				var options = {
				    success: function(req) {
				        alert("اطلاعات با موفقیت ذخیره شد.");
				    }
				    ,error: function(req){
				    	alert("ذخیره اطلاعات با مشکل مواجه شده است" + req.responseText);
				    }
				   };
					$('#orderInsertForm').ajaxSubmit(function(data){
						$("div#mainBody").html(data);
					});			
				}catch(e){
					alert(e);
				}
 		}
 	</script>
  </head>
  <body>
	<form action="user.do" id="userInsertForm" method="post" >
	<input type="hidden" name="reqCode" id="reqCode" value="confirmUser">
	  <table align="center" class="formTable">
    	<tr>
    		<th valign="top" align="center" colspan="2">
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
    		<td align="right" colspan="1">
   				نام کاربری:
    		</td>
    		<td>
   				<bean:write property="userName" name="userENT" ></bean:write> 
				<html:hidden property="userName" name="userENT" ></html:hidden>
			</td>
    	</tr>
    	<tr>
    		<td align="right">
		    	کلمه عبور:
    		</td>
    		<td>
    			<html:password property="password" name="userENT" ></html:password>
    		</td>
    	</tr>
   		<tr>
    		<td colspan="2" valign="top" align="right">
    			<logic:notEmpty name="userENT" property="realUserENT.name">
					<table align="center" id="realTable">
				    	<tr>
				    		<td valign="top" align="right">
				   				نام:
				    		</td>
				    		<td>
				   				<html:text property="realUserENT.name" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td valign="top" align="right">
						    	نام خانوادگی:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.familyName" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td valign="top" align="right">
						    	کد ملی:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.nationalID" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td valign="top" align="right">
						    	ناریخ تولد :
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.dob" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td valign="top" align="right">
						    	فعالیت :
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.occupation" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td valign="top" align="right">
						    	شماره تلفن :
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.tel" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				 	    <tr>
				   			<td valign="top" align="right">
						    	شماره فکس:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.faxNo" name="userENT" ></html:text>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<td valign="top" align="right">
						    	آدرس اینترنتی:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.webSiteAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td valign="top" align="right">
						    	آدرس پست الکترونیکی:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.emailAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td  valign="top" align="right">
						    	آدرس:
				    		</td>
				    		<td>
				    			<html:text property="realUserENT.address" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td valign="top" align="center">
						    	تایید شده
				    		</td>
				    		<td align="center">
				    			<html:checkbox property="isConfirmed" name="userENT"></html:checkbox>
				    		</td>
				    	</tr>
					  </table>
				  </logic:notEmpty>
				  <logic:notEmpty name="userENT" property="companyUserENT.companyName">
				  	  <table align="center" id="legalTable">
				    	<tr>
				    		<td  valign="top" align="right">
				   				نام سازمان:
				    		</td>
				    		<td>
				   				<html:text property="companyUserENT.companyName" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td  valign="top" align="right">
						    	کد اقتصادی:
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.economicNumber" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td  valign="top" align="right">
						    	شماره تماس :
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.tel" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				 	    <tr>
				   			<td  valign="top" align="right">
						    	شماره فکس:
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.faxNo" name="userENT" ></html:text>
				    		</td>
				    	</tr> 
				    	<tr>
				   			<td  valign="top" align="right">
						    	آدرس اینترنتی:
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.webSiteAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td  valign="top" align="right">
						    	آدرس پست الکترونیکی:
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.emailAddress" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td  valign="top" align="right">
						    	آدرس:
				    		</td>
				    		<td>
				    			<html:text property="companyUserENT.address" name="userENT" ></html:text>
				    		</td>
				    	</tr>
				    	<tr>
				   			<td  valign="top" align="center">
						    	تایید شده
				    		</td>
				    		<td align="center">
				    			<html:checkbox property="isConfirmed" name="userENT" disabled="true"></html:checkbox>
				    		</td>
				    	</tr>
				  	</table>
			  	</logic:notEmpty>
    		</td>
    	</tr>
    	<%if(request.getParameter("reqCode").equalsIgnoreCase("edit")){ %>
	   		<tr>
	    		<td>
	    			<input type="button" value="ویرایش" onclick="saveEdit();">
	    		</td>
	    	</tr>
    	<%}%>
 	  </table>
	</form>
  </body>
</html>
