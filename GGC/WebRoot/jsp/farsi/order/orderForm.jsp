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
		function saveFormSubmit(){
			var x = true;
			if($("tr#dimensions").css('display')!=="none"){
				$(".integVal").each(function(){
					var value = $(this).val(); 	
					value = value.replace(/[0-9]*/g, "");
					if($(this).attr("size") === 4 && $(this).val().length > 4){
						alert("لطفا برای گزینه "+$(this).attr('id')+" بیش از 4 رقم استفاده نکنید");
						x = false;
					}
					if (value!='' || $(this).val()==""){
						alert("لطفا برای گزینه "+$(this).attr('id')+" از اعداد استفاده کنید");
						x = false;
					}
				});
			}else{
				var value = $("input[name=amount]").val(); 	
				value = value.replace(/[0-9]*/g, "");
				if (value!='' || $("input[name=amount]").val()==""){
					alert("لطفا برای گزینه "+$("input[name=amount]").attr('id')+" از اعداد استفاده کنید");
					x = false;
				}
			}
			if(x){
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
		}
		function SelectAll(id)
		{
		    $(id).focus();
		    $(id).select();
		}
		function formGen(x){
			$('#formDetail').css('display','table');
			if($(x).attr('id')==="moshajarBi"||$(x).attr('id')==="simpleBi"){
				$('tr#dimensions').css('display','none');
				$('#floatThickness').html('<option value="4">4</option>');
			}else if ($(x).attr('id')==="float"){
				$('tr#dimensions').css('display','table-row');
				$('#floatThickness').html('<option value="2">2</option>'+
					'<option value="3">3</option>'+
					'<option value="4">4</option>'+
					'<option value="6">6</option>'+
					'<option value="8">8</option>'+
					'<option value="10">10</option>'+
					'<option value="12">12</option>');
			}else if ($(x).attr('id')==="simpleBronze"){
				$('#floatThickness').html('<option value="4">4</option>'+
					'<option value="5">5</option>'+
					'<option value="6">6</option>');
				$('tr#dimensions').css('display','none');
				
			}
		}
		function checkValidity(x){
	        var value=$(x).val();
	        var orignalValue=value;
	        var val=value.replace(/[0-9]*/g, "");
	       	var msg="لطفا از اعداد استفاده کنید"; 
	        if (val!=''){
		        orignalValue=orignalValue.replace(/([^0-9].*)/g, "")
		        $(x).val(orignalValue);
		        alert(msg);
	        }

		}
		
	  </script>
  </head>
  <body>
  
   <logic:notEmpty name="userENT">
   <bean:define id="userENT" name="userENT" type="com.ggc.Classes.UserENT"></bean:define>
   <%
  	if(userENT.getIsConfirmed()){
   %>
   	<form action="order.do" id="orderInsertForm" method="post">
	<input type="hidden" name="reqCode" id="reqCode" value="confirmation">
	<logic:equal value="0" name="orderENT" property="orderId">
	  <table align="center" class="formTable">
    	<tr>
    		<th align="center" colspan="2">
   				ثبت سفارش
    		</th>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
  					انتخاب محصول	
    		</td>
    		<td>
				<select name="product">
					<option></option>
					<option value="فلوت بی رنگ" id="float" onclick="formGen(this)">
						فلوت بی رنگ	
					</option>
					<option value="شبت مشجر بی رنگ" id="moshajarBi" onclick="formGen(this)">
						شبت مشجر بی رنگ
					</option>
					<option value="شبت ساده بی رنگ" id="simpleBi" onclick="formGen(this)">
						شبت ساده بی رنگ
					</option>
					<option value="شبت ساده برنز" id="simpleBronze" onclick="formGen(this)">
						شبت ساده برنز
					</option>
				</select>
    		</td>
    	</tr>
    	</table>
    	</logic:equal>
    	<table align="center" class="formTable" id="formDetail" style="display: none; ">
    	<tr id="dimensions">
    		<td valign="top" align="right" nowrap="nowrap">
   				ابعاد
    		</td>
    		<td>
				<input type="text" name="width" id="عرض" value="عرض" class="integVal"  size="4" onclick="SelectAll(this)" onkeyup="checkValidity(this)">*
				<input type="text" name="height" id="طول" value="طول" class="integVal" size="4" onclick="SelectAll(this)" onkeyup="checkValidity(this)">
				<select name="unit">
					<option value="میلی متر">
						میلی متر
					</option>
					<option value="سانتی متر">
						سانتی متر
					</option>
				</select>
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				ضخامت
    		</td>
    		<td>
				<select name="thickness" id="floatThickness">
				</select>
					میلی متر
    		</td>
    	</tr>
	    <tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				متراژ
    		</td>
    		<td>
				<html:text property="amount" name="orderENT" value="متراژ" styleId="متراژ" styleClass="integVal" onclick="SelectAll(this)" onkeyup="checkValidity(this)"></html:text>
				 متر مربع
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				توضیحات:
    		</td>
    		<td>
    			<html:hidden property="userName" name="userENT" ></html:hidden> 
   				<html:textarea property="context" value="در صورت نیاز کامل گردد." name="orderENT" cols="52" rows="2" onclick="SelectAll(this)">
   				</html:textarea>
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" align="right" nowrap="nowrap">
   				نحوه تحویل
    		</td>
    		<td>
    			فلّه باشد
    			<html:radio property="packing" name="orderENT" value="false" ></html:radio>
    			با جعبه باشد
    			<html:radio property="packing" name="orderENT" value="true"></html:radio>
    		</td>
    	</tr>
    	<tr>
	  		<td align="center" colspan="2">
	  			<logic:equal value="0" name="orderENT" property="orderId">
					<input type="button" value="ثبت درخواست" onclick="saveFormSubmit()">
	  			</logic:equal>
	  		</td>
 		</tr>
  	</table>
	</form>
	<%}%>
   </logic:notEmpty>

  </body>
</html>
