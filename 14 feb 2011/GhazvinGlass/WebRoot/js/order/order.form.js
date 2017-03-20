function orderFormSubmit(){
	try{
		if($('#orderList >tbody >tr').length > 1 ){
			$("form#orderInsertForm").submit();
		}else{
			alert("لیست سفارش تکمیل نگردیده")
		}
	}catch(e){
		alert(e);
	}
}
function showDialogNewProduct(){
	var loader = "product.do?reqCode=orderList";
	showDialog('dlgNewProduct','center',loader);
}
function selectProduct(){
	var  id = $("input[name=productId]:checked").val();
	$("input[name=tempproductId]").val(id);
	$("."+id).each(function(){
		var name = $(this).attr("id");
		$("input[name=temp"+name+"]").val($(this).val());
	});
	var product = $("input[name=tempproductName]").val()+" "+$("input[name=tempproductColor]").val()+" به ضخامت "+$("input[name=tempproductThickness]").val()+" میلی متر ";
	$("span#productDetailedName").html(product);
}
//function calculateThis(x){
//	$("div#priceDIV").html($(x).attr("id")+"&nbsp;"+"--- به این قیمت 3% مالیات افزوده می گردد");
//	$("#price").val($(x).attr("id"));
//}
//function formGen(x){
//	$('#formDetail').css('display','table');
//	if($(x).attr('id')==="moshajarBi"||$(x).attr('id')==="simpleBi"){
//		$('tr#dimensions').css('display','none');
//		var string;
//		if($(x).attr('id')==="simpleBi")
//			string = '<option></option><option value="4" onclick="calculateThis(this)" id="26600">4</option>';
//		else
//			string = '<option></option><option value="4" onclick="calculateThis(this)" id="18500">4</option>';
//		$('#floatThickness').html(string);
//	}else if ($(x).attr('id')==="float"){
//		$('tr#dimensions').css('display','table-row');
//		$('#floatThickness').html('<option></option><option value="2" onclick="calculateThis(this)" id="28700">2</option>'+
//			'<option value="3" id="26850" onclick="calculateThis(this)">3</option>'+
//			'<option value="4" onclick="calculateThis(this)" id="34500">4</option>'+
//			'<option value="4" onclick="calculateThis(this)" id="42650">5</option>'+
//			'<option value="6" onclick="calculateThis(this)" id="52000">6</option>'+
//			'<option value="8" onclick="calculateThis(this)" id="72500">8</option>'+
//			'<option value="10" onclick="calculateThis(this)" id="87000">10</option>'+
//			'<option value="12" onclick="calculateThis(this)" id="98510">12</option>');
//	}else if ($(x).attr('id')==="simpleBronze"){
//		$('#floatThickness').html('<option></option><option value="4" onclick="calculateThis(this)" id="33000">4</option>'+
//			'<option value="5" onclick="calculateThis(this)" id="41000">5</option>'+
//			'<option value="6" onclick="calculateThis(this)" id="50000">6</option>');
//		$('tr#dimensions').css('display','none');
//	}
//}
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
function addToList(){
	if($("input[name=tempproductName]").val()===""){
		alert("لطفا محصول را انتخاب کنید");
		return false;
	}
	var today = getTodayPersian();
	$("#orderDate").val(today[0] + "/" + today[1] + "/" + today[2]);
	var value=$("input[name=amount]").val();
    var orignalValue=value;
    var val=value.replace(/[0-9]*/g, "");
   	var msg="لطفا متراژ را انتخاب کنید"; 
    if (val!=''){
        orignalValue=orignalValue.replace(/([^0-9].*)/g, "")
        $("input[name=amount]").val(orignalValue);
        alert(msg);
        return false;
    }
	var product = $("input[name=tempproductName]").val();
	var thickness = $("input[name=tempproductThickness]").val();
	var amount = $("input[name=amount]").val();
	var productPrice = parseInt($("input[name=tempproductPrice]").val()) * parseInt($("input[name=amount]").val());
	var packingPrice;
	if($("input[name=packing]:checked").val() === "true")
		packingPrice = parseInt($("input[name=tempproductThickness]").val()) * 1500 * parseInt($("input[name=amount]").val());
	else
		packingPrice = 0;
	var tax = (parseInt(productPrice) + parseInt(packingPrice))*3/100;
	var img = "<img src='images/buttons/removeIcon.png' style='cursor: pointer;' onclick='delRow(this)'></img>"
	var params = "<input type='hidden' name='productId' value='"+ $("input[name=tempproductId]").val()+"' >"
				+"<input type='hidden' name='detailAmount' value='"+ amount+"' >"
				+"<input type='hidden' name='packingPrice' value='"+ packingPrice+"' >";
	var row = $("<tr><td>"+params+product+"</td><td>"+thickness+"</td><td>"+amount+"</td><td>"+productPrice+"</td><td>"+packingPrice+"</td><td>"+tax+"</td><td align='center'>"+img+"</td></tr>").hide().fadeIn();
	$("#orderList").append(row);
}
function delRow(x){
	$(x).parent().parent().fadeOut();
	$(x).parent().parent().remove();
}