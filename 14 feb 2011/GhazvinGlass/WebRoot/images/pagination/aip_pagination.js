$(document).ready(function () {
	$(".noHref").removeAttr("href");
	$(".paginate a[id^='hrefed']").bind("click", function(){
//		var forms = $("form");
//		for (var i = 0 ; i < forms.length ; i = i + 1) {
//			if ($(forms[i]).attr('id') !== 'ajaxForm') {
				var page = $(this).attr('id');
				page = page.substring(6);
				$('#listForm').prepend('<input name="page" dir="ltr" type="hidden" id="hiddenPage" value="" />');
				$("input#hiddenPage").attr("value",page);
//				if ($(document).getUrlParam("reqCode") == "save") {
//					$("#reqCode").val("list");
//				} 
				$('#listForm').ajaxSubmit( function(data){
					$("div#mainBody").html(data);
				});
//			}
//		}
		return false;
 	});	
});