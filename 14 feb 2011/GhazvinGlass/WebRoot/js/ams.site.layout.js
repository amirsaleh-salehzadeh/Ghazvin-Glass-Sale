function loadAJAXPage(x){
	$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
	$('div#mainBody').load(x);
}