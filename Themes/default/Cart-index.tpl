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

<div id="body_box" class="cart_list">
<form action="{:U('Cart/save')}" method="post" id="cart_checkout_form">
    <div class="wrap common_shoppingcart_box">
        <ul class="common_bor_wrap bor_top">
			<foreach name="list" item="vo">
			<li class="cart_pro">
				<span class="close_btn remove" data_id="{$vo.id}"></span>
                <a href="javascript:void(0)" class="pic"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}" /></a>
                <div class="name"><a class="product_name" href="{:build_url($vo,'products_id')}">{:build_url($vo,'pro_name')}</a></div>
                <div class="price" data_subtotal="{$vo.pricespe_total}">{:getprice($vo['price_total'],$vo['pricespe_total'],false)}</div>
                <div class="styles">
				<notempty name="vo.model">
				<foreach name="vo.model" item="attr">
					<span>{$attr.name} - {$attr.value}</span><br />
				</foreach>
				</notempty>
				</div>
				<dl class="quantityform_box">
					<dt>QTY</dt>
                    <dd>
                        <div class="quantityform">
                            <a href="javascript:;" class="reduce minus"></a>
                            <input name="quantity" class="num" type="text" value="{$vo.count}" data_id="{$vo.id}" />
                            <a href="javascript:;" class="plus"></a>
                        </div>
                    </dd>
                </dl>
				<div class="clearboth"></div>
            </li>
			</foreach>
			
            <li class="totalprice">
				<dl>
                    <dt>Items Total :</dt>
                    <dd><span style="color:#000;font-size:18px;font-weight:bold;">{$itemTotal}</span></dd>
                </dl>
				<dl>
					<dt>+Shipping Price :</dt>
					<dd><span class="fbold">{$Think.session.currency.code}{$shippingPrice}</span></dd>
				</dl>
				<dl>
                    <dt>Sub Total :</dt>
                    <dd class="price"><span id="cart_totalprice">{$cartTotal}</span></dd>
                </dl>
				<notempty name="discount.text">
                <dl>
                    <dt>Promotion Discount :</dt>
                    <dd class="price"><span id="cart_promotionsave_amount">{$discount.text}</span></dd>
                </dl>
				</notempty>
                <dl>
                    <dt>Total Amount :</dt>
                    <dd class="price"><span class="cart_total"><span id="order_totalprice">{$totalAmount}</span></span></dd>
                </dl>
				<gt name="free_shipping" value="0">
				<dl>
					<dt>
						For your whole order:  If <span class="fbold" style="color:#f00;">{$Think.session.currency.code}0 - {$Think.session.currency.code}{$free_shipping}</span>, Shipping fee is <span class="fbold" style="color:#f00;">{$Think.session.currency.code}15</span>; If over <span class="fbold" style="color:#f00;">{$Think.session.currency.code}{$free_shipping}</span>, free shipping
					</dt>
				</dl>
				</gt>
                <div class="checkout_box_btns">
					<div class="clear"></div>
					<input id="totalsaveprice" type="hidden" value="{$totalAmount}" />
					<button class="common_btn2" id="cart_checkout">Checkout </button>
				</div>
            </li>
        </ul>
    </div>
</form>

<script type="text/javascript">
	$('a.plus').click(function() {
		var qtyobj = $(this).siblings('input.num');
		var qty = parseInt(qtyobj.val()) + 1;
		$.post('{:U('Cart/changeNum')}', {id:qtyobj.attr('data_id'), count:qty}, function(data){
			if(data.status == '1') {
				qtyobj.val(qty);
				window.location.reload();
			}else {
				$.Prompt(data.info);
			}
		});
	});
	$('a.minus').click(function() {
		var qtyobj = $(this).siblings('input.num');
		var qty = parseInt(qtyobj.val()) - 1;
		if (qty > 0) {
			$.post('{:U('Cart/changeNum')}', {id:qtyobj.attr('data_id'), count:qty}, function(data){
				if(data.status == '1') {
					qtyobj.val(qty);
					window.location.reload();
				}else {
					$.Prompt(data.info);
				}
			});
		}
	});
	$('input.num').bind('blur', function() {
		var _this = $(this);
		var _val = this.defaultValue;
		var qty = parseInt(_this.val());
		if (qty != _val) {
			$.post('{:U('Cart/changeNum')}', {id:_this.attr('data_id'), count:qty}, function(data){
				if(data.status == '1') {
					qtyobj.val(qty);
					window.location.reload();
				}else {
					$.Prompt(data.info);
				}
			});
		}
	});

	$('.remove').live('click', function() {
		var _this = $(this);
		var id = _this.attr('data_id');
		$.get('{:U('Cart/delcart')}', {id: id}, function(data){
			if(data.status == '1') {
				window.location.reload();
			}else {
				$.Prompt(data.info);
			}
		});
	});
	$('#cart_checkout').click(function() {
		var _form = $('#cart_checkout_form');
		var user_id = '{$memberID}';
		if(user_id > 0) {
			_form.submit();
		} else {
			var referer = encodeURIComponent(location.protocol + '//' + window.location.host + '{:U('Cart/index')}')
			window.location.href = '{:U('Admin/login')}?referer=' + referer;
		}
	});
</script>
</div>
<div class="clear15"></div>
<div id="bottom_box">
<!--    <div class="wrap link">
        
         
    </div>-->
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
