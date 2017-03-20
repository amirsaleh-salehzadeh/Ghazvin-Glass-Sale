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
  </head>
  <body>
	<form action="product.do" id="newProductForm" method="post" >
	<input type="hidden" name="reqCode" id="reqCode" value="save">
	  <table align="center" class="formTable">
    	<tr>
    		<th valign="top" align="center" colspan="2">
				ایجاد محصول جدید
    		</th>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
   				نام محصول:
    		</th>
    		<td>
   				<html:text property="name" name="productENT" ></html:text>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right" >
		    	ضخامت:
    		</th>
    		<td>
    			<html:text property="thickness" styleId="thickness" name="productENT" ></html:text>میلی متر
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
		    	مبلغ:
    		</th>
    		<td>
    			<html:text styleId="price" property="price" name="productENT" ></html:text>ريال
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
		    	رنگ:
    		</th>
    		<td>
    			<html:text property="color" name="productENT" ></html:text>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
		    	توضیحات :
    		</th>
    		<td>
    			<html:text property="description" style="description" value="----" name="productENT" ></html:text>
    		</td>
    	</tr>
    	<tr>
    		<th valign="top" align="right">
		    	نمایش در لیست فروش :
    		</th>
    		<td>
    			<html:checkbox property="visibility" name="productENT" ></html:checkbox>
    		</td>
    	</tr>
 	  </table>
	</form>
  </body>
</html>
