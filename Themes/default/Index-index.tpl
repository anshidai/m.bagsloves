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
<div class="topsearchform">
	<div class="searchform_box">
        <form id="autocomplete-submit" class="searchform" action="/m-product-search.html" method="get">
            <input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax" class="search_input"  value=""/>
            <button type="submit"  value="GO" id="btn-autocomplete" class="btn_search">Search</button>
        </form>
    </div>
</div>
<div class="topcategorieswrap">
	<div class="topcategorieswrapbg"></div>
	<ul class="topcategories">
		<li class="allcategories"><a href="/m-category-default.html">All Categories<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-888.html">Women's Dresses<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-909.html">Wedding Dresses<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-910.html">Party & Occasions<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-911.html">Shoes & Boots<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-912.html">Men's Clothes<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-914.html">Health and Beauty<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-915.html">Cosplay and Costumes<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-916.html">Watch & Jewelry<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-917.html">Trends<i class="arr icon-right2"></i></a></li>
		<li><a href="/cateList-934.html">Fashion Bags<i class="arr icon-right2"></i></a></li>
	</ul>
</div>        
<script>
$('#autocomplete-ajax').autocomplete({
    serviceUrl: '/m-product-autocomplete.html',
    onSelect: function(suggestion) {
        var keywords = $('#autocomplete-ajax').val();
        keywords = encodeURIComponent(suggestion.value);
        window.location.href = "/Search/" + keywords + "/list-r1.html";
    }
});
$('#btn-autocomplete').click(function() {
    var keywords = $('#autocomplete-ajax').val();
    if(keywords == ""){
        $.Prompt('Please enter a keyword!');
        return false;
    }
    keywords = encodeURIComponent(suggestion.value);
    $('#autocomplete-submit').attr('action', '/Search/' + keywords + '/list-r1.html');
});
$(document).click(function() {
    $(".keywords_box").hide();
    $('#body_box').css('display', '');
    $('#inner_body_box').css('display', '');
    $('#account_body_box').css('display', '');
    $('#comment_body_box').css('display', '');
    $('footer').css('display', '');
});
$("input[name='keywords']").click(function(e) {
    e.stopPropagation();
});
$(".keywords_box").click(function(e) {
    e.stopPropagation();
});
</script>
<script type="text/javascript">
$(function(){
	var window_h=$(window).height();
	$(".topcategorieswrap").css("height",window_h);
	$(".topcategorieswrapbg").css("height",window_h);
	$(".topcategories").css({"height":window_h,"overflow-y":"auto"})
	
	
	$("#top_box .categoriesbtn").click(function(){
		$(".topcategorieswrap").toggle(500);
		$(this).toggleClass("oncategoriesbtn");
		if($(".topcategorieswrap").css("display")=="block"){
			$(document.body).css("height",window_h).css({"overflow":"hidden"});
		}else{$(document.body).css("height","auto").css({"overflow":"auto"});}
	});
	$("#top_box .categoriesbtn").click(function(e){
	var e=window.event || e;
	if(e.stopPropagation){
	e.stopPropagation();
	}else{
	e.cancelBubble = true;
	}							   
	});
	$(document).click(function(){
	$(".topcategorieswrap").hide(500);
	$("#top_box .categoriesbtn").removeClass("oncategoriesbtn");
	$(document.body).css("height","auto").css({"overflow":"auto"});
	});
	
	$("#top_box .searchformbtn").click(
		function(){
			$(".topsearchform").toggle();
			$(this).toggleClass("onsearchformbtn");
		}
	);
	$("#top_box .searchformbtn").click(function(e){
//阻止冒泡
	var e=window.event || e;
	if(e.stopPropagation){
	e.stopPropagation();
	}else{
	e.cancelBubble = true;
	}							   
	});
	$(document).click(function(){
	$(".topsearchform").hide();
	});
})
</script>
       
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
<h3 class="commonh3_1 tit">	Best Sellers<a class="more" href="/Narrow/t1/list-r1.html">more >></a></h3>
<div class="wrap pro_box">
    <ul class="common_pro_list1">
        <div class="select_box" style="display:none"></div>
        
        <li>
    <a class="pic" href="/Mermaid-Applique-Chapel-Train-Ivory-Bridal-Wedding-Gown-with-V-Neck-Spaghetti-Strap-p10413.html" title="Mermaid Applique Chapel Train Ivory Bridal Wedding Gown with V-Neck Spaghetti Strap"><img src="__IMG__/index_01.jpg" alt="Mermaid Applique Chapel Train Ivory Bridal Wedding Gown with V-Neck Spaghetti Strap" title="Mermaid Applique Chapel Train Ivory Bridal Wedding Gown with V-Neck Spaghetti Strap"></a>
    <a class="name" href="/Mermaid-Applique-Chapel-Train-Ivory-Bridal-Wedding-Gown-with-V-Neck-Spaghetti-Strap-p10413.html" title="Mermaid Applique Chapel Train Ivory Bridal Wedding Gown with V-Neck Spaghetti Strap">Mermaid Applique Chapel Train Ivory Bridal Wedding Gown with V-Neck Spaghetti Strap</a>
    <div class="price">
        <span>US$ 292.80</span>
        <span> </span>        <span class="oldprice">US$ 366.00</span>    </div>
              
       <div class="discount"><span>20%</span>OFF</div>
    </li>

