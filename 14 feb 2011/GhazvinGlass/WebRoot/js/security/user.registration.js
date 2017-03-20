$(document).ready(function(){
	$(".typeCombo").each(function(){
		if($(this).attr("checked")==true){
			if($(this).val()==="real"){
				$("table#realTable").css("visibility","visible");
				$("table#legalTable").css("visibility","hidden");
			}else if($(this).val()==="legal"){
				$("table#legalTable").css("visibility","visible");
				$("table#realTable").css("visibility","hidden");
			}
		}
	});
});
function submitRegisterForm(){
	if(validateForm()){
		$("#reqCode").val("save");			
		$("#userInsertForm").submit();
	}
}
		function changeUserType(x){
			if($(x).val()==="real"){
				$("div#mainContainer").html($("#realUser").html());
				$("table#realTable").css("visibility","visible");
				$("table#legalTable").css("visibility","hidden");
			}else{
				$("div#mainContainer").html($("#legalUser").html());
				$("table#legalTable").css("visibility","visible");
				$("table#realTable").css("visibility","hidden");
			}
		}
		function validateForm(){
			if($("input[name='type']:checked").val() === 'legal'){
				var value = $("#econNo").val(); 	
				value = value.replace(/[0-9]*/g, "");
				if (value!='' || $("#econNo").val()=="" || $("#econNo").val().length !== 12){
					$("#econNo").parent().parent().css('color','red');
					alert("لطفا کد اقتصادی 12 رقمی خود را صحیح وارد کنید")
					return false;
				}
				if($("#pass").val()===""||$("#pass").val()!==$("#repass").val()){
					$("#pass").parent().parent().css('color','red');
					alert("لطفا رمز را صحیح وارد کنید")
					return false;
				}
				if($("#companyName").val()===""){
					$("#companyName").parent().parent().css('color','red');
					alert("لطفا نام سازمان را صحیح وارد کنید")
					return false;
				}
				if($("#legalemail").val().indexOf('@') === -1 ||  $("#legalemail").val().indexOf('.') === -1){
					$("#legalemail").parent().parent().css('color','red');
					alert("لطفا پست الکترونیکی را صحیح وارد کنید")
					return false;
				}
			}else{
				if($("#userName").val()===""){
					$("#userName").parent().parent().css('color','red');
					alert("لطفا نام کاربری را صحیح وارد کنید")
					return false;
				}
				if($("#pass").val()===""||$("#pass").val()!==$("#repass").val()){
					$("#pass").parent().parent().css('color','red');
					alert("لطفا رمز را صحیح وارد کنید")
					return false;
				}
				var value = $("#nationalID").val(); 	
				value = value.replace(/[0-9]*/g, "");
				if (value!='' || $("#nationalID").val()=="" || $("#nationalID").val().length !== 10){
					$("#nationalID").parent().parent().css('color','red');
					alert("لطفا کد ملی را صحیح وارد کنید")
					return false;
				}
				if($("#realemail").val().indexOf('@') === -1 ||  $("#realemail").val().indexOf('.') === -1){
					$("#realemail").parent().parent().css('color','red');
					alert("لطفا پست الکترونیکی را صحیح وارد کنید")
					return false;
				}
				if($("#year").val()==="" || $("#month").val()==="" || $("#day").val()===""){
					$("#year").parent().parent().css('color','red');
					alert("لطفا تاریخ تولد را صحیح وارد کنید")
					return false;
				}
			}
			return true;
		}
		function saveFormSubmit(){
			$('#reqCode').val("save");	
			try{
				$('#userInsertForm').ajaxSubmit(function(data){
					$("div#mainBody").html(data);
				});
			}catch(e){
				alert(e);
			}
		}
		function checkValidty(){
		$('#userInsertForm').attr("action","register.do");
			if($("#userName").val()===""){
				$("#userName").parent().parent().css('color','red');
				alert("لطفا نام کاربری را صحیح وارد کنید")
			}else{
				$('#reqCode').val("checkValidity");
				try{
					$('#userInsertForm').ajaxSubmit(function(data){
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