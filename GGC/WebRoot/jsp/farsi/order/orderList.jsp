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
<!--	<script type="text/javascript" src="jquery/jquery.js"></script>-->
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<script type="text/javascript">
 		function showOrder(x){
			var loader = "order.do?reqCode=getOrder&orderId="+$(x).attr('id');
			$("div#printDIV").load(loader,"",function(){
				text = $("div#printDIV").html();
				$("div#printDIV").css("display","none");
				win = window.open("about:blank","","");
				doc = win.document;
			    doc.open('text/html');
			    doc.write('<html><head><title>'+$('#AipPivotMdx_reportName').val()+'<\/title><link href="css/aipPrint.css" rel="stylesheet" type="text/css" />');
			    doc.write('<\/head>');
			    doc.write('<body bgcolor="white">');
				doc.write("<div align=\"center\" dir=\"rtl\" >");
				doc.write("</div>");
			    text = text.replace("</td>","&nbsp;</td>");
			    doc.write('<br/>' + text + '<\/div>');
			    doc.write('<\/body><\/html>');
			   	doc.close();
			   	win.print();
			});
		}
		function deleteOrder(x){
			$("#reqCode").val("delete");
			$("#orderId").val($(x).attr("id"));
			try{
				$('form#listForm').ajaxSubmit(function(data){
					$("div#mainBody").html(data);
				});
			}catch(e){
				alert(e);
			}
		}
 	</script>
  </head>
  <body >
  <div id="printDIV" style="">
  </div>
 	<ams:dialog styleId="dlgViewOrder" loader="" title="" style="simple" screenPosition="center" onOKClick="confirmRoles()" >
   </ams:dialog>
   <logic:notEmpty name="userENT">
   <bean:define id="userENT" name="userENT" type="com.ggc.Classes.UserENT"></bean:define>
   <%
  	if(userENT.getIsConfirmed()){
   %>
  	<bean:define id="totalRows" name="orderLST" property="totalItems" type="java.lang.Integer"></bean:define>
	<bean:define id="currentPage" name="orderLST" property="currentPage" type="java.lang.Integer"></bean:define>
	<bean:define id="pageSize" name="orderLST" property="pageSize" type="java.lang.Integer"></bean:define>
   		<ams:paginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
   			<form action="order.do" method="post" id="listForm">
		    <table align="center" dir="rtl" class="dataList">
		    	<tr>
		    		<th colspan="11">
		    			مدیریت سفارش
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
		    			نام کاربر
		    		</th>
		    		<th align="center" nowrap>
		    			سایز
		    		</th>
		    		<th>
		    			شماره سفارش
		    		</th>
		    		<th align="center" nowrap>
		    			تاریخ / زمان سفارش
		    		</th>
		    		<th align="center" nowrap>
						ضخامت
		    		</th>
		    		<th align="center" nowrap>
						متراژ
		    		</th>
		    		<th align="center" nowrap>
		    			نام محصول
		    		</th>
		    		<th align="center" nowrap">
		    			وضعیت سفارش
		    		</th>
		    		<th align="center" nowrap">
		    			حذف سفارش
		    		</th>
		    		<th align="center" nowrap">
		    			چاپ
		    		</th>
		    	</tr>
				<logic:iterate id="orderList" property="orderENTs" type="com.ggc.Classes.OrderENT" name="orderLST" indexId="rowId">
					<tr class="listData" >
			    		<td width="15" align="center">
			    			<%=(currentPage - 1) * 10 + rowId+1%>
			    		</td>
			    		<td align="center">
			    			<%=(orderList.getUsername()!=null)?orderList.getUsername():"" %>
			    		</td>
			    		<td align="center">
			    			<%=(orderList.getSize()==null)?"شیت":orderList.getSize() %>
			    		</td>
			    		<td align="center"  id="<%=orderList.getOrderId() %>" >
			    			<%=orderList.getOrderId() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getDateTime() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getThickness() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getAmount() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getProduct() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getStatus() %>
			    		</td>
			    		<td align="center"	title="حذف سفارش">
		    				<img id="<%=orderList.getOrderId() %>" onclick="showOrder(this)" style="cursor: pointer;" src="images/buttons/delete.png" style="cursor: pointer;" ></img>
<!--		    				 onclick="deleteOrder(this)"-->
		    			</td>
		    			<td align="center" title="چاپ سفارش">
			    			<img id="<%=orderList.getOrderId() %>" onclick="showOrder(this)" src="images/buttons/print.png" style="cursor: pointer;" ></img>
			    		</td>
			    	</tr>    
		    	</logic:iterate>
		    </table>
		    </form>
    	</ams:paginate>
	<%}%>
   </logic:notEmpty>

  </body>
</html>