<div class="select_content" id="skucontent10413"  goods_id="10413" style="display:none">
    <div class="checkmain"></div>
</div>
        <li>
    <a class="pic" href="/White-Off-The-Shoulder-Wedding-Dress-p10412.html" title="White Off-The-Shoulder Wedding Dress"><img src="__IMG__/index_02.jpg" alt="White Off-The-Shoulder Wedding Dress" title="White Off-The-Shoulder Wedding Dress"></a>
    <a class="name" href="/White-Off-The-Shoulder-Wedding-Dress-p10412.html" title="White Off-The-Shoulder Wedding Dress">White Off-The-Shoulder Wedding Dress</a>
    <div class="price">
        <span>US$ 292.80</span>
        <span> </span>        <span class="oldprice">US$ 366.00</span>    </div>
              
       <div class="discount"><span>20%</span>OFF</div>
    </li>

<div class="select_content" id="skucontent10412"  goods_id="10412" style="display:none">
    <div class="checkmain"></div>
</div>
        <li>
    <a class="pic" href="/Graceful-Ivory-Mermaid-Strapless-Lace-Tulle-Wedding-Dress-For-Bride-p10411.html" title="Graceful Ivory Mermaid Strapless Lace Tulle Wedding Dress For Bride"><img src="__IMG__/index_03.jpg" alt="Graceful Ivory Mermaid Strapless Lace Tulle Wedding Dress For Bride" title="Graceful Ivory Mermaid Strapless Lace Tulle Wedding Dress For Bride"></a>
    <a class="name" href="/Graceful-Ivory-Mermaid-Strapless-Lace-Tulle-Wedding-Dress-For-Bride-p10411.html" title="Graceful Ivory Mermaid Strapless Lace Tulle Wedding Dress For Bride">Graceful Ivory Mermaid Strapless Lace Tulle Wedding Dress For Bride</a>
    <div class="price">
        <span>US$ 292.80</span>
        <span> </span>        <span class="oldprice">US$ 366.00</span>    </div>
              
       <div class="discount"><span>20%</span>OFF</div>
    </li>

<div class="select_content" id="skucontent10411"  goods_id="10411" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
        <li>
    <a class="pic" href="/Ivory-Beading-Strapless-Mermaid-Wedding-Dress-p10410.html" title="Ivory Beading Strapless Mermaid Wedding Dress"><img src="__IMG__/index_04.jpg" alt="Ivory Beading Strapless Mermaid Wedding Dress" title="Ivory Beading Strapless Mermaid Wedding Dress"></a>
    <a class="name" href="/Ivory-Beading-Strapless-Mermaid-Wedding-Dress-p10410.html" title="Ivory Beading Strapless Mermaid Wedding Dress">Ivory Beading Strapless Mermaid Wedding Dress</a>
    <div class="price">
        <span>US$ 566.00</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10410"  goods_id="10410" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
    </ul>
</div>


