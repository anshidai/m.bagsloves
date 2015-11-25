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
.orderlist .pay_url{margin-left:20px; text-decoration:underline;}
.orderlist .pay_url a{color:#006699;}
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
			<span class="pay_status">{:get_orders_status_tips($vo['orders_status'])}</span>
			<span class="pay_time">{$vo.dateline|date="m/d/Y",###}</span>
			<if condition="$vo['orders_status'] eq '1'">
			<span class="pay_url"><a href="{:U('Cart/pment', array('id'=>$vo['id']))}">Pay It</a></span>
			<elseif condition="$vo['orders_status'] eq '3'" />
			<span class="pay_url"><a class="ajax_pay_url" href="javascript:;" data-id="{$vo.id}">Confirm receipt</a></span>
			</if>
		</li>
		</foreach>
		</ul>
		</notempty>
	</div>
</div>
<div class="clear15"></div>

<script type="text/javascript">
$(".ajax_pay_url").click(function(){
	$.post('{:U('Orders/confirm')}', {id: $(this).attr('data-id')}, function(data){
		$.Prompt(data.info);
		if(data.status == '1') {
			var url = data.url || '{:U('Orders/index')}';
			window.location.href = url;
		}
	});
});

</script>
<include file="Themes/default/Public/footer.tpl" /> 
</body>
</html>
