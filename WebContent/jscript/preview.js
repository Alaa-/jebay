$(document).ready(	
	function() {
		var $container = $(".container");	
		$container.wtScroller({
					auto_start:true,
					num_display:4,
					slide_width:215,
					slide_height:160,
					slide_margin:0,
					button_width:35,
					ctrl_height:25,
					margin:10,	
					auto_scroll:true,
					delay:6000,
					scroll_speed:2000,
					easing:"",
					auto_scale:true,
					move_one:false,
					ctrl_type:"none",
					display_buttons:true,
					mouseover_buttons:false,
					display_caption:true,
					mouseover_caption:false,
					caption_effect:"slide",
					caption_align:"bottom",
					caption_position:"outside",					
					cont_nav:true,
					shuffle:false,
					mousewheel_scroll:true
				});
		init();
	}
	
);