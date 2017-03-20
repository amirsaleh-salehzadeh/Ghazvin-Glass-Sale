 <%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
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
		function saveFormSubmit(){
			if($("#confirmation").attr("checked")!==true){
				alert("مشتری گرامی لطفا صحت اطلاعات سفارش را تایید کنید");
				return false;
			}else{
				<%if("confirmNew".equalsIgnoreCase(request.getParameter("reqCode"))){%>
					$("#reqCode").val("saveNew");
				<%}%>
				$('#orderInsertForm').submit();
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
   	<form action="t_order.do" id="orderInsertForm" method="post" onsubmit="return saveFormSubmit();">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table align="center" class="formTable">
    	<tr>
    		<th valign="top" align="center" nowrap="nowrap" colspan="2" class="formHeader">
   				تایید سفارش
    		</th>
    	</tr>
    	<%if("save".equalsIgnoreCase(request.getParameter("reqCode"))||"saveNew".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				<img src="images/buttons/approve.png"></img>شماره ثبت سفارش
    		</th>
    		<td align="right">
    			<bean:write property="orderId" name="orderENT" />
    		</td>
    	</tr>
    	<%} %>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				نام مشتری
    		</th>
    		<td align="right">
    			<html:hidden property="username" name="orderENT" />
    			<bean:write property="username" name="orderENT" />
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				تاریخ - زمان
    		</th>
    		<td>
				<html:hidden  name="orderENT" property="dateTime"/>
				<bean:write property="dateTime" name="orderENT" />
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				هزینه کل
    		</th>
    		<td>
				<html:hidden disabled="true" name="orderENT" property="totalPrice"/>
				<bean:write property="totalPrice" name="orderENT" />
				 ريال
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				وضعیت سفارش
    		</th>
    		<td>
				<html:hidden disabled="true" name="orderENT" property="status"/> 
				<bean:write property="status" name="orderENT" />
    		</td>
    	</tr>
    	<%if("confirmation".equalsIgnoreCase(request.getParameter("reqCode"))||"confirmNew".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
	    <tr>
    		<td colspan="2" valign="top" align="right" nowrap="nowrap" style="background-color: white; ">
    			<table align="center" class="dataList" id="orderList">
			  		<tr>
			  			<th>
			  				ردیف
		  				</th>
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
			  		</tr>
			  		<logic:iterate id="orderDetails" name="orderENT" property="detailENTs" type="ams.ggc.common.order.OrderDetailENT" indexId="rowId">
			  			<tr>
			  				<td>
			  					<%=rowId+1 %>
			  				</td>
			  				<td>
			  					<%=orderDetails.getProductENT().getName() %>
			  					<input type="hidden" name="productId" value="<%=orderDetails.getProductId() %>">
			  					<input type="hidden" name="packingPrice" value="<%=orderDetails.getPackingPrice() %>">
			  					<input type="hidden" name="detailAmount" value="<%=orderDetails.getAmount() %>">
			  				</td>
			  				<td>
			  					<%=orderDetails.getProductENT().getThickness() %>
			  				</td>
			  				<td>
			  					<%=orderDetails.getAmount() %>
			  				</td>
			  				<td>
			  					<%=orderDetails.getPrice() %>
			  				</td>
			  				<td>
			  					<%=orderDetails.getPackingPrice() %>
			  				</td>
			  			</tr>
			  		</logic:iterate>
			  	</table>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" nowrap="nowrap">
   				توضیحات
    		</th>
    		<td>
   				<html:textarea property="context" readonly="true" name="orderENT" cols="52" rows="2" ></html:textarea>
    		</td>
    	</tr>
    	<tr>
    		<th colspan="2">
    			<img src="images/buttons/caution.png"></img>
    			<input type="checkbox" id="confirmation">
    			بدینوسیله صحت اطلاعات سفارش را تضمین می نمایم 
    		</th>
    	</tr>
    	<tr style="cursor: pointer;">
    		<td onclick="saveFormSubmit()">
    			<img src="images/buttons/confirm1.png"></img>ثبت درخواست
    		</td>
    		<%if(!"saveNew".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
	    		<td onclick="orderCancel()" >
	    			<img src="images/buttons/return.png"></img>تصحیح سفارش
	    		</td>
    		<%} %>
    	</tr>
    	<%} %>
 	  </table>
	</form>
  </body>
</html>
