<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!--	<script type="text/javascript" src="jquery/jquery.js"></script>-->
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
	  <script type="text/javascript">
		function saveFormSubmit(){
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
		function SelectAll(id)
		{
		    $(id).focus();
		    $(id).select();
		}
	  </script>
  </head>
  <body>
  
   <bean:define id="userENT" name="userENT" type="ams.ggc.common.User.UserENT"></bean:define>
   	<form action="order.do" id="orderInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table class="printTable" align="center" dir="rtl" class="printTable">
	  	<tr>
	  		<th >
	  			مشخصات مشتری
	  		</th>
	  	</tr>
	  	<tr>
	  		<td>
	  			<table align="center" class="printTable">
			    	<tr>
			    		<th align="right" colspan="1" nowrap="nowrap">
			   				نام کاربری:
			    		</th>
			    		<td width="100%">
			   				<bean:write name="orderENT" property="username" ></bean:write> 
						</td>
			    	</tr>
			    	<%if(request.getParameter("reqCode")!=null&&!request.getParameter("reqCode").equalsIgnoreCase("getOrderPrint")){ %>
			   		<tr>
			    		<td colspan="2" valign="top" align="right">
			    			<logic:notEmpty name="orderENT" property="userENT.realUserENT.name">
								<table align="center" id="realTable" class="printTable">
							    	<tr>
							    		<th valign="top" align="right">
							   				نام:
							    		</th>
							    		<td>
							   				<bean:write property="userENT.realUserENT.name" name="orderENT" ></bean:write>
							    		</td>
							    		<th valign="top" align="right">
									    	نام خانوادگی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.familyName" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							    		<th valign="top" align="right">
									    	کد ملی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.nationalID" name="orderENT" ></bean:write>
							    		</td>
							    		<th valign="top" align="right">
									    	ناریخ تولد :
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.dob" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							    		<th valign="top" align="right">
									    	شماره تلفن :
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.tel" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							 	    <tr>
							   			<th valign="top" align="right">
									    	شماره فکس:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.faxNo" name="orderENT" ></bean:write>
							    		</td>
							    	</tr> 
							    	<tr>
							   			<th valign="top" align="right">
									    	آدرس اینترنتی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.webSiteAddress" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th valign="top" align="right">
									    	آدرس پست الکترونیکی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.emailAddress" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.realUserENT.address" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
								  </table>
							  </logic:notEmpty>
							  <logic:notEmpty name="orderENT" property="userENT.companyUserENT.companyName">
							  	  <table align="center" id="legalTable" class="printTable">
							    	<tr>
							    		<th  valign="top" align="right">
							   				نام سازمان:
							    		</th>
							    		<td>
							   				<bean:write property="userENT.companyUserENT.companyName" name="orderENT" ></bean:write>
							    		</td>
							    		<th  valign="top" align="right">
									    	کد اقتصادی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.companyUserENT.economicNumber" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							    		<th  valign="top" align="right">
									    	شماره تماس :
							    		</th>
							    		<td>
							    			<bean:write property="userENT.companyUserENT.tel" name="orderENT" ></bean:write>
							    		</td>
							   			<th  valign="top" align="right">
									    	شماره فکس:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.companyUserENT.faxNo" name="orderENT" ></bean:write>
							    		</td>
							    	</tr> 
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس اینترنتی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.companyUserENT.webSiteAddress" name="orderENT" ></bean:write>
							    		</td>
							   			<th  valign="top" align="right">
									    	آدرس پست الکترونیکی:
							    		</th>
							    		<td>
							    			<bean:write property="userENT.companyUserENT.emailAddress" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس:
							    		</th>
							    		<td colspan="3">
							    			<bean:write property="userENT.companyUserENT.address" name="orderENT" ></bean:write>
							    		</td>
							    	</tr>
							  	</table>
						  	</logic:notEmpty>
			    		</td>
			    	</tr>
			    	<%} %>
			 	  </table>
	  		</td>		
	  	</tr>
	  </table>
	  <table align="center" class="printTable" width="800" dir="rtl">
	  	<tr>
	  		<th colspan="2">
	  			جزییات سفارش
	  		</th>
	  	</tr>
	  	<tr>
	  		<th valign="top" align="right" nowrap="nowrap">
  				وضعیت سفارش
    		</th>
    		<td width="100%">
				<bean:write name="orderENT" property="status"/>
    		</td>
	  	</tr>
	  	<tr>
	  		<th valign="top" align="right" nowrap="nowrap">
  				مسئول بررسی
    		</th>
    		<td width="100%">
				<bean:write name="orderENT" property="operator"/>
    		</td>
	  	</tr>
	  	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
  				شماره سفارش	
    		</th>
    		<td>
				<bean:write name="orderENT" property="orderId"/>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
  				مبلغ سفارش	
    		</th>
    		<td>
				<bean:write name="orderENT" property="totalPrice"/>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
  				زمان ثبت	
    		</th>
    		<td>
				<bean:write name="orderENT" property="dateTime"/>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
  				محصول	
    		</th>
    		<td>
				<bean:write name="orderENT" property="product"/>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				ابعاد
    		</th>
    		<td>
				<bean:write name="orderENT" property="size"/>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				ضخامت
    		</th>
    		<td>
				<bean:write name="orderENT" property="thickness"/> میلی متر
    		</td>
    	</tr>
	    <tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				متراژ
    		</th>
    		<td>
				<bean:write name="orderENT" property="amount"/> متر مربع
    		</td>
    	</tr>
	    <tr>
    		<th valign="top" align="right" nowrap="nowrap">
    		<bean:define type="java.lang.Boolean" id="packing" property="packing" name="orderENT" ></bean:define>
   				<%	if(packing){
    					out.print("شامل بسته بندی با جعبه می باشد");
    				}else{
    					out.print("تحویل به صورت فلّه");
    				} %>
   			</th>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				توضیحات
    		</th>
    		<td>
   				<bean:write name="orderENT" property="context"/>
    		</td>
    	</tr>
 	  </table>
	</form>

  </body>
</html>
