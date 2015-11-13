<!doctype html>
<html>
<head>
<title>Shopcart</title>
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
 
<div id="body_box" class="cart_empty common_top">

	<if condition="$act eq 'cart'">
		<div class="common_shoppingcart_box">
			<div class="shoppingcart_null">
				<img src="__CSS__/img/shopping-cart.png">
				<p>This cart is empty! time to go shopping.</p>	
				<a href="/" class="common_btn2">Shopping Now</a>
			</div>
		</div>
	<else />
		<div class="wrap">
			<div class="no_result_top">No Results</div>
			<div class="no_result_bottom"></div>
		</div>
	</if>
</div>

<div class="clear15"></div>
<div id="bottom_box">
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
