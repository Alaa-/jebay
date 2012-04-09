// JavaScript Document
$(document).ready(function(){
	$('.tabsHead li').click(function(event){
		var id= $(this).attr('id');
		var idNew= id.split('_');
		$('#tabsHead_'+idNew[1]+' li').removeClass('active');
		$(this).addClass('active');
		$('#tabsContainer_'+idNew[1]+' .tabsContent').css('display','none');
		$('#tabsContent_'+idNew[1]+'_'+idNew[2]).css('display','block');
	});
	
	$('.arrow').click(function(event){
		var id= $(this).attr('id');
		var idNew= id.split('_');
		$('#subSection_'+idNew[1]).toggle();
		$(this).toggleClass('active');
	});
});