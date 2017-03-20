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
  	<script type="text/javascript"  src="tools/dialog/amsdialog.js"></script>
  	<script type="text/javascript"  src="js/order/order.edit.js"></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
  </head>
  <body>
  <ams:dialog styleId="dlgNewProduct" loader="" title="" style="simple" screenPosition="center" onOKClick="selectProduct()" >
   	</ams:dialog>
   <bean:define id="userENT" name="userENT" type="ams.ggc.common.User.UserENT"></bean:define>
   	<form action="order.do" id="orderInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
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
			   				<html:text readonly="true" name="orderENT" property="username" />
						</td>
			    	</tr>
			 	  </table>
	  		</td>		
	  	</tr>
	  	<tr>
	  		<td>
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
							<html:text readonly="true" name="orderENT" property="status"/>
			    		</td>
				  	</tr>
				  	<tr>
				  		<th valign="top" align="right" nowrap="nowrap">
			  				مسئول بررسی
			    		</th>
			    		<td width="100%">
							<html:text readonly="true" name="orderENT" property="operator"/>
			    		</td>
				  	</tr>
				  	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				شماره سفارش	
			    		</th>
			    		<td>
							<html:text readonly="true" name="orderENT" property="orderId"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				مبلغ سفارش	
			    		</th>
			    		<td>
							<html:text readonly="true" name="orderENT" property="totalPrice"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<th valign="top" align="right" nowrap="nowrap">
			  				زمان ثبت	
			    		</th>
			    		<td>
							<html:text readonly="true" name="orderENT" property="dateTime"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td colspan="2" >
			    			<table width="100%">
			    				<tr>
			    					<th>
			    						ردیف
			    					</th>
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
			    				</tr>
			    			
			    			<logic:iterate id="orderDetails" name="orderENT" property="detailENTs" indexId="rowId" type="ams.ggc.common.order.OrderDetailENT">
			    				<tr>
			    					<td>
										<%=rowId+1 %>    					
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getName() %>    					
			    					</td>
			    					<td>
			    						<html:text readonly="true" size="8" name="orderDetails" property="productENT.productId"/><img onclick="showDialogNewProduct()" style="cursor: pointer;" title="انتخاب محصول" src="images/buttons/search.png">
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getColor() %>    					
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getThickness() %>    					
			    					</td>
			    					<td>
										<html:text name="orderDetails" property="amount"/>    					
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
			 	  </table>
	  		</td>
	  	</tr>
	  </table>
	</form>

  </body>
</html>
