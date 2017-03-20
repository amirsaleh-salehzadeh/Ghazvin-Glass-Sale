$(document).ready(function(){
			var i = $('#roles').val().split(',');
			$('.allRoles').each(function(){
				for (var p = 0 ; p < i.length ; p++){
					if(i[p]===$(this).attr('id'))
						$(this).attr('checked','checked');
				}
			});
		});