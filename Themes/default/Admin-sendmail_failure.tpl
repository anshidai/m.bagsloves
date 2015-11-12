<!doctype html>
<html>
<head>
<title>Password Forgotten</title>
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
       
<div class="wrap common_top common_success_box" id="body_box">
<div class="clear15"></div>
<div class="clear15"></div>
<dl>
	<dt class="success_icon3"><p><i></i>{$msg}</p></dt>
	<dd><a href="javascript:history.go(-1);" >[<u>Back to previous page</u>]</a></dd>
	<script>
		setTimeout(function(){
			window.history.go(-1);
		}
		, 3000);
	</script>
</dl>
<div class="clear15"></div>
</div>

<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
