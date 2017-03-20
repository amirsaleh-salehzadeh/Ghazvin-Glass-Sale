<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  	<script type="text/javascript" src="jquery/ui/ui.core.packed.js"></script>
	<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>  	
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
 	<script type="text/javascript">
		function showDialogOperator(x){
			var loader = "user.do?reqCode=getOperator&id="+$(x).attr('id');
			if($(x).attr("id")!=="null")
				showDialog('dlgViewOperator','center',loader);
		}
		function printOrder(x){
			var loader = "order.do?reqCode=getOrderPrint&orderId="+$(x).attr('id');
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
			$("#reqCode").val("updateDelete");
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
  <body>
    <div id="printDIV" style="">
  </div>
 	<ams:dialog styleId="dlgViewOperator" title="" toolbar="" style="simple" screenPosition="center" >
   </ams:dialog>
  	<bean:define id="totalRows" name="orderLST" property="totalItems" type="java.lang.Integer"></bean:define>
	<bean:define id="currentPage" name="orderLST" property="currentPage" type="java.lang.Integer"></bean:define>
	<bean:define id="pageSize" name="orderLST" property="pageSize" type="java.lang.Integer"></bean:define>
   		<ams:paginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
   			<form action="order.do"  id="listForm">
		    <table align="center" dir="rtl" class="dataList">
		    	<tr>
		    		<th colspan="11">
						سفارش های کاربر <%=request.getRemoteUser() %> 		    		
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
		    			مسئول رسیدگی
		    		</th>
		    		<th align="center" nowrap>
		    			مبلغ سفارش - ريال
		    		</th>
		    		<th>
		    			شماره سفارش
		    		</th>
		    		<th align="center" nowrap>
		    			تاریخ / زمان سفارش
		    		</th>
		    		<th align="center" nowrap>
						ضخامت <br/> میلی متر
		    		</th>
		    		<th align="center" nowrap>
						متراژ <br/> متر مربع
		    		</th>
		    		<th align="center" nowrap>
		    			محصول
		    		</th>
		    		<th align="center" nowrap">
		    			وضعیت
		    		</th>
		    		<th align="center" nowrap">
		    			انصراف
		    		</th>
		    		<th align="center" nowrap">
		    			چاپ
		    		</th>
		    	</tr>
				<logic:iterate id="orderList" property="orderENTs" type="ams.ggc.common.order.OrderENT" name="orderLST" indexId="rowId">
					<tr class="listData" id="<%=orderList.getOrderId() %>" style="cursor: pointer;">
			    		<td width="15" align="center">
			    			<%=(currentPage - 1) * 10 + rowId+1%>
			    		</td>
			    		<td align="center" id="<%=orderList.getOperator() %>" title="نمایش مشخصات مسئول" onclick="showDialogOperator(this)">
			    			<%=(orderList.getOperator()!=null)?orderList.getOperator():"در انتظار بررسی" %>
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
			    		<td align="center">
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
			    		<td align="center"	title="انصراف سفارش">
		    				<img id="<%=orderList.getOrderId() %>" onclick="deleteOrder(this)"  src="images/buttons/delete.png" style="cursor: pointer;" ></img>
		    			</td>
		    			<td align="center"	title="چاپ سفارش">
		    				<img id="<%=orderList.getOrderId() %>" onclick="printOrder(this)"  src="images/buttons/print.png" style="cursor: pointer;" ></img>
		    			</td>
			    	</tr>    
		    	</logic:iterate>
		    </table>
		    </form>
    	</ams:paginate>

  </body>
</html>
