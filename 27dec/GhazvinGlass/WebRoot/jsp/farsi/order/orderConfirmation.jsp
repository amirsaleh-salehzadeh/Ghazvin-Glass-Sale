 <%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
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
			if($("#confirmation").attr("checked")!==true){
				alert("مشتری گرامی لطفا صحت اطلاعات سفارش را تایید کنید");
				return false;
			}
		}
		function orderCancel(){
			$("#reqCode").val("orderPage");
			$('#orderInsertForm').attr("onsubmit","");
			$('#orderInsertForm').submit();
		}
	  </script>
  </head>
 	<bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
  <body>
 	<ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
   	<form action="t_order.do" id="orderInsertForm" onsubmit="return saveFormSubmit();">
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
<!--    	<logic:notEmpty name="packingPrice">-->
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				هزینه بسته بندی
    		</td>
    		<td>
				<bean:write name="packingPrice" /> ريال
    		</td>
    	</tr>
<!--    	</logic:notEmpty>-->
    	<logic:notEmpty name="packingPrice">
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				هزینه کالا
    		</td>
    		<td>
				<bean:write name="productPrice" /> ريال
    		</td>
    	</tr>
    	</logic:notEmpty>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				قیمت کل
    		</td>
    		<td>
				<html:text readonly="true" name="orderENT" property="totalPrice"/> ريال
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
    			<input type="hidden" name="userName" value="<%=request.getRemoteUser() %>" />
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
    			<input type="submit" value="ثبت درخواست" style="cursor: pointer;">
    			<input type="button" value="تصحیح سفارش" onclick="orderCancel()" style="cursor: pointer;">
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
   				قیمت کل
    		</td>
    		<td>
				<bean:write name="orderENT" property="totalPrice"/> ريال
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
    			<input type="hidden" name="userName" value="<%=request.getRemoteUser() %>" />
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
 	  <%	} %>
	</form>
  </body>
</html>
