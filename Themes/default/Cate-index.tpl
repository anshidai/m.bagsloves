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
 
<div id="body_box" class="category_list">
    <div class="categories_box">
    <ul class="categories">
        <li class="allcategories"><a href="{:build_url('','cate_all_url')}">All Categories<i></i></a></li>
        <notempty name="catetree">
		<foreach name="catetree" item="vo">
		<li <if condition="$vo['id'] eq $cid">class="actived"</if>>
			<notempty name="vo.sub">
			<a href="{:build_url($vo,'cate_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			<div class="category_son" <if condition="$vo['id'] eq $cid">style="display:block;"</if>>
				<dl>
					<foreach name="vo.sub" item="sub">
					<dd><a href="{:build_url($sub,'cate_list_url')}">{:build_url($sub,'cate_name')} ({$sub.products_total})</a></dd>
					</foreach>
				</dl>
			</div>
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
