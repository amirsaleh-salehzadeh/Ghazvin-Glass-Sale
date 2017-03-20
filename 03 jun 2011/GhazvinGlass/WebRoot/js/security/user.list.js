function showDialogEditUser(x){
	var loader = "user.do?reqCode=goToEdit&id="+$(x).attr('id');
	showDialog('dlgEditUser','center',loader);
}
function goToSearchUser(){
	$("#reqCode").val("list");
	$('form#userListForm').ajaxSubmit(function(data){
		$("div#mainBody").html(data);
	});
}
function confirmRoles(){
	try{
	var options = {
	    success: function(req) {
	        alert("اطلاعات با موفقیت ذخیره شد.");
	        $("#bgDiv4Message").remove();
	    }
	    ,error: function(req){
	    	alert("ذخیره اطلاعات با مشکل مواجه شده است" + req.responseText);
	    	$("#bgDiv4Message").remove();
	    }
	   };
		$('form#roleListForm').ajaxSubmit(options);
	}catch(e){
		alert(e);
	}
}
function confirmEditUser(){
	try{
	var options = {
	    success: function(req) {
	        alert("اطلاعات با موفقیت ذخیره شد.");
	        $("#bgDiv4Message").remove();
	    }
	    ,error: function(req){
	    	alert("ذخیره اطلاعات با مشکل مواجه شده است" + req.responseText);
	    	$("#bgDiv4Message").remove();
	    }
	   };
		$('form#userInsertForm').ajaxSubmit(options);
	}catch(e){
		alert(e);
	}
}
function delThis(x){
	if(confirm('آیا مایل به حذف این کاربر می باشید؟'))
		window.location.replace('t_user.do?reqCode=delete&id='+$(x).attr("id"));
}