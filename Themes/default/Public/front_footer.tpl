
<div id="bottom_box">

<!--
<div class="wrap">
	<div class="searchform_box">
		<form id="autocomplete-submit" class="searchform" action="/m-product-search.html" method="get">
			<input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax2" class="search_input"  value=""/>
			<input type="submit"  value="" id="btn-autocomplete2" class="btn_search" />
		</form>
	</div>
</div>
<script>
$('#autocomplete-ajax2').autocomplete({
	serviceUrl: '/m-product-autocomplete.html',
	onSelect: function(suggestion) {
		var keywords = $('#autocomplete-ajax2').val();
		keywords = encodeURIComponent(suggestion.value);
		window.location.href = "/Search/" + keywords + "/list-r1.html";
	}
});
$('#btn-autocomplete2').click(function() {
	var keywords = $('#autocomplete-ajax2').val();
	if(keywords == ""){
		$.Prompt('Please enter a keyword!');
		return false;
	}
	keywords = encodeURIComponent(suggestion.value);
	$('#autocomplete-submit2').attr('action', '/Search/' + keywords + '/list-r1.html');
});
</script>
-->

<div class="clear15"></div>
<div class="wrap">
	<form class="newletterform">
		<label>Subscribe To Our Newsletter</label>
		<input  name="Newsletter_Email" type="text" value="Your Email Address" id="email"  class="newsletter_txt"/>
		<input name="" type="button" value="Subscribe" class="common_btn1 newsletter_btn" />
	</form>
</div>

<script type="text/javascript">
	$('.newsletter_btn').click(function() {
		if ($('#email').val() == '' || $('#email').val() == 'Your Email Address') {
			$.Prompt('Please Enter Your Email Address!');
			return;
		}
		$isvalidemail = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test($('#email').val());
		if (!$isvalidemail) {
			$.Prompt('Please Enter a valid e-mail address!');
			return;
		}

		$.ajax({
			url: "m-user-newsletter.html",
			type: 'POST',
			data: {
				email: $('#email').val()
			},
			dataType: 'json',
			cache: false,
			success: function(rs) {
				if (rs.status == '1') {
					$.Prompt('Successful');
				} else if (rs.msg) {
					$.Prompt(rs.msg);
				}
			},
			beforeSend: function() {
				createAjaxLoading();
			},
			complete: function() {
				removeAjaxLoading();
			}
		});
	});
	$("#email").click(function() {
		if($(this).val() == "Your Email Address") {
			$(this).val("");
		}
	})
</script>

<div class="clear"></div>

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

</div>