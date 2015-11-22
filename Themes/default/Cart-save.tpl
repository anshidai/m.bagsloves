<!doctype html>
<html>
<head>
<title>Shipment</title>
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css"  rel="stylesheet" />
<script type="text/javascript" src="__JS__/jquery.js"></script>
<script type="text/javascript" src="__JS__/reLayout.js"></script>
<script type="text/javascript" src="__JS__/common.js"></script>
<script type="text/javascript" src="__JS__/jq.puzz.js"></script>
<script type="text/javascript" src="__JS__/jquery.prompt.min.js"></script>
<script type="text/javascript" src="__JS__/iscroll.js"></script>
<script type="text/javascript" src="__JS__/gentimer.js"></script>
<script type="text/javascript" src="__JS__/dialog.js"></script>
</head>
<body>
<div id="top_box2">
	<a href="/"><img src="__CSS__/img/order-home-icon.png" class="ordertophomeicon"></a>
	<span class="pic"><img src="__CSS__/img/Shopping-cart_secure_checkout.png"></span>
</div>
<div class="clear"></div>

<div id="body_box_1" class="order_add common_top">
<div class="wrap common_payment_box">
	<div class="progress_bar_box">
    	<div class="progress_bar_bg"><div><span class=""></span></div><div><span></span></div></div>
    	<div class="progress_point"><span class="pointlf on"></span><span class="pointct"></span><span class="pointrt"></span></div>
        <p class="progress_txt"><span class="lf">Cart</span><span class="ct">Shipping&amp;Payment</span><span class="rt">Success</span></p>
    </div>
	<form action="{:U('Cart/check_payment')}" method="post" id="pay_form">
		<dl>
			<dt>Shipping Address</dt>
			<dd>
				<notempty name="address">
					<div class="select">
						<select id="shipping_address_id" name="shipping_address_id">
							<option value="{$memberID}" data_id="{$memberID}" selected="selected">{$member.firstname} {$member.lastname}( {$address.address} &nbsp; {$address.city} &nbsp; {$address.state} &nbsp; <?=$country[$address['country']]['name'];?>&nbsp;{$address.zip} &nbsp;{$address.telphone}&nbsp;&nbsp;{$member.email})</option>
						</select>
					</div>
					<div class="shipping_add">
						<a href="javascript:;" data_id="{$memberID}" class="btn_edit"> Edit Shipping Address</a>
					</div>
				<else />
					<div class="shipping_add">
						<a href="javascript:;" class="btn_new_shipping_address"> Add a New Shipping Address</a>
					</div>
				</notempty>
			</dd>
		</dl>
		<!--<dl>
			<dt>Shipping Method</dt>
			<dd class="shipping_box">
				<ul id="shippinglist" class="shippinglist"></ul>
				<span id="shippingmethodselected">Please Select Shipping Method</span>
				<span id="shipfee" class="order_add_span red"></span>
				<span id="shipdiscout" class="shipdiscout"></span>
				<div id="insurance_box" style="display: none;" class="order_add_span"><input id="insurance" name="insurance" type="checkbox" value="1" /> Add Shipping Insurance <font class="red">US$ <font id="insurance_price" class="red"></font></font></div>
			</dd>
		</dl>-->
		<dl>
			<dt>Payment confirmation</dt>
			<dd class="paymentmethod_box">
				<div class="select">
					<select id="payment_code" name="payment_module_code">
						<option value="">Please Select Payment Method</option>
						<notempty>
						<foreach name="paymentlist" item="vo">
						<option value="{$vo.id}" data_id="{$vo.id}">{$vo.name}</option>
						</foreach>
						</notempty>
					</select>
				</div>
			</dd>
		</dl>
			<dl class="common_leavemessage">
			<dt><div id="message_header"><i></i><span class="plus">+</span> Leave a Message</div></dt>
			<dd>
				  <div id="message_box" style="display: none;">
					<textarea id="order_remark" name="remark"></textarea>
				  </div>
			</dd>
		</dl>
		<dl class="cartsummary">
			<dt>Cart Summary</dt>
			<dd>
				<table>
				<tr>
				<td class="n_images">
					<foreach name="cart_list" item="vo">
					<img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}" width="54" height="54" />
					</foreach>
					</td>
					<td class="n_total" align="right" valign="middle">
					<div class="n_right">
					<span class="span_yd"><a href="{:U('Cart/index')}"> <i class="yd"></i> <i class="yd"></i> <i class="yd"></i></a></span>
					<span class="span_qty"><a href="{:U('Cart/index')}">({$cart_list|count})</a></span>
					<span class="span_jt"><a href="{:U('Cart/index')}"><i class="jt"></i></a></span>
					</div>
				</td>                   
				</tr>
				</table>
			</dd>
		</dl>
		<dl class="cartsummary noborder">
			<dd>
				<p class="totalprice">Items Total <span class="cartsummary_price">{$itemTotal}</span></p>
				<p class="totalprice">+Shipping Price <span class="cartsummary_price">{$Think.session.currency.code}{$shippingPrice}</span></p>
				<p class="totalprice">Sub Total <span class="cartsummary_price">{$cartTotal}</span></p>
				<notempty name="discount.text">
				<p class="totalprice">Promotion Discount <span class="cartsummary_price">{$discount.text}</span></p>
				</notempty>
				<p class="totalprice">Total Amount <span class="cartsummary_price">{$totalAmount}</span></p>
			</dd>
		</dl>
		<input id="totalsaveprice" type="hidden" value="0.00" />
		<input type="button" value="Place Your Order" id="pay_checkout" class="common_btn2 checkout" />
		<div id="order_payment" style="display: none;"></div>
		<div id="newaddressbox" style="display: none"></div>
	</form>
