<!doctype html>
<html>
<head>
<title>History Viewed</title>
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css" rel="stylesheet" />
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

<div id="body_box" class="common_account_box history_list">
    <div class="wrap">
	<notempty name="list">
	<button class="common_btn2" onclick="window.location.href='{:U('History/clear')}'">Clear History</button>
		<div class="clear"></div>
	</div>
	<ul class="common_pro_list1 wrap" id="product_list">
		<foreach name="list" item="vo">
		<li>
			<a class="pic" href="{:build_url($vo,'pro_url')}"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}"></a>
			<a class="name" href="{:build_url($vo,'pro_url')}">{:build_url($vo,'pro_name')}</a>
			<div class="price">
				<span>{:getprice($vo['price'],$vo['pricespe'],false)}</span>
				<span> </span>
				<span class="oldprice">{:getprice_str($vo['price'])}</span>
			</div>
		</li>
		<div class="select_content" id="skucontent{$vo.id}"  goods_id="{$vo.id}" style="display:none">
			<div class="checkmain"></div>
		</div>
		</foreach>
		</ul>
	<else />
	<div class="searchnoitems">Sorry, No Results.</div>
	</notempty>
<div class="clear10"></div>
<script type="text/javascript">
    $(window).resize(function() {
        reLayout("#hot_products", 200, 200);
        reLayout("#new_products", 200, 200);
    });
    reLayout("#hot_products", 200, 200);
    reLayout("#new_products", 200, 200);
</script>
</div>

<include file="Themes/default/Public/front_footer.tpl" />

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
