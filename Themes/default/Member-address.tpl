<!doctype html>
<html>
<head>
<title>My Address</title>
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

<div id="body_box" class="common_top common_account_box account_address">
    <div class="wrap">
    <button class="common_btn2" onclick="window.location.href='{:U('Member/address', array('act'=>'edit'))}'">Edit Shipping Address</button>
</div>

<notempty name="address">
<div class="wrap myaddressbooks">
        <dl>
        <dd>
            <p>{$member.firstname} {$member.lastname}<br>
            {$address.address}<br>
            {$address.region}<br>
            </p>
            <!--<span class="close_btn" data_id="{$address.id}"></span>-->
        </dd>
    </dl>
    </div>
</notempty>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