</div>

<div class="popupBoxBg" style="display:none;"></div>
<div class="popupBox" style="display:none;">
<form action="{:U('Address/save')}" method="post" id="address_form">
	<input type="hidden" name="id" value="{$memberID}" />
	<input type="hidden" name="act" value="<notempty name="address">edit<else />add</notempty>" />
	<div class="checkout_box">
		<h3>Shipping address</h3>
		<ul class="newaddress">
			<li>
				<div class="firstname">
					<span class="must">*</span><label>First Name</label><br>
					<input type="text" name="firstname" value="{$member.firstname}" disabled="disabled" style="background-color:#ccc;" />
				</div>
				<div class="lastname">
					<span class="must">*</span><label>Last Name</label><br>
					<input type="text" name="lastname" value="{$member.lastname}" disabled="disabled" style="background-color:#ccc;" />
				</div>
			</li>
			<li>
				<span class="must">*</span><label>E-mail</label><br>
				<input type="text" name="email" value="{$member.email}" disabled="disabled" style="background-color:#ccc;" />
			</li>  
			<li>
				<span class="must">*</span><label>Select Your Country/Region</label><br>
				<div class="select">
					<select id="add_new_shipping_address" name="country" onchange="changeCountryToChangeSate(this.value,'newaddress_state_box')">
						<option value="">Please select </option>
						<foreach name="country" item="vo">
						<option value="{$vo.id}" <if condition="$vo['id'] eq $address['country']">selected="selected"</if>>{$vo.name}</option>
						</foreach>
					</select>
				</div>
			</li>
			<li>
				<span class="must">*</span><label>Province</label><br> 
				<div id="newaddress_state_box"><input type="text" name="state" value="{$address.state}" /></div>
			</li>
			<li>
				<span class="must">*</span><label>City</label><br>
				<input type="text" name="city" value="{$address.city}" />
			</li>
			<li>
				<span class="must">*</span><label>Address</label><br>
				<input type="text" name="address" value="{$address.address}"  />
			</li>                                  
			<li>
				<span class="must">*</span><label>ZIP/Postal Code</label><br>
				<input type="text" name="zip" value="{$address.zip}" />
			</li>
			<li>
				<span class="must">*</span><label>Phone Number</label><br>
				<input type="text" name="telphone" value="{$address.telphone}" />
			</li>
			<li>
				<div class="clear"></div>
				<div class="submit_btn"><a class="common_btn2" href="javascript:;">Sumbit</a></div>
				<div class="cancel_btn"><a class="common_btn1" href="javascript:;">Cancel</a></div>    
				<div class="clear"></div>                 
			</li>
		</ul>
	</div>
</form>
</div>

</div>
<div class="clear15"></div>

<div id="bottom_box">
	<!--<div class="wrap link"></div>-->
	<div class="wrap copyright"></div>
</div>
<script type="text/javascript" src="__JS__/cart_save.js"></script>
<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>
</body>
</html>
