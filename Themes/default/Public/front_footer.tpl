<div class="wrap currency_box">
	<p>Change Currency</p>
	<div class="select">
		<select id="cursel" class="text-arrow-bg changegourl">
			<option value="/index.php?m=home&c=Changecurrency&a=&currency=USD" selected="selected">Dollar</option>
		</select>
	</div>
	<script>
		$(".changegourl").change(function() {
			if($(this).attr("value") != ""){
				window.location.href = $(this).attr("value");
			}
		});
	</script>
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