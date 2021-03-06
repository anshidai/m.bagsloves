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
.common_account_box .mymessageview td i{background:0 none;}
.common_account_box .mymessageview input[type="text"], .common_account_box .mymessageview input[type="password"]{height:30px;line-height:30px;}
</style>
</head>
<body>
<include file="Themes/default/Public/header.tpl" />

<div id="body_box" class="common_top common_account_box">
	<div class="wrap mymessageview">
		<div class="payment">
			<fieldset>
			<!-- remark-->
			{$remark}
			<!--form-->
			{$content}
			</fieldset>
		</div>
	</div>
</div>
</div>
</div>
<div class="clear15"></div>
<include file="Themes/default/Public/footer.tpl" /> 
</body>
</html>