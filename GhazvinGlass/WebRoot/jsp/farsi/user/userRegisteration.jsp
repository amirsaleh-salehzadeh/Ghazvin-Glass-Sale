<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
		$(document).ready(function(){
			$(".typeCombo").each(function(){
				if($(this).attr("checked")==true){
					if($(this).val()==="real"){
						$("table#realTable").css("visibility","visible");
						$("table#legalTable").css("visibility","collapse");
					}else if($(this).val()==="legal"){
						$("table#legalTable").css("visibility","visible");
						$("table#realTable").css("visibility","collapse");
					}
				}
			});
		});
		function changeUserType(x){
			if($(x).val()==="real"){
				$("table#realTable").css("visibility","visible");
				$("table#legalTable").css("visibility","collapse");
			}else{
				$("table#legalTable").css("visibility","visible");
				$("table#realTable").css("visibility","collapse");
			}
		}
		function validateForm(){
			if($("input[name='type']:checked").val() === 'legal'){
				var value = $("#econNo").val(); 	
				value = value.replace(/[0-9]*/g, "");
				if (value!='' || $("#econNo").val()=="" || $("#econNo").val().length !== 12){
					$("#econNo").parent().parent().css('color','red');
					alert("لطفا کد اقتصادی 12 رقمی خود را صحیح وارد کنید")
					return false;
				}
				if($("#pass").val()===""||$("#pass").val()!==$("#repass").val()){
					$("#pass").parent().parent().css('color','red');
					alert("لطفا رمز را صحیح وارد کنید")
					return false;
				}
				if($("#companyName").val()===""){
					$("#companyName").parent().parent().css('color','red');
					alert("لطفا نام سازمان را صحیح وارد کنید")
					return false;
				}
				if($("#legalemail").val().indexOf('@') === -1 ||  $("#legalemail").val().indexOf('.') === -1){
					$("#legalemail").parent().parent().css('color','red');
					alert("لطفا پست الکترونیکی را صحیح وارد کنید")
					return false;
				}
			}else{
				if($("#userName").val()===""){
					$("#userName").parent().parent().css('color','red');
					alert("لطفا نام کاربری را صحیح وارد کنید")
					return false;
				}
				if($("#pass").val()===""||$("#pass").val()!==$("#repass").val()){
					$("#pass").parent().parent().css('color','red');
					alert("لطفا رمز را صحیح وارد کنید")
					return false;
				}
				var value = $("#nationalID").val(); 	
				value = value.replace(/[0-9]*/g, "");
				if (value!='' || $("#nationalID").val()=="" || $("#nationalID").val().length !== 10){
					$("#nationalID").parent().parent().css('color','red');
					alert("لطفا کد ملی را صحیح وارد کنید")
					return false;
				}
				if($("#realemail").val().indexOf('@') === -1 ||  $("#realemail").val().indexOf('.') === -1){
					$("#realemail").parent().parent().css('color','red');
					alert("لطفا پست الکترونیکی را صحیح وارد کنید")
					return false;
				}
				if($("#year").val()==="" || $("#month").val()==="" || $("#day").val()===""){
					$("#year").parent().parent().css('color','red');
					alert("لطفا تاریخ تولد را صحیح وارد کنید")
					return false;
				}
			}
		}
		function saveFormSubmit(){
			$('#reqCode').val("save");	
			$('#userInsertForm').submit();
		}
		function checkValidty(){
		$('#userInsertForm').attr("action","register.do");
			if($("#userName").val()===""){
				$("#userName").parent().parent().css('color','red');
				alert("لطفا نام کاربری را صحیح وارد کنید")
			}else{
				$('#reqCode').val("checkValidity");
				try{
					$('#userInsertForm').ajaxSubmit(function(data){
						$("div#mainBody").html(data);
					});
				}catch(e){
					alert(e);
				}
			}
		}	
		function SelectAll(id)
		{
		    $(id).focus();
		    $(id).select();
		}
	  </script>
  </head>
  <body>
  <div id="mainBody">
	<form action="t_register.do" id="userInsertForm" method="post" onsubmit="return validateForm()">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table align="center" class="formTable">
	  <%if("save".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
	  	<tr>
    		<th align="center" colspan="2" >
   				<span style="color: red;"> خطا در عملیات ثبت</span>
    		</th>
    	</tr>
    	<%} %>
    	<tr>
    		<th align="center" colspan="2">
   				ثبت نام کاربر
    		</th>
    	</tr>
    	<tr>
    		<td align="right">
   				نام کاربری:
    		</td>
    		<td>
   				<html:text property="userName" name="userENT" styleId="userName"></html:text> 
   				<input type="button" value="وضعیت نام کاربری" onclick="checkValidty()">
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
    		<td align="right">
		    	رمز عبور:
    		</td>
    		<td>
    			<html:password property="password" styleId="pass" name="userENT" ></html:password>
    		</td>
    	</tr>
    	<tr>
    		<td align="right">
		    	تکرار رمز عبور:
    		</td>
    		<td>
    			<input type="password" id="repass">
    		</td>
    	</tr>
   		<tr>
    		<td valign="top" align="right">
				کاربر حقیقی<input type="radio" name="type" value="real"
							<%
								if(request.getParameter("type")!=null&&request.getParameter("type").equalsIgnoreCase("real")){
									out.print("checked=\"checked\"");
								} 
							%>
						 	onclick="changeUserType(this)" class="typeCombo">
    		</td>
    		<td>
    			کاربر حقوقی	<input type="radio" name="type" value="legal" 
    						<%
								if(request.getParameter("type")!=null&&request.getParameter("type").equalsIgnoreCase("legal")){
									out.print("checked=\"checked\"");
								} 
							%>
    						onclick="changeUserType(this)" class="typeCombo">
    		</td>
    	</tr>
   		<tr>
    		<td colspan="2" valign="top" align="right">
				<table align="center" id="realTable" style="visibility: collapse;">
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
			   				نام :
			    		</td>
			    		<td>
			   				<html:text property="realUserENT.name" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	نام خانوادگی :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.familyName" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	 کد ملی :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.nationalID" name="userENT" styleId="nationalID"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	ناریخ تولد :
			    		</td>
			    		<td>
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
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	فعالیت :
			    		</td>
			    		<td>
			    			<select name="occupation">
			    				<option value="1">1</option>
			    				<option value="2">2</option>
			    				<option value="3">3</option>
			    				<option value="4">4</option>
			    			</select>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	شماره تلفن :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.tel" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			 	    <tr>
			   			<td colspan="6" valign="top" align="right">
					    	شماره فکس :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.faxNo" name="userENT" ></html:text>
			    		</td>
			    	</tr> 
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس اینترنتی :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.webSiteAddress" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس پست الکترونیکی :
			    		</td>
			    		<td>
			    			<html:text property="realUserENT.emailAddress" styleId="realemail" name="userENT" styleClass="email"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس :
			    		</td>
			    		<td>
			    			<html:textarea property="realUserENT.address" name="userENT" ></html:textarea>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="7">
			    			<input type="submit" value="ثبت نام" style="cursor: pointer;">
			    		</td>
			    	</tr>
				  </table>
			  	  <table align="center" id="legalTable" style="visibility: collapse;">
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
			   				نام سازمان :
			    		</td>
			    		<td>
			   				<html:text property="companyUserENT.companyName" name="userENT" styleId="companyName"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	کد اقتصادی :
			    		</td>
			    		<td>
			    			<html:text property="companyUserENT.economicNumber" name="userENT" styleId="econNo"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="6" valign="top" align="right">
					    	شماره تماس :
			    		</td>
			    		<td>
			    			<html:text property="companyUserENT.tel" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			 	    <tr>
			   			<td colspan="6" valign="top" align="right">
					    	شماره فکس :
			    		</td>
			    		<td>
			    			<html:text property="companyUserENT.faxNo" name="userENT" ></html:text>
			    		</td>
			    	</tr> 
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس اینترنتی :
			    		</td>
			    		<td>
			    			<html:text property="companyUserENT.webSiteAddress" name="userENT" ></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس پست الکترونیکی :
			    		</td>
			    		<td>
			    			<html:text property="companyUserENT.emailAddress" name="userENT" styleClass="email" styleId="legalemail"></html:text>
			    		</td>
			    	</tr>
			    	<tr>
			   			<td colspan="6" valign="top" align="right">
					    	آدرس :
			    		</td>
			    		<td><html:textarea property="companyUserENT.address" name="userENT" ></html:textarea>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="7">
			    			<input type="submit" value="ثبت نام" style="cursor: pointer;">
			    		</td>
			    	</tr>
			  	</table>
    		</td>
    	</tr>
 	  </table>
	</form>
	</div>
  </body>
</html>
