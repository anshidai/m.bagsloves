<!doctype html>
<html>
<head>
<title>Jump prompt</title>
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
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <dl>
		<?php if(isset($message)) {?>
		<dt class="success_icon"><p><i></i><?=$message?></p></dt>
		<?php }else{?>
		<dt class="success_icon3"><p><i></i><?=$error?></p></dt>
		<?php }?>
		<dd><a href="<?=$jumpUrl?>">[<u>Click here to return previous page</u>]</a></dd>
		<script>setTimeout("window.location.href='<?=$jumpUrl?>'", <?=$waitSecond? $waitSecond*1000: 3000?>);</script> 
     </dl>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
</div>


<script type="text/javascript">
$(function() {
	function close_dialog() {
		if (window.parent != window.self) {
			//弹出框
			if (window.top != window.parent.self) {
				//左侧弹出框
				window.parent.location.reload();
			} else {
				if (window.top.right != window.self) {
					//全局弹出框
					window.top.right.location.reload();
					window.top.art.dialog({id: ""}).close();
				} else {
					//非弹出框
					window.location.reload();
				}
			}
		} else {
			//非弹出框
			window.location.reload();
		}
	}
});
</script>

<include file="Themes/default/Public/front_footer.tpl" />

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
