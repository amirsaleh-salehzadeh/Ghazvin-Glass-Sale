<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ggc.business.UserBusinessManager"%>
<%@page import="com.ggc.Classes.UserENT"%>
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
		function saveFormSubmit(){
			if($("#confirmation").attr("checked")===true){
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
			}else{
				alert("مشتری گرامی لطفا صحت اطلاعات سفارش را تایید کنید")
			}
		}
		function orderCancel(){
			$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
			$('div#mainBody').load("order.do?reqCode=orderPage");
		}
		
	  </script>
  </head>
  <body>
  
   <logic:notEmpty name="userENT">
   <bean:define id="userENT" name="userENT" type="com.ggc.Classes.UserENT"></bean:define>
   	<form action="order.do" id="orderInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	<bean:define type="java.lang.Boolean" id="packing" property="packing" name="orderENT" ></bean:define>
	<%if("confirmation".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
	  <table align="center" class="formTable">
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
  				محصول	
    		</td>
    		<td>
				<html:text readonly="true" name="orderENT" property="product"/>
    		</td>
    	</tr>
    	<logic:equal value="فلوت بی رنگ" name="orderENT" property="product">
	    	<tr>
	    		<td valign="top" align="right" nowrap="nowrap">
	   				ابعاد
	    		</td>
	    		<td>
					<html:text readonly="true" name="orderENT" property="size"/>
	    		</td>
	    	</tr>
    	</logic:equal>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				ضخامت
    		</td>
    		<td>
				<html:text readonly="true" name="orderENT" property="thickness"/>
    		</td>
    	</tr>
	    <tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				متراژ
    		</td>
    		<td>
				<html:text readonly="true" name="orderENT" property="amount"/>متر مربع
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				نام مشتری
    		</td>
    		<td align="right">
    			<html:text readonly="true" property="username" name="orderENT" />
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				توضیحات
    		</td>
    		<td>
    			<html:hidden property="userName" name="userENT" ></html:hidden>
    			<html:hidden  property="packing" name="orderENT" ></html:hidden>
   				<html:textarea property="context" readonly="true" name="orderENT" cols="52" rows="2" ></html:textarea>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" align="center">
    			<span style="color: red;">
    			<%	if(packing){
    					out.print("شامل بسته بندی با جعبه می باشد");
    				}else{
    					out.print("تحویل به صورت فلّه");
    				} %>
   				</span>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			بدینوسیله صحت اطلاعات سفارش را تضمین می نمایم <input type="checkbox" id="confirmation">
    		</td>
    		<td>
    			<input type="button" value="ثبت درخواست" onclick="saveFormSubmit()">
    			<input type="button" value="تصحیح سفارش" onclick="orderCancel()">
    		</td>
    	</tr>
 	  </table>
 	  <%}if("save".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
 	  <table align="center" class="formTable">
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
  				محصول	
    		</td>
    		<td>
				<bean:write name="orderENT" property="product"/>
    		</td>
    	</tr>
    	<logic:equal value="فلوت بی رنگ" name="orderENT" property="product">
	    	<tr>
	    		<td valign="top" align="right" nowrap="nowrap">
	   				ابعاد
	    		</td>
	    		<td>
					<bean:write name="orderENT" property="size"/>
	    		</td>
	    	</tr>
    	</logic:equal>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				ضخامت
    		</td>
    		<td>
				<bean:write name="orderENT" property="thickness"/>
    		</td>
    	</tr>
	    <tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				متراژ
    		</td>
    		<td>
				<bean:write name="orderENT" property="amount"/>متر مربع
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				نام کاربر
    		</td>
    		<td align="right">
    			<bean:write property="username" name="orderENT" />
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				توضیحات
    		</td>
    		<td>
    			<html:hidden property="userName" name="userENT" ></html:hidden>
   				<html:textarea property="context" readonly="true" name="orderENT" cols="52" rows="2" ></html:textarea>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<span style="color: red;">
    			<%	if(packing){
    					out.print("شامل بسته بندی با جعبه می باشد");
    				}else{
    					out.print("تحویل به صورت فلّه");
    				} %>
   				</span>
    		</td>
    	</tr>
 	  </table>
		<table class="formTable" align="center">
			<tr>
				<th align="center" colspan="2">
					<logic:notEqual value="0" name="orderENT" property="orderId">
						شماره رسیدگی و ثبت سفارش شما: 
						<span style="color: red;">
							<bean:write name="orderENT" property="orderId"/>
						</span>
					</logic:notEqual>
				</th>
			</tr>
		</table>
 	  <%} %>
	</form>
   </logic:notEmpty>

  </body>
</html>
