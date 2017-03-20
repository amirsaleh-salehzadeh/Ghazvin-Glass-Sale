<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
 	<link rel="stylesheet" href="css/common.css" type="text/css"></link>
 	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
	  <script type="text/javascript">
		function validateForm(){
			if($("select#floatThickness").val()===""){
				alert("لطفا ضخامت را انتخاب کنید");
				return false;
			}
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
					return false;
				}
			}
			if(!x)
				return false;
		}
		function SelectAll(id)
		{
		    $(id).focus();
		    $(id).select();
		}
		function calculateThis(x){
			$("div#priceDIV").html($(x).attr("id")+"&nbsp;"+"--- به این قیمت 3% مالیات افزوده می گردد");
			$("#price").val($(x).attr("id"));
		}
		function formGen(x){
			$('#formDetail').css('display','table');
			if($(x).attr('id')==="moshajarBi"||$(x).attr('id')==="simpleBi"){
				$('tr#dimensions').css('display','none');
				var string;
				if($(x).attr('id')==="simpleBi")
					string = '<option></option><option value="4" onclick="calculateThis(this)" id="26600">4</option>';
				else
					string = '<option></option><option value="4" onclick="calculateThis(this)" id="18500">4</option>';
				$('#floatThickness').html(string);
			}else if ($(x).attr('id')==="float"){
				$('tr#dimensions').css('display','table-row');
				$('#floatThickness').html('<option></option><option value="2" onclick="calculateThis(this)" id="28700">2</option>'+
					'<option value="3" id="26850" onclick="calculateThis(this)">3</option>'+
					'<option value="4" onclick="calculateThis(this)" id="34500">4</option>'+
					'<option value="4" onclick="calculateThis(this)" id="42650">5</option>'+
					'<option value="6" onclick="calculateThis(this)" id="52000">6</option>'+
					'<option value="8" onclick="calculateThis(this)" id="72500">8</option>'+
					'<option value="10" onclick="calculateThis(this)" id="87000">10</option>'+
					'<option value="12" onclick="calculateThis(this)" id="98510">12</option>');
			}else if ($(x).attr('id')==="simpleBronze"){
				$('#floatThickness').html('<option></option><option value="4" onclick="calculateThis(this)" id="33000">4</option>'+
					'<option value="5" onclick="calculateThis(this)" id="41000">5</option>'+
					'<option value="6" onclick="calculateThis(this)" id="50000">6</option>');
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
		        return false;
	        }
		}
		function calcPacking(x){
			if($("select#floatThickness").val()===""){
				alert("لطفا ضخامت را انتخاب کنید");
				return false;
			}
			var value = $("input[name=amount]").val(); 	
			value = value.replace(/[0-9]*/g, "");
			if (value!='' || $("input[name=amount]").val()==""){
				alert("لطفا برای گزینه "+$("input[name=amount]").attr('id')+" از اعداد استفاده کنید");
				return false;
			}
			if($(x).val()==="true"){
				$("div#packingPriceDIV").html(parseInt($('#floatThickness').val()) * 1500 * parseInt($("input[name=amount]").val()));
			}else{
				$("div#packingPriceDIV").html("0");
			}
		}
		
	  </script>
  </head>
  	<bean:define id="error" name="error" type="java.lang.String"></bean:define>
	<bean:define id="success" name="success" type="java.lang.String"></bean:define>
  <body>
  <ams:message errorMessage="<%=error %>" successMessage="<%=success %>" ></ams:message>
   	<form action="t_order.do" id="orderInsertForm" onsubmit="return validateForm()" >
		<input type="hidden" name="reqCode" id="reqCode" value="confirmation">
		<input type="hidden" name="price" id="price">
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
					<select name="product" >
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
					<select name="thickness" id="floatThickness" >
					</select>
						میلی متر
	    		</td>
	    	</tr>
	    	<tr id="priceRow">
	    		<td valign="top" align="right" nowrap="nowrap">
	   				قیمت متر مربع - ریال
	    		</td>
	    		<td nowrap="nowrap" dir="rtl">
					<div id="priceDIV"></div>
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
	    			<input type="hidden" name="userName" value="<%=request.getRemoteUser() %>" />
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
	    			<html:radio property="packing" name="orderENT" value="false" onclick="calcPacking(this)"></html:radio>
	    			با جعبه باشد
	    			<html:radio property="packing" name="orderENT" value="true" onclick="calcPacking(this)"></html:radio>
	    		</td>
	    	</tr>
	    	<tr id="packingRow">
	    		<td valign="top" align="right" nowrap="nowrap">
			    	هزینه بسته بندی
	    		</td>
	    		<td>
					<div id="packingPriceDIV">0</div> ريال
	    		</td>
	    	</tr>
	    	<tr>
		  		<td align="center" colspan="2">
		  			<logic:equal value="0" name="orderENT" property="orderId">
						<input type="submit" value="ثبت درخواست" style="cursor: pointer;">
		  			</logic:equal>
		  		</td>
	 		</tr>
	  	</table>
	</form>
  </body>
</html>
