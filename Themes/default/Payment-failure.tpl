<!doctype html>
<html>
<head>
<title>Account Center</title>
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
.payment-block dd.c-red{color:#f00;}
.payment-block dd.c-blue{color:#288f00;}
.tips-txt p{margin-bottom:8px;}
.tips-txt .tit{font-weight:bold;}
.tips-txt .cred{color:#f00;}
.tips-txt .contact{margin-top:12px;}
</style>
</head>
<body>
<include file="Themes/default/Public/header.tpl" />

<div id="body_box" class="common_top common_shoppingcart_box">
	<div class="wrap account_box payment-block">
		<ul class="common_bor_wrap bor_top">
			<li class="totalprice">
				<dl>
					<dt>transaction date:</dt>
					<dd><?=date('m/d/Y H:i:s')?></dd>
				</dl>
				<dl>
					<dt>order number:</dt>
					<dd>{$orderinfo.sn}</dd>
				</dl>
				<dl>
					<dt>sum:</dt>
					<dd>{$orderinfo.currencies_code} {$orderinfo.orders_total}</dd>
				</dl>
				<dl>
					<dt>product link:</dt>
					<dd>
						<foreach name="order_product_info" item="vo">
							<a href="{:build_url($vo, 'products_id')}">{$vo.products_name}</a><br>
						</foreach>
					</dd>
				</dl>
			</li>
		</ul>
		
		<div class="clear15"></div>
		<div class="common_success_box">
			<dl>
				<dt class="success_icon3"><p><i></i>{$error_msg}</p></dt>
				<dd>
					<a href="{:U('Orders/index')}">[Back to payment page]</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="{:U('Orders/index')}">[<u>Back to Shopping Cart</u>]</a></dd>
			</dl>
		</div>
		
		<div class="tips-txt">
			<p class="tit">Sorry, your payment was failed, the reason may be as followed:</p><br>
			<p class="cred">Error return : orderInfo</p>
			<p class="cred">Error return explaination: orderInfo</p><br>
			<p class="tit">If you want to continue the transaction, we suggest you:</p>
			<p class="cred">1.contact the issuing bank to prove that the transaction was done by yourself.</p>
			<p class="cred">2.try another credit card.</p>
			<p class="contact">For further questions, please contact : service@bagsloves.com</p><br>
		</div>
		
	</div>
</div>
</div>
</div>
<div class="clear15"></div>
<include file="Themes/default/Public/footer.tpl" /> 
</body>
</html>