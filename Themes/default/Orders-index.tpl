<!doctype html>
<html>
<head>
<title>My Orders</title>
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
<style type="text/css">
.orderlist li{min-height:auto!important;margin:5px 0;}
.orderlist .sn{color:#000;font-weight:bold;}
.orderlist .sn b{color:#f00;}
.orderlist .pay_status{margin-left:30px;}
.orderlist .pay_time{margin-left:20px;color:#ccc;}
</style>
</head>
<body>
<include file="Themes/default/Public/header.tpl" /> 

<div id="body_box" class="common_top common_account_box account_favorites">
	<div class="account_box wrap">
		<notempty name="list">
		<ul class="ordersummary orderlist">
		<foreach name="list" item="vo">
		<li>
			<a href="{:U('Orders/detail', array('sn'=>$vo['sn']))}"><span class="sn"><b>No.</b>{$vo.sn}<span></a>
			<span class="pay_status">{$vo.orders_status}</span>
			<span class="pay_time">{$vo.dateline|date="m/d/Y",###}</span> 
		</li>
		</foreach>
		</ul>
		</notempty>
	</div>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
