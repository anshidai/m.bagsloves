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
</head>
<body>
<include file="Themes/default/Public/header.tpl" />     

<div id="body_box" class="account_index common_top common_account_box">
    	<div class="wrap myaccount">
    	<ul class="no_mar_top">
        	<li class="last"><a href="/m-account-orders.html">My Orders<i></i></a></li>
        </ul>
        <ul>
        	<li><a href="/m-account-profile.html">My Profile<i></i></a></li>
            <li><a href="{:U('Member/changepwd')}">Change Password<i></i></a></li>
            <li class="last"><a href="/m-account-newsletter.html">Newsletter Subscription<i></i></a></li>
        </ul>
        <ul>
        	<li><a href="/m-cart-list.html">My Shopping Cart<i></i></a></li>
            <li><a href="/m-account-address.html">My Address Books<i></i></a></li>
            <li><a href="/m-account-billingAddress.html">My  Billing Address<i></i></a></li>
            <li class="last"><a href="/m-account-mymessage.html">My Message<i></i></a></li>
        </ul>
        <ul>
        	<li><a href="/m-account-favorites.html">My Wishlist<i></i></a></li>
            <li class="last"><a href="/m-history-list.html">Recently Viewed<i></i></a></li>
        </ul>
        <ul>
        	<li><a href="/m-account-creditList.html">My Credit<i></i></a></li>
            <li><a href="/m-account-couponList.html">My Coupon Codes<i></i></a></li>
            <li><a href="/m-account-growthList.html">My Growth<i></i></a></li>
            <li class="last"><a href="/m-account-comments.html">My Comments<i></i></a></li>
        </ul>
        <div class="clear15"></div>
        <button class="common_btn2" onclick="window.location.href='{:U('Admin/loginout')}'">Log Out</button>
    </div>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