<div class="clear10"></div>
<h3 class="commonh3_1 tit">Hot Items<a class="more" href="/Narrow/t5/list-r1.html">more >></a></h3>
<div class="wrap pro_box">
    
    <ul class="common_pro_list1">
        <div class="select_box" style="display:none"></div>
        
        <li>
    <a class="pic" href="/Ivory-Mermaid-Backless-Jewel-Neck-Lace-Sweep-Satin-Wedding-Dress-p10388.html" title="Ivory Mermaid Backless Jewel Neck Lace Sweep Satin Wedding Dress"><img src="__IMG__/index_05.jpg" alt="Ivory Mermaid Backless Jewel Neck Lace Sweep Satin Wedding Dress" title="Ivory Mermaid Backless Jewel Neck Lace Sweep Satin Wedding Dress"></a>
    <a class="name" href="/Ivory-Mermaid-Backless-Jewel-Neck-Lace-Sweep-Satin-Wedding-Dress-p10388.html" title="Ivory Mermaid Backless Jewel Neck Lace Sweep Satin Wedding Dress">Ivory Mermaid Backless Jewel Neck Lace Sweep Satin Wedding Dress</a>
    <div class="price">
        <span>US$ 142.49</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10388"  goods_id="10388" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
        <li>
    <a class="pic" href="/A-Line-Strapless-Wedding-Dress-with-Ruffles-p10387.html" title="A Line Strapless Wedding Dress with Ruffles"><img src="__IMG__/index_06.jpg" alt="A Line Strapless Wedding Dress with Ruffles" title="A Line Strapless Wedding Dress with Ruffles"></a>
    <a class="name" href="/A-Line-Strapless-Wedding-Dress-with-Ruffles-p10387.html" title="A Line Strapless Wedding Dress with Ruffles">A Line Strapless Wedding Dress with Ruffles</a>
    <div class="price">
        <span>US$ 94.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10387"  goods_id="10387" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
        <li>
    <a class="pic" href="/Court-Train-Ivory-Brides-Wedding-Dress-with-Jewel-Neck-A-line-Bow-p10386.html" title="Court Train Ivory Brides Wedding Dress with Jewel Neck A-line Bow"><img src="__IMG__/index_07.jpg" alt="Court Train Ivory Brides Wedding Dress with Jewel Neck A-line Bow" title="Court Train Ivory Brides Wedding Dress with Jewel Neck A-line Bow"></a>
    <a class="name" href="/Court-Train-Ivory-Brides-Wedding-Dress-with-Jewel-Neck-A-line-Bow-p10386.html" title="Court Train Ivory Brides Wedding Dress with Jewel Neck A-line Bow">Court Train Ivory Brides Wedding Dress with Jewel Neck A-line Bow</a>
    <div class="price">
        <span>US$ 169.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10386"  goods_id="10386" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
        <li>
    <a class="pic" href="/Slimming-Trendy-Hooded-Personality-Color-Splicing-Long-Sleeves-Thicken-Hoodies-For-Men-p10385.html" title="Slimming Trendy Hooded Personality Color Splicing Long Sleeves Thicken Hoodies For Men"><img src="__IMG__/index_08.jpg" alt="Slimming Trendy Hooded Personality Color Splicing Long Sleeves Thicken Hoodies For Men" title="Slimming Trendy Hooded Personality Color Splicing Long Sleeves Thicken Hoodies For Men"></a>
    <a class="name" href="/Slimming-Trendy-Hooded-Personality-Color-Splicing-Long-Sleeves-Thicken-Hoodies-For-Men-p10385.html" title="Slimming Trendy Hooded Personality Color Splicing Long Sleeves Thicken Hoodies For Men">Slimming Trendy Hooded Personality Color Splicing Long Sleeves Thicken Hoodies For Men</a>
    <div class="price">
        <span>US$ 78.90</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10385"  goods_id="10385" style="display:none">
    <div class="checkmain"></div>
</div>

 
        
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
        <li class="allcategories"><a href="/m-category-default.html">All Categories<i></i></a></li>
        
        <li><a href="/cateList-888.html">Women's Dresses <i></i></a></li>
        
        <li><a href="/cateList-909.html">Wedding Dresses <i></i></a></li>
        
        <li><a href="/cateList-910.html">Party & Occasions <i></i></a></li>
        
        <li><a href="/cateList-911.html">Shoes & Boots <i></i></a></li>
        
        <li><a href="/cateList-912.html">Men's Clothes <i></i></a></li>
        
        <li><a href="/cateList-914.html">Health and Beauty <i></i></a></li>
        
        <li><a href="/cateList-915.html">Cosplay and Costumes <i></i></a></li>
        
        <li><a href="/cateList-916.html">Watch & Jewelry <i></i></a></li>
        
        <li><a href="/cateList-917.html">Trends <i></i></a></li>
        
        <li><a href="/cateList-934.html">Fashion Bags <i></i></a></li>
        
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

	<!--<div class="wrap link"></div>-->
    <div class="wrap copyright"></div>
</div>

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
