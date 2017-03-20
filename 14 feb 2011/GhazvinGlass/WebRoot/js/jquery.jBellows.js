/*
 * jQuery jBellows
 * Copyright 2010 Jake Lauer with Clarity Design (isthatclear.com)
 * Released under the MIT and GPL licenses.
 */
		(function($){
			$.fn.jBellows = function(options) {

				var defaults = {
					speed: "fast",
					easing: ""
				};

				var options = $.extend(defaults, options);

				return this.each(function() {
					var ul = $(this).find('ul');
					var li = $(this).find('li');
					var expand = li.find('.jb_expand');
					
					/*----Hide secondary items----*/
					ul.hide();
					
					expand.click(function(){
						var dontSlide = $(this).parent().find('ul');
						if( $.easing.def ) {
							$(this).parent().parent().find('ul').not(dontSlide).slideUp({duration: options.speed, easing: options.easing });
						} else {
							$(this).parent().parent().find('ul').not(dontSlide).slideUp(options.speed);
						}
						if( $.easing.def ) {
							dontSlide.stop(false,true).slideToggle({duration: options.speed, easing: options.easing });
						}else {
							dontSlide.stop(false,true).slideToggle(options.speed);
						}
					});
					
				});

			};

		})(jQuery);