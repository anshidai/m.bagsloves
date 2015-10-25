function reLayout(obj,width,height)
{
	var windowWidth=$("#top_box").width();
	var p_panelWidth=windowWidth-20;
	var lineNum=2;
	if(windowWidth<=640)
	{
		lineNum=2;
	}
	else if(windowWidth>640)
	{
		lineNum=4;
	}
	
	var itemWidth=(p_panelWidth-2*lineNum-(lineNum-1)*6)/lineNum;
	itemWidth=Math.floor(itemWidth);
    //$('#windowwidth').html(itemWidth);
        var itemHeight = itemWidth*height/width;
        itemHeight = Math.round(itemHeight);
	$(obj).find("li").not('.other').width(itemWidth+2);
        
	$(obj).find("li").not('.other').find("a.pic").width(itemWidth);
	$(obj).find("li").not('.other').find("a.pic").height(itemHeight);
	$(obj).find("li.other").remove();
	$(obj).find("li").removeClass("no_marg");
	$(obj).find("li").not('.other').each(function(index){
	    //alert((index+1)%lineNum);		
		if((index+1)%lineNum==0)
		{
                        $(this).addClass("no_marg");
			
			$(this).after("<p class='other'></p>");
		}
	});
}