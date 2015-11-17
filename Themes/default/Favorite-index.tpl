<!doctype html>
<html>
<head>
<title>My Favorites</title>
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

<div id="body_box" class="common_top common_account_box account_favorites">
	<div class="account_box wrap">
		<ul class="ordersummary mywishlist">
		<foreach name="list" item="vo">
		<li>
			<a href="{:build_url($vo,'pro_url')}" class="pic"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}" /></a>
			<div class="product_info">
				<a class="name" href="{:build_url($vo,'pro_url')}">{:build_url($vo,'pro_name')}</a>
				<span class="price"><strong>{:getprice($vo['price'],$vo['pricespe'],false)}</strong></span> 
			</div>
			<span class="close_btn remove" data_id="{$vo.id}"></span>
		</li>
		</foreach>
		</ul>
	</div>
                        
<script>
$('.remove').click(function(){  
	obj = $(this);
	$.post('{:U('Favorite/delfav')}', {id:$(this).attr('data_id')}, function(data){
		$.Prompt(data.info);
		if(data.status == '1') {
			 obj.parent().remove();
		}
	});
});
</script>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
