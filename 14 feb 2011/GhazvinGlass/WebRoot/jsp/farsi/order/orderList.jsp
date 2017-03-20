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
		function goToSearch(){
			$("#reqCode").val("list");
			$('form#listForm').ajaxSubmit(function(data){
				$("div#mainBody").html(data);
			});
		}
 	</script>
  <bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
</head>
  <body>
  <ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
  <div id="printDIV" style="">
  </div>
  	<bean:define id="totalRows" name="orderLST" property="totalItems" type="java.lang.Integer"></bean:define>
	<bean:define id="currentPage" name="orderLST" property="currentPage" type="java.lang.Integer"></bean:define>
	<bean:define id="pageSize" name="orderLST" property="pageSize" type="java.lang.Integer"></bean:define>
   		<ams:paginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
   			<form action="order.do" id="listForm">
		    <table align="center" class="formTable">
    			<tr>
					<th >
						جستجو:
					</th>
					<td><html:text property="keyword" name="orderLST"></html:text>
					</td>
					<td onclick="goToSearch();" style="cursor: pointer;">
						<img  src="images/buttons/search.png"></img>
					</td>
				</tr>
    		</table>
		    <table align="center" dir="rtl" class="dataList">
		    	<tr>
		    		<th colspan="12">
		    			مدیریت سفارش
		    		</th>
		    	</tr>
		    	<tr>
		    		<th align="center">
		    			<input type="hidden" name="reqCode" id="reqCode" value="list" >
		    			<input type="hidden" name="orderId" id="orderId" >
		    			ردیف
		    		</th>
		    		<th align="center" nowrap>
		    			مشتری
		    		</th>
		    		<th align="center" nowrap>
		    			مبلغ
		    		</th>
		    		<th>
		    			شماره
		    		</th>
		    		<th align="center" nowrap>
		    			تاریخ / زمان
		    		</th>
		    		<th align="center" nowrap">
		    			وضعیت 
		    		</th>
		    		<th align="center" nowrap">
		    			ویرایش 
		    		</th>
		    		<th align="center" nowrap">
		    			چاپ
		    		</th>
		    		<th align="center" nowrap">
		    			حذف 
		    		</th>
		    	</tr>
				<logic:iterate id="orderList" property="orderENTs" type="ams.ggc.common.order.OrderENT" name="orderLST" indexId="rowId">
					<tr class="listData" >
			    		<td width="15" align="center">
			    			<%=(currentPage - 1) * 10 + rowId+1%>
			    		</td>
			    		<td align="center">
			    			<%=(orderList.getUsername()!=null)?orderList.getUsername():"" %>
			    		</td>
			    		<td align="center">
			    			<% 
								String a = "";
								String b = "";
								a = orderList.getTotalPrice()+"";
								for (int i = 0 ; i < a.length() ;i++){
									if(i%3 == 0 && i!=0)
										b = b +','+ a.charAt(i);
									else
										b = b + a.charAt(i);
								}
								out.print(b.substring(0,b.length()	));			    			
			    			%>
			    		</td>
			    		<td align="center"  id="<%=orderList.getOrderId() %>" >
			    			<%=orderList.getOrderId() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getDateTime() %>
			    		</td>
			    		<td align="center">
			    			<%=orderList.getStatus() %>
			    		</td>
			    		<td align="center"	title="ویرایش  سفارش">
<!--		    				<a href="t_order.do?reqCode=edit&orderId=<%=orderList.getOrderId() %>"><img id="<%=orderList.getOrderId() %>" style="cursor: pointer;" src="images/buttons/edit.png"></img></a>-->
		    			</td>
			    		<td align="center"	title="حذف سفارش">
		    				<a href="t_order.do?reqCode=delete&orderId=<%=orderList.getOrderId() %>"><img id="<%=orderList.getOrderId() %>" style="cursor: pointer;" src="images/buttons/delete.png"></img></a>
		    			</td>
		    			<td align="center" title="چاپ سفارش">
			    			<img id="<%=orderList.getOrderId() %>" onclick="showOrder(this)" src="images/buttons/print.png" style="cursor: pointer;" ></img>
			    		</td>
			    	</tr>    
		    	</logic:iterate>
		    </table>
		    </form>
    	</ams:paginate>
  </body>
</html>
