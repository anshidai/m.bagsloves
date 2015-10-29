<!doctype html>
<html>
<head>
<title>Zhcart - Global Online Shopping for Dresses, Home & Garden, Electronics, Wedding Apparel </title><meta name="keywords" content="sexy clothes,cheap hats,good caps " /><meta name="description" content="A professional and reliable online shopping center providing a variety of hot selling products at reasonable prices and shipping them globally. " />
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link href="__CSS__/style.css" type="text/css" rel="stylesheet">
<link href="__CSS__/tips.css" type="text/css" rel="stylesheet" />
<link href="__CSS__/banner.css" type="text/css"  rel="stylesheet"/>
<link href="__SKIN__/font_icon/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="__JS__/jquery.js"></script>
<script type="text/javascript" src="__JS__/reLayout.js"></script>
<script type="text/javascript" src="__JS__/common.js"></script>
<script type="text/javascript" src="__JS__/jquery.autocomplete.js"></script>
<script type="text/javascript" src="__JS__/jq.puzz.js"></script>
<script type="text/javascript" src="__JS__/gentimer.js"></script>
<script type="text/javascript" src="__JS__/jquery.prompt.min.js"></script>
<script type="text/javascript" src="__JS__/dialog.js"></script>
<script type="text/javascript" src="__JS__/touchCarousel.js"></script>
</head>
<body>
<include file="Themes/default/Public/header.tpl" />
 
<div id="body_box" class="index_default">
    <div id="carousel" class="touchcarousel MB15 lazyload" style="overflow: visible;">
    <div class="touchcarousel-wrapper grab-cursor">
        <ul class="touchcarousel-container">
            <li class="touchcarousel-item" ><a onclick="" href=""><img src="__IMG__/slide-1.jpg" width="100%"/></a></li>
        </ul>
    </div>
</div>

<script>
$(function() {
	$("#carousel").touchCarousel({
			itemsPerMove:1,
			pagingNav: 1,
			scrollbar: 0,
			directionNav: 0,
			directionNav:true,
			itemLikeWindowWidth: 1,
			directionNavAutoHide:false,
			autoplay:true,
			directionNav:false,
			pagingNavControls:true
	});     
});
window.onload=function(){
    $(".touchcarousel-container li").show()
}
</script>  
<div class="clear"></div>
<div class="pro_deals">
    <h3 class="commonh3_1 tit"><a href="/Deals/c0/list-r1.html">FLASH SALE<i class="arr icon-right"></i></a></h3>
</div>
<div class="clear10"></div>
<h3 class="commonh3_1 tit">	Best Sellers<!--<a class="more" href="/Narrow/t1/list-r1.html">more >></a>--></h3>
<div class="wrap pro_box">
    <ul class="common_pro_list1">
        <div class="select_box" style="display:none"></div>
        <notempty name="new_products">
		<foreach name="new_products" item="vo">
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
	<div class="select_content" id="skucontent{$vo.id}"  goods_id="{$vo.id}" style="display:none"><div class="checkmain"></div></div>
	</foreach>
	</notempty>  
    </ul>
</div>

<div class="clear10"></div>
<h3 class="commonh3_1 tit">Hot Items <!--<a class="more" href="/Narrow/t5/list-r1.html">more >></a>--></h3>
<div class="wrap pro_box">
    <ul class="common_pro_list1">
        <div class="select_box" style="display:none"></div>
        
        <notempty name="hot_products">
		<foreach name="hot_products" item="vo">
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
		<div class="select_content" id="skucontent{$vo.id}"  goods_id="{$vo.id}" style="display:none"><div class="checkmain"></div></div>
		</foreach>
		</notempty>  
    </ul>
</div>
<script>
	$(function(){
		$(".select_content").css("left",(parseInt($("html").width()) - 300)/2 + "px");
		$(".select_box").height($("html").height());
	});
</script>

<div class="clear"></div>
<div class="categories_box">
    <ul class="categories">
        <li class="allcategories"><a href="{:build_url('','cate_url')}">All Categories<i></i></a></li>
        <notempty name="catetree">
		<foreach name="catetree" item="vo">
		<li <if condition="$vo['id'] eq $cid">class="actived"</if>>
			<notempty name="vo.sub">
			<a href="{:build_url($vo,'cate_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			<else/>
			<a href="{:build_url($vo,'cate_list_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			</notempty>
		</li>
		</foreach>
		</notempty>
    </ul>
</div>  
</div>
<div id="bottom_box">
    <!--<div class="wrap">
        <div class="searchform_box">
            <form id="autocomplete-submit" class="searchform" action="/m-product-search.html" method="get">
                <input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax2" class="search_input"  value=""/>
                <input type="submit"  value="" id="btn-autocomplete2" class="btn_search" />
            </form>
        </div>
    </div>-->
    <script>
        $('#autocomplete-ajax2').autocomplete({
            serviceUrl: '/m-product-autocomplete.html',
            onSelect: function(suggestion) {
                var keywords = $('#autocomplete-ajax2').val();
                keywords = encodeURIComponent(suggestion.value);
                window.location.href = "/Search/" + keywords + "/list-r1.html";
            }
        });
        $('#btn-autocomplete2').click(function() {
            var keywords = $('#autocomplete-ajax2').val();
			if(keywords == ""){
				$.Prompt('Please enter a keyword!');
				return false;
			}
            keywords = encodeURIComponent(suggestion.value);
            $('#autocomplete-submit2').attr('action', '/Search/' + keywords + '/list-r1.html');
        });
    </script>



    <div class="clear15"></div>
    <div class="wrap">
        <form class="newletterform">
            <label>Subscribe To Our Newsletter</label>
            <input  name="Newsletter_Email" type="text" value="Your Email Address" id="email"  class="newsletter_txt"/>
            <input name="" type="button" value="Subscribe" class="common_btn1 newsletter_btn" />
        </form>
    </div>

    <script type="text/javascript">
        $('.newsletter_btn').click(function() {
            if ($('#email').val() == '' || $('#email').val() == 'Your Email Address')
            {
                $.Prompt('Please Enter Your Email Address!');
                return;
            }
            $isvalidemail = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test($('#email').val());
            if (!$isvalidemail)
            {
                $.Prompt('Please Enter a valid e-mail address!');
                return;
            }

            $.ajax({
                url: "m-user-newsletter.html",
                type: 'POST',
                data: {
                    email: $('#email').val()
                },
                dataType: 'json',
                cache: false,
                success: function(rs) {
                    if (rs.status == '1') {
                        $.Prompt('Successful');
                    } else if (rs.msg) {
                        $.Prompt(rs.msg);
                    }
                },
                beforeSend: function() {
                    createAjaxLoading();
                },
                complete: function() {
                    removeAjaxLoading();
                }
            });
        });
        $("#email").click(function() {
            if ($(this).val() == "Your Email Address")
                $(this).val("");
        })
    </script>

    <div class="clear"></div>
	<include file="Themes/default/Public/front_footer.tpl" />
</div>

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
