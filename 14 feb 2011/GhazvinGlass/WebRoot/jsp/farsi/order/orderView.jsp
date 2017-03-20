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
	  <title>چاپ سفارش</title>
  </head>
  <body>
  
   <bean:define id="userENT" name="userENT" type="ams.ggc.common.User.UserENT"></bean:define>
   	<form action="order.do" id="orderInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table class="printTable" align="center" dir="rtl" class="printTable">
		<tr>
			<td align="left">
				<img src="images/logoFa.png"></img>
			</td>
		</tr>
	  	<tr>
	  		<th>
	  			مشخصات مشتری
	  		</th>
	  	</tr>
	  	<tr>
	  		<td>
	  			<table align="center" class="printTable">
			    	<tr>
			    		<th align="right" colspan="1" nowrap="nowrap">
			   				نام کاربر:
			    		</th>
			    		<td width="100%">
			   				<bean:write name="orderENT" property="username" ></bean:write> 
						</td>
			    	</tr>
			    	<%if(request.getParameter("reqCode")!=null&&!request.getParameter("reqCode").equalsIgnoreCase("getOrderPrint")){ %>
			   		<tr>
			    		<td colspan="2" valign="top" align="right">
			    			<logic:notEmpty name="userENT" property="realUserENT.name">
								<table align="center" id="realTable" class="printTable">
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
									    	کد ملی:
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.nationalID" name="userENT" ></bean:write>
							    		</td>
							    		<th valign="top" align="right">
									    	تاریخ تولد :
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.dob" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							    		<th valign="top" align="right">
									    	شماره تلفن :
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.tel" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							 	    <tr>
							   			<th valign="top" align="right">
									    	شماره فکس:
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.faxNo" name="userENT" ></bean:write>
							    		</td>
							    	</tr> 
							    	<tr>
							   			<th valign="top" align="right">
									    	آدرس اینترنتی:
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.webSiteAddress" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th valign="top" align="right">
									    	آدرس پست الکترونیکی:
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.emailAddress" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس:
							    		</th>
							    		<td>
							    			<bean:write property="realUserENT.address" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
								  </table>
							  </logic:notEmpty>
							  <logic:notEmpty name="userENT" property="companyUserENT.companyName">
							  	  <table align="center" id="legalTable" class="printTable">
							    	<tr>
							    		<th  valign="top" align="right">
							   				نام سازمان:
							    		</th>
							    		<td>
							   				<bean:write property="companyUserENT.companyName" name="userENT" ></bean:write>
							    		</td>
							    		<th  valign="top" align="right">
									    	کد اقتصادی:
							    		</th>
							    		<td>
							    			<bean:write property="companyUserENT.economicNumber" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							    		<th  valign="top" align="right">
									    	شماره تماس :
							    		</th>
							    		<td>
							    			<bean:write property="companyUserENT.tel" name="userENT" ></bean:write>
							    		</td>
							   			<th  valign="top" align="right">
									    	شماره فکس:
							    		</th>
							    		<td>
							    			<bean:write property="companyUserENT.faxNo" name="userENT" ></bean:write>
							    		</td>
							    	</tr> 
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس اینترنتی:
							    		</th>
							    		<td>
							    			<bean:write property="companyUserENT.webSiteAddress" name="userENT" ></bean:write>
							    		</td>
							   			<th  valign="top" align="right">
									    	آدرس پست الکترونیکی:
							    		</th>
							    		<td>
							    			<bean:write property="companyUserENT.emailAddress" name="userENT" ></bean:write>
							    		</td>
							    	</tr>
							    	<tr>
							   			<th  valign="top" align="right">
									    	آدرس:
							    		</th>
							    		<td colspan="3">
							    			<bean:write property="companyUserENT.address" name="userENT" ></bean:write>
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
										<%=orderDetails.getProductENT().getProductId() %>    					
			    					</td>
			    					<td>
										<%=orderDetails.getProductENT().getColor() %>    					
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
			   				<bean:write name="orderENT" property="context"/>
			    		</td>
			    	</tr>
			 	  </table>
	  		</td>
	  	</tr>
	  </table>
	</form>

  </body>
</html>
