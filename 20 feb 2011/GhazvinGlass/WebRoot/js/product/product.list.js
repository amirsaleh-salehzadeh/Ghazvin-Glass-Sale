function showDialogNewProduct(){
	var loader = "product.do?reqCode=new";
	showDialog('dlgNewProduct','center',loader);
}
function deleteProduct(x){
	if(confirm('آیا مایل به حذف این محصول می باشید؟'))
		loadAJAXPage('product.do?reqCode=delete&productId='+$(x).attr('id'));
}
function editView(){
	$('#reqCode').val("updateViewList");
	$('form#listForm').ajaxSubmit(function(data){
		$("div#mainBody").html(data);
	});
}
function saveProduct(){
	try{
//			var value = $("#thickness").val(); 	
//			value = value.replace(/[0-9]*/g, "");
//			if (value!='' || $("#thickness").val()=="" || $("#thickness").val().length !== 12){
//				alert("لطفا برای ضخامت از اعداد رقمی خود را صحیح وارد کنید")
//				return false;
//			}
//			value = $("#price").val();
//			value = value.replace(/[0-9]*/g, "");
//			if (value!='' || $("#price").val()=="" || $("#price").val().length !== 12){
//				alert("لطفا کد اقتصادی 12 رقمی خود را صحیح وارد کنید")
//				return false;
//			}
//			value = $("#description").val();
			$('form#newProductForm').ajaxSubmit(function(data){
				$("div#mainBody").html(data);
			});			
		}catch(e){
			alert(e);
		}
}