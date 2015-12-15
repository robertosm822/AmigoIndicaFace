/*
*
*	Javascript document
*
* 	Estácio
* 	17/10/2014
*	Author: Alexandre Mattos
*
*/
jQuery(document).ready(function(){

	/*
		Duvidas
	*/
	jQuery(".duvidas").each(function(){
		var obj = jQuery(this);
		var btn = obj.find('a');
		btn.click(function(){
			var select = jQuery(this);
			select.parent().find(".container").slideToggle();
			if ( select.hasClass("active") ){
				select.removeClass("active");
			}else{
				select.addClass("active");
			}
		});
	});

});