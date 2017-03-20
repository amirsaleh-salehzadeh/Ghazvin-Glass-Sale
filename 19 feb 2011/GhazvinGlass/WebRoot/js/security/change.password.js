function checkForm(){
	if($("#pass").val()===""||$("#pass").val()!==$("#repass").val()){
		alert("لطفا رمز را صحیح وارد کنید")
		return false;
	}else{
		return true;
	}
}
function changePassFormSumbit(){
	if(checkForm()){
		$('form#changePasswordForm').ajaxSubmit( function(data){
			$("div#mainBody").html(data);
		});
	}
}