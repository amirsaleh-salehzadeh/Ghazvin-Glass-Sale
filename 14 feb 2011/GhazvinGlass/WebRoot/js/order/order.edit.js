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
