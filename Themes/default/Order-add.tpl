<!doctype html>
<html>
<head>
<title>Shipment</title>
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
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
<script type="text/javascript" src="__JS__/order_add.js"></script>
</head>
<body>
<div id="top_box2">
	<a href="/"><img src="__CSS__/img/order-home-icon.png" class="ordertophomeicon"></a>
	<span class="pic"><img src="__CSS__/img/shopping-cart_secure_checkout.png"></span>
</div>
<div class="clear"></div>
		
<div id="body_box_1" class="order_add common_top">
	<div class="wrap common_payment_box">
		<div class="progress_bar_box">
			<div class="progress_bar_bg"><div><span class=""></span></div><div><span></span></div></div>
			<div class="progress_point"><span class="pointlf on"></span><span class="pointct"></span><span class="pointrt"></span></div>
			<p class="progress_txt"><span class="lf">Cart</span><span class="ct">Shipping&amp;Payment</span><span class="rt">Success</span></p>
		</div>
		<!-- progress_bar_box end-->
		
		<dl>
			<dt>Shipping Address</dt>
			<dd>
			<ul class="newaddress">
				<li>
					<div class="firstname">
						<span class="must">*</span><label>First Name</label><br>
						<input type="text" name="first_name" />
					</div>
					<div class="lastname">
						<span class="must">*</span><label>Last Name</label><br>
						<input type="text" name="last_name" />
					</div>
				</li>
				<li>
				   <span class="must">*</span><label>Select Your Country/Region</label><br>
				   <div class="select">
					<select id="first_add_new_address" name="country_id" onchange="changeCountryToChangeSate(this.value,'shipping_state_box')">
						<option value="0">Please select </option>
						<option codes="93" value="1">Afghanistan</option>
						<option codes="358" value="2">Aland Islands</option>
						<option codes="355" value="3">Albania</option>
				   </select>
				   </div>
				</li>
				 <li>
				   <span class="must">*</span><label>Province</label><br>
				   <div id="shipping_state_box"><input type="text" name="state" /></div>
				 </li>
				 <li>
				   <span class="must">*</span><label>City</label><br>
				   <input type="text" name="city" />
				 </li>
				 <li>
				   <span class="must">*</span><label>Address</label><br>
				   <input type="text" name="address" />
				 </li>                                  
				 <li>
				   <span class="must">*</span><label>ZIP/Postal Code</label><br>
				   <input type="text" name="postcode" />
				 </li>
				 <li>
				   <span class="must">*</span><label>Phone Number</label><br>
				   <input type="text" name="mobilephone" />
				 </li>
				 <li>
				   <span class="must">*</span><label>E-mail</label><br>
				   <input type="text" name="email" value="lba8610@163.com" />
				 </li>                                  
				 <li class="no_mar">
				   <input type="hidden" name="address_id" value="0" />
				   <div class="submit_btn no_mar max"><a href="javascript:;">Sumbit</a></div>
				   <div class="clear no_mar"></div> 
				 </li>
			</ul>
			<script>
				$("#first_add_new_address option[value='45']").attr("selected", "selected");
				changeCountryToChangeSate('45','shipping_state_box')
			</script>
				<!--<a href="javascript:;" class="addnewaddress btn_new_shipping_address">Add a new Shipping Address</a>-->
			</dd>
		</dl>
		
		<dl>
			<dt>Shipping Method</dt>
			<dd class="shipping_box">
				<ul id="shippinglist" class="shippinglist">  </ul>
				<span id="shippingmethodselected">Please Select Shipping Method</span>
				<span id="shipfee" class="order_add_span red"></span>
				<span id="shipdiscout" class="shipdiscout"></span>
				<div id="insurance_box" style="display: none;" class="order_add_span">
					<input id="insurance" name="insurance" type="checkbox" value="1" /> Add Shipping Insurance <font class="red">US$ <font id="insurance_price" class="red"></font></font>
				</div>
			</dd>
		</dl>
		
		<dl class="common_code_box creditbox" style="display: none;">
			<dt>
				<div class="code">
					<div class="code_txt">Have a Coupon Code ?<i></i></div>
				</div>
			</dt>
			<dd>
				<p class="price"><font class="red">Total:<span id="total_useful_credit" class="red">0</span></font>   (100 point = US$ 1.00)</p>
				<p>At most <span class="col_red" id="max_exp_credit">0</span> points can be used this time</p>
				<input type="text" name="use_credit" class="credit_input" id="use_credit_text"/>
				<input type="button" class="use_btn" value="use" />
				<div class="credit_save">
				<p>save : <font class="exp_amount red">US$ 0</font></p>
				</div>
				
			</dd>
		</dl>
		
		<dl>
			<dt>Payment Method</dt>
			<dd class="paymentmethod_box">
				<div class="select">
				<select id="payment_id" name="payment_id">
					<option value="">Please Select Payment Method</option>
					<option value="1" data_id="1">Paypal</option>
					<option value="11" data_id="1">Western Union</option>
					<option value="12" data_id="0">MoneyGram</option>
				</select>
				</div>
			</dd>
		</dl>
		
		
		<dl class="common_leavemessage">
			<dt><div id="message_header"><i></i><span class="plus">+</span> Leave a Message</div></dt>
			<dd>
				<div id="message_box" style="display: none;"><textarea id="order_remark" name="order_remark"></textarea></div>
			</dd>
		</dl>
		
		<dl class="cartsummary">
			<dt>Cart Summary</dt>
			<dd>
				<table>
					<tr>
						<td class="n_images">
							<img src="images/index_01.jpg" alt="" width="40" height="54" />
							<img src="images/index_02.jpg" alt="" width="40" height="54" />                     
						</td>
						<td class="n_total" align="right" valign="middle">
							<div class="n_right">
								<span class="span_yd"><a href="{:U('Cart/index')}"> <i class="yd"></i> <i class="yd"></i> <i class="yd"></i></a></span>
								<span class="span_qty"><a href="{:U('Cart/index')}">(2)</a></span>
								<span class="span_jt"><a href="{:U('Cart/index')}"><i class="jt"></i></a></span>
							</div>
						</td>                   
					</tr>
				</table>
			</dd>
		</dl>
		<dl class="cartsummary noborder">
			<dd>
				<p class="totalprice" style="display:none;">Subtotal(2 item) <span class="cartsummary_price">US$ <font id="cart_totalprice">492.10</font></span></p>
				<p class="totalprice">Product Price(2 item) <span class="cartsummary_price">US$ <font id="cart_totalprice">492.10</font></span></p>
				<p class="totalprice">Discount Amount <span class="cartsummary_price">US$ <font id="cart_Preferential_amount">0</font></span></p>
				<p class="totalprice">Shipping charges <span class="cartsummary_price">US$ <font id="shipping_price">0</font></span></p>
				<p class="totalprice">Shipping Insurance <span class="cartsummary_price">US$ <font id="shipping_insurance">0</font></span></p>
				<p class="totalprice">Credits Value <span class="cartsummary_price">US$ <font id="credits_value_amount">0</font></span></p>
				<p class="totalprice">Payment Fee <span class="cartsummary_price">US$ <font id="payment_fee">0</span></font></p>
				<p class="totalprice">Grand Total <span class="cartsummary_price">US$ <font id="order_totalprice">492.10</font></span></p>
			</dd>
		</dl>
		<input id="totalsaveprice" type="hidden" value="0.00" />
		<button class="common_btn2 checkout">Place Your Order</button>
		<div id="order_payment" style="display: none;"></div>
		<div id="newaddressbox" style="display: none"></div>
	</div>
	<!-- common_payment_box end-->

	<iframe id="payiframe" class="payiframe" src=""></iframe>
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
