<div class="wrap currency_box">
	<form name="currencies_form" id="form1" action="{:U('Index/currencies')}" method="post">
	<p>Change Currency</p>
	<div class="select">
		<select id="cursel" name="currencies" class="text-arrow-bg changegourl" onchange="document.currencies_form.submit();">
			<option value="">Please select...</option>
			<foreach name="currencies" item="vo">
			<option value="{$vo.symbol}" <eq name="Think.session.currency.symbol" value="$vo['symbol']">selected='selected'</eq>>{$vo.name}</option>
			</foreach>
		</select>
	</div>
	</form>
</div>
<div class="clear"></div>
<div class="wrap menber_center">
	<dl>
	<dd>
		<a href="/m-user-login.html" class="menber"><i></i>My Account</a>
		<a href="/m-cart-list.html" class="shopcart"><i></i>Shopping Cart</a>
		<a href="/m-account-orders.html" class="myorder"><i></i>My Order</a>
		<a href="/m-account-trackingOrder.html" class="tracking"><i></i>Tracking Order</a>
		<a href="/m-account-favorites.html" class="myfavorites"><i></i>My Favorites</a>
		<a href="/m-history-list.html" class="recently"><i></i>Recently Viewed</a>
		<a href="/m-navpage-help.html" class="none help"><i></i>Help Center</a>
		</dd>
	</dl>
</div>
<div class="clear"></div>

<!--<div class="wrap link"></div>-->
<div class="wrap copyright"></div>