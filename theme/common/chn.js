$(document).ready(function(){
						   
$(".menu_ny ul h4").click(function(){
	var dl_obj=$(this).next("dl");
	var attr_str=dl_obj.attr("class");
	if(attr_str=="hover")
	{
		dl_obj.css("display","none");
		dl_obj.removeClass("hover");
	}
	else
	{ 
	  $(".menu_ny li dl").removeClass("hover");
	  $(".menu_ny li dl").css("display","none");
	  dl_obj.css("display","block");
	  dl_obj.addClass("hover");
	}
});
	
	
$(".menu_ny ul dt").click(function(){
	var dd_obj=$(this).next("dd");
	var attr_str=dd_obj.attr("class");
	
	if(attr_str=="hover")
	{
		dd_obj.css("display","none");
		dd_obj.removeClass("hover");
	}
	else
	{ 
	  $(".menu_ny li dd").removeClass("hover");
	  $(".menu_ny li dd").css("display","none");
	  dd_obj.css("display","block");
	  dd_obj.addClass("hover");
	}
});

$(".menu_ny ul h4").click(function(){
   $(".menu_ny li h4").removeClass("hovers01");
      $(this).addClass("hovers01");
	});
	
$(".menu_ny ul dt").click(function(){
 
	var attr_str01=$(this).attr("class");
	if(attr_str01=="hovers02")
	{
	$(this).removeClass("hovers02");
	}
	else
	{ 
	  $(this).addClass("hovers02");
	}
   
	});
	
	if($(".banner ul.featureUL li").size()>0){
	
$(".banner ul.featureUL").tabs(".banner .b_tabs > .ban_con", {effect: 'fade',loop:true,fadeOutSpeed:1000,fadeInSpeed:1000,rotate: true}).slideshow({autoplay:true,interval: 7000});
}

	$(".block .botton-scroll").scrollable({size:4,items:".block .botton-scroll ul",loop:true,prev:"a.prev_show",next:"a.next_show"}).autoscroll({ autoplay: true,interval:7000 });	
	
		$(".block a.prev_show").hover(function(){
	$(this).css("background-position","0 -24px");	
},function(){
	$(this).css("background-position","0 0");	
});

$(".block a.next_show").hover(function(){
	$(this).css("background-position","-13px -24px");	
},function(){
	$(this).css("background-position","-13px 0");	
});
    
	$('.return_top').click(function(){
    $('html, body').animate({scrollTop: 0},500);
    });
	
	$(".zt_nr .block_zt").scrollable({circular:true,size:1,items:".botton_zt ul",loop:true,prev:"a.prev_btn",next:"a.next_btn"});	
	
	$("a.prev_btn").hover(function(){
	$(this).css("background-position","0 -180px");	
},function(){
	$(this).css("background-position","0 0");	
});

$("a.next_btn").hover(function(){
	$(this).css("background-position","-31px -180px");	
},function(){
	$(this).css("background-position","-31px 0");	
});


 if($(".topnews ul li a").size()>0){	
$(".topnews ul").tabs(".xwzx > .newslist", {loop:true,fadeOutSpeed:1000,fadeInSpeed:1000, rotate:true, event:"mouseover"}).slideshow({autoplay:false,interval: 3000});}


    if($(".cptj ul li").size()>0){
	
$(".cptj ul").tabs(".cp_nr > dl", {loop:true,fadeOutSpeed:1000,fadeInSpeed:1000,rotate: true, event:"mouseover"});}

$(".p_list li").hover(function(){
		$(".p_list li").width("auto").find("a").removeClass("current");   
		$(this).width(223);  
},function(){ 
		$(this).width("auto");  
});

$(".p_list").mouseleave(function(){
	$(".cptj .cptj_list .cp_nr").each(function(e){
	if($(".cptj .cptj_list .cp_nr").eq(e).css("display")=="block"){
		$(".p_list li").eq(e).find("a").addClass("current").end().width(223);
	}
});
});

 if($("dl.so_none dd").size()>0){
	
$("dl.so_none").tabs(".cp_neir > .chanpin", {loop:true,rotate: true});
}

	$("a#w_btn").hover(function(){
	                           $("dl.so_none dd a.current").parent().prev().find("a").click();
                                });

    $("a#n_btn").hover(function(){
                           $("dl.so_none dd a.current").parent().next().find("a").click();
                               });
							   
							   
	$("a.prev_show").click(function(){
	                           $(".botton-scroll li a.current").parent().prev().click();
                                });

      $("a.next_show").click(function(){
	                           $(".botton-scroll li a.current").parent().next().click();
                                });

});