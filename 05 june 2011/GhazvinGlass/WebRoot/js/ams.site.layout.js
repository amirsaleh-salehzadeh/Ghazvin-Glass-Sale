function loadAJAXPage(x){
	$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
	$('div#mainBody').load(x);
}
function changeLanguage(x){
	if(x==="english"){
		window.location.replace("t_requestForPage.do?reqCode=english");
	}else if(x==="farsi"){
		window.location.replace("t_requestForPage.do?reqCode=farsi");
	}
}