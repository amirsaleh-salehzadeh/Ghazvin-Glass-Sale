function showDialogNewProduct(){
	var loader = "product.do?reqCode=orderList";
	showDialog('dlgNewProduct','center',loader);
}
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
function selectProduct(){
	$("#").val($("input[name=productId]:checked").val());
}
function delRow(x){
	if(confirm("آیا مایل به حذف این سطر می باشید؟")){
		$(x).parent().parent().fadeOut();
		$(x).parent().parent().remove();
	}
}
function showDialogNewProduct(){
	var loader = "product.do?reqCode=orderList";
	showDialog('dlgNewProduct','center',loader);
}
function addToList(){
	var  id = $("input[name=productId]:checked").val();
	$("."+id).each(function(){
		var name = $(this).attr("id");
		$("input[name=temp"+name+"]").val($(this).val());
	});
	var productName = $("input[name=tempproductName]").val();
	var color = $("input[name=tempproductColor]").val();
	var thickness = $("input[name=tempproductThickness]").val();
	var today = getTodayPersian();
	$("#orderDate").val(today[0] + "/" + today[1] + "/" + today[2]);
//	var value=$("input[name=amount]").val();
//    var orignalValue=value;
//    var val=value.replace(/[0-9]*/g, "");
//   	var msg="لطفا متراژ را انتخاب کنید"; 
//    if (val!=''){
//        orignalValue=orignalValue.replace(/([^0-9].*)/g, "")
//        $("input[name=amount]").val(orignalValue);
//        alert(msg);
//        return false;
//    }
	var img = "<img src='images/buttons/removeIcon.png' title='حذف سطر' style='cursor: pointer;' onclick='delRow(this)'></img>"
	var packing ="<input type='checkbox' name='packingPrice' class='packingChx' value='222'>";
	var amount ="<input type='text' name='detailAmount'>";
	var params = "<input type='hidden' name='productId' value='"+ id+"' >";
	var row = $("<tr><td>"+params+productName+"</td><td>"+id+"</td><td>"+color+"</td><td>"+$("input[name=tempproductPrice]").val()+"</td><td>"+thickness+"</td><td>"+amount+"</td><td></td><td>"+packing+"</td><td align='center'>"+img+"</td></tr>").hide().fadeIn();
	$("#orderList").append(row);
}
function saveEdit(){
	$(".packingChx").each(function(){
		if($(this).attr("checked")!==true){
			$(this).val("0")
		}
		$(this).attr("checked","checked");
	});
	$("input.detailProductId").each(function(){
		$(this).attr("name","productId");
	});	
	$("input.detailAmount").each(function(){
		$(this).attr("name","detailAmount");
	});
	$("form#orderEditForm").submit();
}