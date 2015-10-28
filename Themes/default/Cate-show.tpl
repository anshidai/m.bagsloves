<!doctype html>
<html>
<head>
<title>Women's Dresses - m1736.newdemo.zhcart.com</title>
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css"  rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="font_icon/style.css">
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
<div class="topcategorieswrap">
            <div class="topcategorieswrapbg"></div>
        	<ul class="topcategories">
                <li class="allcategories"><a href="{:build_url('','cate_all_url')}">All Categories<i></i></a></li>
				<notempty name="catetree">
				<foreach name="catetree" item="vo">
				<li <if condition="$vo['id'] eq $cid">class="actived"</if>>
					<a href="{:build_url($vo,'cate_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
					<notempty name="vo.sub">
					<div class="category_son" <if condition="$vo['id'] eq $cid">style="display:block;"</if>>
						<dl>
							<foreach name="vo.sub" item="sub">
							<dd><a href="{:build_url($sub,'cate_url')}">{:build_url($sub,'cate_name')}</a></dd>
							</foreach>
						</dl>
					</div>
					</notempty>
				</li>
				</foreach>
				</notempty>
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
       

<div id="body_box" class="category_list">
    <div class="categories_box">
    <ul class="categories">
        <li class="allcategories"><a href="{:build_url('','cate_all_url')}">All Categories<i></i></a></li>
        <notempty name="catetree">
		<foreach name="catetree" item="vo">
		<li <if condition="$vo['id'] eq $cid">class="actived"</if>>
			<a href="{:build_url($vo,'cate_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			<notempty name="vo.sub">
			<div class="category_son" <if condition="$vo['id'] eq $cid">style="display:block;"</if>>
				<dl>
					<foreach name="vo.sub" item="sub">
					<dd><a href="{:build_url($sub,'cate_url')}">{:build_url($sub,'cate_name')}</a></dd>
					</foreach>
				</dl>
			</div>
			</notempty>
		</li>
		</foreach>
		</notempty>
    </ul>
</div>
<script>
function showsubcate(obj)
{
  $(obj).parent().siblings().find('ul.subcate').hide();
  $(obj).parent().siblings().find('a span').removeClass('down');
  $(obj).siblings('ul.subcate').toggle(); if($(obj).find('span').hasClass('down')){$(obj).find('span').removeClass('down')}else{$(obj).find('span').addClass('down')}
}
</script>
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
