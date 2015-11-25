<!doctype html>
<html>
<head>
<title>My Messages</title>
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

<div id="body_box" class="common_top common_account_box account_messagedetail">
	<notempty name="info">
    <div class="wrap mymessageview">
    <dl class="common_dl" style="margin-top:0px">
        <dd>
            <p>Message Title:<br><span>{$info.title}</span></p>
            <p>Creation Date:<br><span>{$info.dateline|date="m/d/Y",###}</span></p>
            <p>Content :<br><span>{$info.content}</span></p>
        </dd>
    </dl>
	<notempty name="info.replay">
	<dl class="common_dl">
        <div class="content">
			<div class="time_tit"><span style="color:blue;"> Administrator </span> {$info.dateline|date="m/d/Y",###}</div>
            <div class="line"><span class="arr"></span><span class="inner_arr"></span></div>
            <p>{$info.replay}</p>
		</div>
    </dl>
	</notempty>
	<else />
	<div class="wrap">
		<div class="no_result_top">No Results</div>
		<div class="no_result_bottom"></div>
	</div>
	</notempty>
</div>
</div>
</div>
</div>
<div class="clear15"></div>
<include file="Themes/default/Public/footer.tpl" /> 
</body>
</html>
