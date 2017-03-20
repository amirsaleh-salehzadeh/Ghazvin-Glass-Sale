<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="ams.ggc.common.tools.SecurityUtil"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
  	<script type="text/javascript" src="js/product/product.list.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<script type="text/javascript"  src="tools/dialog/amsdialog.js"></script>
  </head>
  <bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
  <body>
 	<ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
 	<ams:dialog styleId="dlgNewProduct" loader="" title="" style="simple" screenPosition="center" onOKClick="saveProduct()" >
   	</ams:dialog>
  	<bean:define id="totalRows" name="productLST" property="totalItems" type="java.lang.Integer"></bean:define>
	<bean:define id="currentPage" name="productLST" property="currentPage" type="java.lang.Integer"></bean:define>
	<bean:define id="pageSize" name="productLST" property="pageSize" type="java.lang.Integer"></bean:define>
   			<form action="product.do" method="post" id="listForm">
		    <table align="center" dir="rtl" class="dataList" width="700">
		    	<tr>
		    		<th colspan="12">
		    			مدیریت کالا
		    		</th>
		    	</tr>
		    	<tr>
		    		<th align="center">
		    			<input type="hidden" name="reqCode" id="reqCode" value="list" >
		    			<input type="hidden" name="language" value="farsi" >
		    			<input type="hidden" name="orderId" id="orderId" >
		    			ردیف
		    		</th>
		    		<th align="center" nowrap>
		    			نمایش
		    		</th>
		    		<th align="center" nowrap>
		    			نام محصول
		    		</th>
		    		<th align="center" nowrap>
		    			مبلغ کالا - ريال
		    		</th>
		    		<th align="center" nowrap>
		    			کد کالا
		    		</th>
		    		<th align="center" nowrap>
						ضخامت - میلی متر
		    		</th>
		    		<th align="center" nowrap>
						توضیحات
		    		</th>
		    		<th align="center" nowrap>
		    			رنگ
		    		</th>
		    		<%SecurityUtil util = new SecurityUtil();
		    				if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator")){
		    			%>
		    		<th align="center" nowrap">
		    			حذف 
		    		</th>
		    		<%} %>
		    	</tr>
				<logic:iterate id="productList" property="productENTs" type="ams.ggc.common.product.ProductENT" name="productLST" indexId="rowId">
					<tr class="listData" >
			    		<td width="15" align="center">
			    			<%=//(currentPage - 1) * 10 + rowId+1
			    				rowId+1
			    			
			    			%>
			    		</td>
			    		<td align="center">
			    			<html:checkbox style="width: 30px; height: 30px;" property="visibility" value="<%=""+productList.getProductId() %>" name="productList"></html:checkbox>
			    		</td>
			    		<td align="center">
			    			<%=(productList.getName()!=null)?productList.getName():"" %>
			    		</td>
			    		<td align="center">
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
			    		<td align="center"  id="<%=productList.getProductId() %>" >
			    			<%=productList.getProductId() %>
			    		</td>
			    		<td align="center">
			    			<%=productList.getThickness() %>
			    		</td>
			    		<td align="center">
			    			<%=(productList.getDescription()!=null)?productList.getDescription():"" %>
			    		</td>
			    		<td align="center">
			    			<%=(productList.getColor()!=null)?productList.getColor():"" %>
			    		</td>
			    		<%
		    				if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator")){
		    			%>
			    		<td align="center"	title="حذف محصول">
		    				<img id="<%=productList.getProductId() %>" onclick="deleteProduct(this)" style="cursor: pointer;" src="images/buttons/delete.png" style="cursor: pointer;" ></img>
		    			</td>
		    			<%} %>
			    	</tr>
		    	</logic:iterate>
		    	<tr>
		    		<td onclick="showDialogNewProduct();" style="cursor:pointer" title="ایجاد محصول جدید">
		    			جدید<img src="images/buttons/new.png" ></img>
		    		</td>
		    		<td onclick="editView();" style="cursor:pointer" title="ویرایش نمایش لیست محصولات">
		    			ویرایش<img src="images/buttons/view.png" ></img>
		    		</td>
		    	</tr> 
		    </table>
		    </form>
  </body>
</html>
