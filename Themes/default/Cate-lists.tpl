<!doctype html>
<html>
<head>
<title>{$cateinfo.pagetitle}</title>
<meta name="keywords" content="{$cateinfo.pagekey}" />
<meta name="description" content="{$cateinfo.pagedec}" />
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css"  rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="__SKIN__/font_icon/style.css">
<script type="text/javascript" src="__JS__/jquery.js"></script>
<script type="text/javascript" src="__JS__/reLayout.js"></script>
<script type="text/javascript" src="__JS__/common.js"></script>
<script type="text/javascript" src="__JS__/jquery.autocomplete.js"></script>
<script type="text/javascript" src="__JS__/jq.puzz.js"></script>
<script type="text/javascript" src="__JS__/gentimer.js"></script>
<script type="text/javascript" src="__JS__/jquery.prompt.min.js"></script>
<script type="text/javascript" src="__JS__/dialog.js"></script>
</head>
<body>
<include file="Themes/default/Public/header.tpl" />
      
<div id="body_box" class="product_list">
	<div class="wrap pro_box">
        <div class="clearboth"></div>
        <div class="view_list_box">
        	<div class="all_pro">{$count} Item(s)</div>
            <div class="view_choose">
			<form class="sortby select">
			<select class="changegourl">
				<option  value="">Sort by</option>
				<option value="/Narrow/c888/list---1-1-----r1.html"  selected="true"  >Popular</option>
				<option value="/Narrow/c888/list---3-1-----r1.html"  >Sale</option>
				<option value="/Narrow/c888/list---2-2-----r1.html" >Price ↑</option>
				<option value="/Narrow/c888/list---2-1-----r1.html" >Price ↓</option>
				<option value="/Narrow/c888/list---7-1-----r1.html"  >New In</option>
				<option value="/Narrow/c888/list---5-1-----r1.html"  >Like</option>
			</select>
			</form>
            </div>
        </div>
        <div class="clearboth"></div>
        <div class="select_box" style="display:none"></div>
        <ul class="common_pro_list1" id="product_list">
		<notempty name="list">
		<foreach name="list" item="vo">
			<li>
				<a class="pic" href="{:build_url($vo,'pro_url')}"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}"></a>
				<a class="name" href="{:build_url($vo,'pro_url')}">{:build_url($vo,'pro_name')}</a>
				<div class="price">
					<span>{:getprice($vo['price'],$vo['pricespe'],false)}</span>
					<span> </span>
					<span class="oldprice">{:getprice_str($vo['price'])}</span>
				</div>
			   <!--<div class="discount"><span>20%</span>OFF</div>-->
			</li>
			<div class="select_content" id="skucontent{$vo.id}" goods_id="{$vo.id}" style="display:none">
			<div class="checkmain"></div>
			</div>
		</foreach>
		</notempty>
		</ul>
        <script>
            $(function(){
                $(".select_content").css("left",(parseInt($("html").width()) - 300)/2 + "px");
                $(".select_box").height($("html").height());
            });
        </script>
        <div class="clear10"></div>
        <a href="javascript:;" class="viewmore listviewmore">View More >></a>
        <div class="clear10"></div>
    </div>
            <script type="text/javascript">
                    $(document).ready(function(){
                        var totalpage={$totalpage};
                        var curr_page=1;
                        var is_loading=false;
                        var next_page='{:U('Cate/lists',array('cid'=>$cateinfo['id'], 'p'=>2))}';
                        $(window).scroll(function(){
                            if(($(window).scrollTop()+$(window).height()+1200)>=$(document.body).height())
                            {
                                if(curr_page<totalpage)
                                {
                                    if(!is_loading)
                                    {
                                        $('.mask_wait_box').show();
                                        is_loading=true;
                                        $.ajax({
                                              url:next_page,
                                              type: 'GET',
                                              data:{
                                                  ajax   : 1
                                              },
                                              dataType:'html',
                                              cache:false,
                                              success:function(html){
                                                  curr_page=curr_page+1;
                                                  $('#product_list').append(html);                                              
                                                  $('.mask_wait_box').hide();
                                                  reLayout("#product_list",200,200);
                                                  is_loading=false;
                                                  next_page=$('#next_page').html();
                                                  $('#next_page').remove();
                                              },
                                              error:function(){                                           
                                                  $('.mask_wait_box').hide();
                                                  $.Prompt('Error loading!');
                                                  is_loading=false;
                                              }
                                          }); 
                                    }
                                    else
                                    {
                                        
                                    }
                                }
                                else
                                {
                                    //$.Prompt('Already in the end portion of the page!');
                                    $('.listviewmore').html('Already in the end portion of the page!');
                                }
                            }
                        });
                        $('.listviewmore').click(function(){
                                if(curr_page<totalpage)
                                {
                                    if(!is_loading)
                                    {
                                        $('.mask_wait_box').show();
                                        is_loading=true;
                                        $.ajax({
                                              url:next_page,
                                              type: 'GET',
                                              data:{
                                                  ajax   : 1
                                              },
                                              dataType:'html',
                                              cache:false,
                                              success:function(html){
                                                  curr_page=curr_page+1;
                                                  $('#product_list').append(html);                                              
                                                  $('.mask_wait_box').hide();
                                                  reLayout("#product_list");
                                                  is_loading=false;
                                                  next_page=$('#next_page').html();
                                                  $('#next_page').remove();
                                              },
                                              error:function(){                                           
                                                  $('.mask_wait_box').hide();
                                                  $.Prompt('Error loading!');
                                                  is_loading=false;
                                              }
                                          }); 
                                    }
                                    else
                                    {
                                        
                                    }
                                }
                                else
                                {
                                    //$.Prompt('Already in the end portion of the page!');
                                    $('.listviewmore').html('Already in the end portion of the page!');
                                }
                        });
                    });

                    $(".changegourl").change(function() {
                        if($(this).attr("value") != ""){
                            window.location.href = $(this).attr("value");
                        }
                    });        
               </script>

    
