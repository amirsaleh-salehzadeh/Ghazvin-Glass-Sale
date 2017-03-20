function delThis(x){
	var url = "t_order.do?reqCode=delete&orderId="+$(x).attr("id");
	if(confirm('آیا مایل به حذف این محصول می باشید؟'))
		window.location.replace(url);
}
function showOrder(x){
	var loader = "order.do?reqCode=getOrder&orderId="+$(x).attr('id');
	$("div#printDIV").load(loader,"",function(){
		text = $("div#printDIV").html();
		$("div#printDIV").css("display","none");
		win = window.open("about:blank","","");
		doc = win.document;
	    doc.open('text/html');
	    doc.write('<html><head><title>'+$('#AipPivotMdx_reportName').val()+'<\/title><link href="css/aipPrint.css" rel="stylesheet" type="text/css" />');
	    doc.write('<\/head>');
	    doc.write('<body bgcolor="white">');
		doc.write("<div align=\"center\" dir=\"rtl\" >");
		doc.write("</div>");
	    text = text.replace("</td>","&nbsp;</td>");
	    doc.write('<br/>' + text + '<\/div>');
	    doc.write('<\/body><\/html>');
	   	doc.close();
	   	win.print();
	});
}
function goToSearch(){
	$("#reqCode").val("list");
	$('form#listForm').ajaxSubmit(function(data){
		$("div#mainBody").html(data);
	});
}