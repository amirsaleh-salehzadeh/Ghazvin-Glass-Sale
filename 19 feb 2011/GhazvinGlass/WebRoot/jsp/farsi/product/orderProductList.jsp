<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
 		$(document).ready(function(){
 			$("input[name=productId]").click(function(){
 			});
 		});
 	</script>
 	<style type="text/css">
 		table#orderProductList {
			border-width: 0px;
			border-collapse: separate;
			border-spacing: 0px;
			border-color: black;
			padding: 0px;
		}
		#orderProductList th{
			background-color: #2a7098;
			height: 35px;
			color: white;
			font-weight: bold;
			font-size: 18px;
			-moz-border-radius: 6px 6px 0px 0px;
		}
		#orderProductList td{
			background-color: #e6f1ee;
			color: black;
			font-size: 17px;
			border-width: 2px;
			padding: 1px;
			border-style: solid;
			border-color: #71a0ba;
			border-left: none;
			border-top: none;
			border-right-color: #b7d6e7;
			-moz-border-radius: 0px 0px 4px 0px;
		}
 	</style>
  </head>
  <body >
		    <table align="center" dir="rtl" id="orderProductList"  width="100%">
		    	<tr>
		    		<th>
		    		</th>
<!--		    		<th align="center">-->
<!--		    			ردیف-->
<!--		    		</th>-->
		    		<th align="center" nowrap>
		    			نام محصول
		    		</th>
		    		<th align="center" nowrap>
		    			رنگ
		    		</th>
		    		<th align="center" nowrap>
		    			مبلغ کالا - ريال
		    		</th>
		    		<th align="center" nowrap>
						ضخامت - میلی متر
		    		</th>
		    		<th align="center" nowrap>
						توضیحات
		    		</th>
		    	</tr>
				<logic:iterate id="productList" property="productENTs" type="ams.ggc.common.product.ProductENT" name="productLST" indexId="rowId">
					<logic:notEqual property="visibility" name="productList" value="false">
					<tr class="listData" >
						<td>
							<input type="radio" name="productId" id="radioProductId" value="<%= productList.getProductId() %>" >
						</td>
<!--			    		<td width="15" align="center">-->
<!--			    			<%= rowId+1  %>-->
<!--			    		</td>-->
			    		<td align="center">
			    			<input type="hidden" disabled="disabled" id="productName" class="<%= productList.getProductId() %>" value="<%= productList.getName() %>" >
			    			<%=(productList.getName()!=null)?productList.getName():"" %>
			    		</td>
			    		<td align="center">
			    			<input type="hidden" disabled="disabled" id="productColor" class="<%= productList.getProductId() %>" value="<%= productList.getColor() %>" >
			    			<%=(productList.getColor()!=null)?productList.getColor():"" %>
			    		</td>
			    		<td align="center">
			    			<input type="hidden" disabled="disabled" id="productPrice" class="<%= productList.getProductId() %>" value="<%= productList.getPrice() %>" >
			    			<% 
								String a = "";
								String b = "";
								a = productList.getPrice()+"";
								for (int i = 0 ; i < a.length() ;i++){
									if(i%3 == 0 && i!=0)
										b = b +','+ a.charAt(i);
									else
										b = b + a.charAt(i);
								}
								out.print(b.substring(0,b.length()	));			    			
			    			%>
			    		</td>
			    		<td align="center">
			    			<input type="hidden" disabled="disabled" id="productThickness" class="<%= productList.getProductId() %>" value="<%= productList.getThickness() %>" >
			    			<%=productList.getThickness() %>
			    		</td>
			    		<td align="center">
			    			<%=(productList.getDescription()!=null)?productList.getDescription():"" %>
			    		</td>
			    	</tr>
			    	</logic:notEqual>
		    	</logic:iterate>
		    </table>
  </body>
</html>
