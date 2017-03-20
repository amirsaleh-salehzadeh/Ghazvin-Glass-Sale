<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="ams.ggc.common.tools.NVL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
  	<script type="text/javascript"  src="tools/dialog/amsdialog.js"></script>
  	<script type="text/javascript"  src="js/order/order.edit.js"></script>
  	<script type="text/javascript" src="js/common/JsFarsiCalendar.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
  <bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
</head>
  <body>
  <ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
   <ams:dialog styleId="dlgNewProduct" loader="" title="" style="simple" screenPosition="center" onOKClick="addToList()" >
   	</ams:dialog>
   	 <ams:dialog styleId="dlgUserList" loader="" title="" style="simple" screenPosition="center" onOKClick="addToListAUser()" >
   	</ams:dialog>
   <input type="hidden" disabled="disabled" name="tempproductName" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductId" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductPrice" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductColor" class="temp" >
  <input type="hidden" disabled="disabled" name="tempproductThickness" class="temp" >
   	<form action="t_order.do" id="orderEditForm" method="post">
	<input type="hidden" name="reqCode" id="editReqCode">
	  <table class="formTable" align="center" dir="rtl" class="printTable">
	  	<tr>
	  		<th>
	  			مشخصات مشتری 
	  		</th>
	  	</tr>
	  	<tr>
	  		<td>
	  			<table align="center" class="formTable">
			    	<tr>
			    		<th align="right" colspan="1" nowrap="nowrap">
			   				نام کاربر:
			    		</th>
			    		<td width="100%">
			   				<html:text readonly="true" name="orderENT" property="username" styleId="username" />
			   				<%if("new".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
								<img src="images/buttons/search.png" style="cursor: pointer;" title="جستجوی مشتری" onclick="showDialogSearchUser()"></img>
				  			<%} %>
						</td>
			    	</tr>
			 	  </table>
	  		</td>		
	  	</tr>
	  	<tr>
	  		<td>
	  			<table align="center" class="printTable" width="800" dir="rtl">
				  	<tr>
				  		<th colspan="3">
				  			جزییات سفارش
				  		</th>
				  	</tr>
				  	<tr>
				  		<th valign="top" align="right" nowrap="nowrap">
			  				وضعیت سفارش
			    		</th>
			    		<td colspan="2" width="100%">
							<html:text readonly="true" name="orderENT" property="status"/>
			    		</td>
				  	</tr>
				  	<tr>
				  		<th valign="top" align="right" nowrap="nowrap">
			  				مسئول بررسی
			    		</th>
			    		<td colspan="2" width="100%">
							<html:text readonly="true" name="orderENT" property="operator"/>
			    		</td>
				  	</tr>
				  	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				شماره سفارش	
			    		</th>
			    		<td colspan="2">
							<html:text readonly="true" name="orderENT" property="orderId"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				مبلغ سفارش	
			    		</th>
			    		<td colspan="2">
							<html:text readonly="true" name="orderENT" property="totalPrice"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				زمان ثبت	
			    		</th>
			    		<td colspan="2" >
							<html:text styleId="orderDate" readonly="true"  name="orderENT" property="dateTime"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td valign="baseline" colspan="3" align="center" nowrap="nowrap" style="cursor: pointer;" onclick="showDialogNewProduct()">
			 					<img src="images/buttons/addToIcon.png"></img>
			 					اضافه کردن محصول به لیست
			 					<br/>
			 					<span id="productDetailedName"></span>	
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="3" >
			    			<table width="100%" id="orderList" class="dataList">
			    				<tr>
<!--			    					<th>-->
<!--			    						ردیف-->
<!--			    					</th>-->
			    					<th>
			    						نام کالا
			    					</th>
			    					<th>
			    						کد کالا
			    					</th>
			    					<th>
			    						رنگ
			    					</th>
			    					<th>
			    						قیمت
			    					</th>
			    					<th>
			    						ضخامت
			    					</th>
			    					<th>
			    						متراژ
			    					</th>
			    					<th>
			    						مبلغ
			    					</th>
			    					<th>
			    						بسته بندی
			    					</th>
			    					<th>
			    						حذف سطر
			    					</th>
			    				</tr>
			    			<logic:iterate id="orderDetails" name="orderENT" property="detailENTs" indexId="rowId" type="ams.ggc.common.order.OrderDetailENT">
			    				<tr>
<!--			    					<td>-->
<!--										<%=rowId+1 %>    					-->
<!--			    					</td>-->
			    					<td>
										<%=orderDetails.getProductENT().getName() %>    					
			    					</td>
			    					<td>
			    						<html:hidden name="orderDetails" styleClass="detailProductId" property="productENT.productId"/>
<!--			    						<img onclick="showDialogNewProduct()" style="cursor: pointer;" title="انتخاب محصول" src="images/buttons/search.png">-->
			    						<%=orderDetails.getProductENT().getProductId() %>
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getColor() %>    					
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getPrice() %>    					
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getThickness() %>    					
			    					</td>
			    					<td>
										<html:text name="orderDetails" property="amount" styleClass="detailAmount"/>    					
			    					</td>
			    					<td>
										<%=orderDetails.getPrice() %>    					
			    					</td>
			    					<td>
			    						<input type="checkbox" disabled="disabled" name="packing" value="222" 
										<%if(NVL.getLng(orderDetails.getPackingPrice())>0)
											out.print("checked='checked'");		
										 %> />  
										 <html:hidden name="orderDetails" property="packingPrice" />
			    					</td>
			    					<td align="center">
			    						<img src='images/buttons/removeIcon.png' title="حذف سطر" style='cursor: pointer;' onclick='delRow(this)'></img>
			    					</td>
			    				</tr>
			    			</logic:iterate>
			    			</table>
			    		</td>
			    	</tr>
			    	<tr>
			    	<%if("new".equalsIgnoreCase(request.getParameter("reqCode"))){ %>
			    		<td style="cursor: pointer;" title=" سفارش جدید" onclick="saveNewOrder()" nowrap="nowrap">
			    			<img src="images/buttons/confirm1.png" ></img>
			    			ثبت سفارش
			    		</td>
		    		<%}else{ %>
		    			<td style="cursor: pointer;" title="ویرایش سفارش" onclick="saveEdit()">
			    			<img src="images/buttons/edit48.png" ></img>ویرایش
			    		</td>
		    		<%} %>
			    		<td style="cursor: pointer;" title="بازگشت به مدیریت سفارش" onclick="window.location.replace('t_order.do?reqCode=list')">
			    			<img src="images/buttons/return.png" ></img>بازگشت
			    		</td>
			    		<td width="100%">&nbsp;
			    		</td>
			    	</tr>
			 	  </table>
	  		</td>
	  	</tr>
	  </table>
	</form>

  </body>
</html>
