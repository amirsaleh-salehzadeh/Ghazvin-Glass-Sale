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
    		<th align="right" colspan="1">
   				نام کاربری:
    		</th>
    		<td colspan="3">
   				<bean:write property="userName" name="userENT" ></bean:write> 
			</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
   				نام:
    		</th>
    		<td>
   				<bean:write property="realUserENT.name" name="userENT" ></bean:write>
    		</td>
    		<th valign="top" align="right">
		    	نام خانوادگی:
    		</th>
    		<td>
    			<bean:write property="realUserENT.familyName" name="userENT" ></bean:write>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
		    	شماره تلفن :
    		</th>
    		<td>
    			<bean:write property="realUserENT.tel" name="userENT" ></bean:write>
    		</td>
   			<th valign="top" align="right">
		    	شماره فکس:
    		</th>
    		<td>
    			<bean:write property="realUserENT.faxNo" name="userENT" ></bean:write>
    		</td>
    	</tr> 
    	<tr>
   			<th valign="top" align="right">
		    	آدرس پست الکترونیکی:
    		</th>
    		<td>
    			<bean:write property="realUserENT.emailAddress" name="userENT" ></bean:write>
    		</td>
   			<th  valign="top" align="right">
		    	آدرس:
    		</th>
    		<td>
    			<bean:write property="realUserENT.address" name="userENT" ></bean:write>
    		</td>
    	</tr>
 	  </table>
	</form>
  </body>
</html>
