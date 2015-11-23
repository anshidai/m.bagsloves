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
					<dd>{$shippingInfo}</dd>
				</dl>
				<dl>
					<dt>Order Date:</dt>
					<dd>{$shippingInfo.dateline|date="m/d/Y",###}</dd>
				</dl>
				<dl>
					<dt>Order Status:</dt>
					<dd><strong>Awaiting Payment</strong></dd>
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
					<dd>Scoinpay<br><a class="order_btn edit_pay_btn" href="javascript:;">Edit payment method</a></dd>
				</dl>
				<dl>
					<dt><a class="order_btn" href="">Delete this order</a></dt>
				</dl>
			</li>
			<li class="cart_pro">
                <a href="javascript:void(0)" class="pic"><img src="http://www.bagsloves.com/Public/Uploads/Products/20151013/thumb_1a723fe46cafb.jpg" alt="Michael Kors Perforated Logo Large Vanilla Totes"></a>
                <div class="name"><a class="product_name" href="/index.php?s=/products/detail/pid/636.html">Michael Kors Perforated Logo Large Vanilla Totes</a></div>
                <div class="price" data_subtotal="74.99">$74.99</div>
                <div class="styles">
				<span>Size - 13x 14 x 6 1/4</span><br><span>Colors - Vanilla</span><br></div>
				<dl class="quantityform_box">
					<dt>X 1</dt>
                </dl>
				<div class="clearboth"></div>
            </li>
			<li class="totalprice">
				<dl>
					<dt>Items Total :</dt>
					<dd><span style="color:#000;font-size:18px;font-weight:bold;">1</span></dd>
				</dl>
				<dl>
					<dt>Sub Total :</dt>
					<dd class="price"><span id="cart_totalprice"><strong style='font-weight: bold;'>$74.99</strong></span></dd>
				</dl>
				<dl>
					<dt>Total Amount :</dt>
					<dd class="price"><span class="cart_total"><span id="order_totalprice"><strong style='font-weight: bold;'>$89.99</strong></span></span></dd>
				</dl>
			</li>
		</ul>
	</div>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
