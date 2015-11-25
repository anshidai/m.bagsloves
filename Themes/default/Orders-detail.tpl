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

</style>
</head>
<body>
<include file="Themes/default/Public/header.tpl" /> 

<div id="body_box" class="common_top common_shoppingcart_box">
	<div class="account_box wrap">
		<ul class="common_bor_wrap bor_top">
			<li class="totalprice">
				<dl>
					<dt>Order Number:</dt>
					<dd>{$shippingInfo.sn}</dd>
				</dl>
				<dl>
					<dt>Order Date:</dt>
					<dd>{$shippingInfo.dateline|date="m/d/Y",###}</dd>
				</dl>
				<dl>
					<dt>Order Status:</dt>
					<dd><strong>{:get_orders_status_tips($shippingInfo['orders_status'])}</strong></dd>
				</dl>
				<dl>
					<dt>Shipped To:</dt>
					<dd><strong>{$shippingInfo.delivery_firstname} {$shippingInfo.delivery_lastname}</strong>
					({$shippingInfo.delivery_address} &nbsp; {$shippingInfo.delivery_city} &nbsp; {$shippingInfo.delivery_state} &nbsp; {$shippingInfo.delivery_country}&nbsp; {$shippingInfo.delivery_zip})
					</dd>
				</dl>
				<dl>
					<dt>Phone:</dt>
					<dd>{$shippingInfo.delivery_telephone}</dd>
				</dl>
				<dl>
					<dt>Email:</dt>
					<dd>{$shippingInfo.delivery_email}</dd>
				</dl>
				<dl>
					<dt>Payment Method:</dt>
					<dd>{$shippingInfo.payment_module_code}</dd>
				</dl>
				<if condition="$shippingInfo['orders_status'] eq '1'">
				<dl>
					<dt><a id="close_order" data-id="{$shippingInfo.id}" style="font-size:13px;color:#FF6600" href="javascript:;">Delete this order</a></dt>
				</dl>
				</if>
			</li>
			<foreach name="orders_products_list" item="vo">
			<li class="cart_pro">
                <a href="javascript:void(0)" class="pic"><img src="{:build_url($vo['product'],'pro_smallimage')}" alt="{$vo.products_name}"></a>
                <div class="name"><a class="product_name" href="{:build_url($vo['product'],'pro_url')}">{$vo.products_name}</a></div>
                <div class="price" data_subtotal="{$shippingInfo.currencies_code}{$vo['products_total']}">{$shippingInfo.currencies_code}{$vo['products_total']}</div>
                <div class="styles">
					<foreach name="vo.products_model" item="attr">
					<span>{$attr.name}: {$attr.value}</span><br>
					</foreach>
				</div>
				<dl class="quantityform_box">
					<dt>x {$vo.products_quantity}</dt>
                </dl>
				<div class="clearboth"></div>
            </li>
			</foreach>
			<li class="totalprice">
				<dl>
					<dt>Items Total :</dt>
					<dd><span style="color:#000;font-size:18px;font-weight:bold;">1</span></dd>
				</dl>
				<dl>
					<dt>Shipping Price :</dt>
					<dd class="price"><span id="cart_totalprice"><strong style='font-weight: bold;'>{$shippingInfo.currencies_code}{$shippingInfo.shippingmoney}</strong></span></dd>
				</dl>
				<dl>
					<dt>Total Amount :</dt>
					<dd class="price"><span class="cart_total"><span id="order_totalprice"><strong style='font-weight: bold;'>{$shippingInfo.currencies_code}{$shippingInfo.orders_total}</strong></span></span></dd>
				</dl>
			</li>
		</ul>
		<if condition="$shippingInfo['orders_status'] eq '1'">
		<input type="button" value="Pay It" id="save" class="common_btn2" onclick="javascript:window.location.href='{:U('Cart/pment', array('id'=>$shippingInfo['id']))}'" />
		<elseif condition="$shippingInfo['orders_status'] eq '3'" />
		<input type="button" value="Confirm receipt" id="save" class="common_btn2 ajax_pay_url" data-id="{$shippingInfo.id}" />
		</if>
	</div>
</div>
<div class="clear15"></div>
<script type="text/javascript">
$("#close_order").click(function(){
	$.post('{:U('Orders/del')}', {id: $(this).attr('data-id')}, function(data){
		$.Prompt(data.info);
		if(data.status == '1') {
			var url = data.url || '{:U('Orders/index')}';
			window.location.href = url;
		}
	});
});

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
