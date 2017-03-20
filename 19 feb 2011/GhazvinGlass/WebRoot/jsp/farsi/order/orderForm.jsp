<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<link href="css/calendar.css" rel="stylesheet" type="text/css"/>
 	<script type="text/javascript" src="js/common/JsFarsiCalendar.js" ></script>
 	<script type="text/javascript"  src="js/order/order.form.js"></script>
 	<script type="text/javascript"  src="tools/dialog/amsdialog.js"></script>
  	<bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
</head>
  <body>
  <ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
  <ams:dialog styleId="dlgNewProduct" loader="" title="" style="simple" screenPosition="center" onOKClick="selectProduct()" >
   	</ams:dialog>
  
  <input type="hidden" disabled="disabled" name="tempproductName" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductId" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductPrice" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductColor" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductThickness" class="temp" >
   	<form action="t_order.do" id="orderInsertForm"  method="post" >
		<input type="hidden" name="reqCode" id="reqCode" value="confirmation">
		<input type="hidden" name="price" id="price">
	 	 <table align="center" class="formTable">
	    	<tr>
	    		<th align="center" colspan="2" class="formHeader">
	   				ثبت سفارش برای مشتری <%= request.getRemoteUser()%>
	    		</th>
	    	</tr>
	    	<tr>
	    		<td valign="baseline" colspan="2" align="center" nowrap="nowrap" style="cursor: pointer;" onclick="showDialogNewProduct()">
  					<span class="userGuide">مرحله 1 - </span>
  					<img src="images/buttons/products.png"></img>
  					انتخاب محصول
  					<br/>
  					<span id="productDetailedName"></span>	
	    		</td>
	    	</tr>
		    <tr>
	    		<th valign="top" align="right" nowrap="nowrap">
	   				متراژ
	    		</th>
	    		<td>
					<html:text property="amount" name="orderENT" value="متراژ" styleId="متراژ" styleClass="integVal" onclick="SelectAll(this)" onkeyup="checkValidity(this)"></html:text>
					 متر مربع
	    		</td>
	    	</tr>
	    	<tr>
	    		<th valign="top" align="right" nowrap="nowrap">
	   				تاریخ
	    		</th>
	    		<td>
	    			<input type="text" name="date" id="orderDate" readonly="readonly">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th valign="top" align="right" nowrap="nowrap">
	   				نحوه تحویل
	    		</th>
	    		<td>
	    			فلّه باشد
	    			<input type="radio" name="packing" value="false">
	    			با جعبه باشد
	    			<input type="radio" name="packing"  value="true">
	    		</td>
	    	</tr>
	    	<tr>
		  		<td align="center" colspan="2" onclick="addToList();" style="text-align: center; cursor: pointer;">
					<span class="userGuide">مرحله 2 - </span>
					<img src="images/buttons/addToIcon.png"></img>به لیست اضافه گردد
		  		</td>
	 		</tr>
	 		<tr>
		  		<td align="center" colspan="2" style="background-color: white">
					<table align="center" class="dataList" id="orderList">
				  		<tr>
				  			<th>
				  				نام محصول
			  				</th>
			  				<th>
				  				ضخامت
			  				</th>
			  				<th>
				  				متراژ
			  				</th>
			  				<th>
				  				هزینه کالا
			  				</th>
			  				<th>
				  				هزینه بسته بندی
			  				</th>
			  				<th>
				  				مالیات
			  				</th>
			  				<th>
			  					حذف سطر
			  				</th>
				  		</tr>
				  	</table>
		  		</td>
	 		</tr>
	 		<tr>
	 			<th valign="top">
	 			توضیحات:
	 			</th>
	 			<td>
	 			 <textarea rows="5" name="description" cols="45"></textarea>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td valign="top" align="center" colspan="2" onclick="orderFormSubmit()" style="cursor:pointer;">
	 				<span class="userGuide">مرحله 3 - </span>
	 				<img src="images/buttons/confirm1.png"></img>تایید سفارش
	 			</td>
	 		</tr>
	  	</table>
	</form>
  </body>
</html>