</div>
   

<div class="narrow_popupBoxBg"></div>
<div class="narrow_box" style="width:200px; height:100%; position:absolute; right:0px; top:0px; z-index:9999; overflow:hidden; display: none;">
    <div class="narrow_slide" style="-webkit-transition: -webkit-transform 0.4s;-webkit-transform-origin: 0px 0px; -webkit-transform-style: preserve-3d;-webkit-transform: translate(190px, 0);">
        <ul class="narrow">
                                      
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){        
        $(".Narrow").click(function(e){
            scroll(0,0);
            $(".narrow_popupBoxBg").show();
            $('.narrow_box').height($(document).height());		
            $(".narrow_box").css({"-webkit-transform-origin": "0px 0px", "opacity": "1", "-webkit-transform": "scale(1, 1)"});  
            $(".narrow_box").show("display","");
            //$(".narrow_box").animate({width: '190px'}, "500",'swing',function(){});            
            $(".narrow_slide").attr('style',' -webkit-transform-style: preserve-3d; -webkit-transition: -webkit-transform 0.4s; -webkit-transform-origin: 0px 0px; -webkit-transform: translate(0px, 0); ')
            e.stopPropagation(); 
        });
        $(document).click(function(){
            $(".narrow_popupBoxBg").hide();
            $(".narrow_slide").attr('style','-webkit-transition: -webkit-transform 0.4s;-webkit-transform-origin: 0px 0px; -webkit-transform-style: preserve-3d;-webkit-transform: translate(190px, 0);')
            setTimeout(function(){
			$(".narrow_box").hide();
	    },400);            
        });
        $(".narrow_box").click(function(e){
            e.stopPropagation();
        });
    });
    $('.narrow_box a.first').click(function(){
        if($(this).parent().find('ul').css('display')=='none')
        {
            $(this).parent().siblings().find('ul').hide();
            $(this).find('span').addClass('up');
            $(this).parent().find('ul').show();
        }
        else
        {
            $(this).find('span').removeClass('up');
            $(this).parent().find('ul').hide();
        }
    });
</script>

<include file="Themes/default/Public/front_footer.tpl" />

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
