<!doctype html>
<html>
<head>
<title>Sign In</title>
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

<div id="body_box" class="common_top common_account_box account_trackno user_login">
<form action="{:U('Admin/login')}" id="login_form" name="login_form">
    <div class="login_box">
    	<div class="wrap login_box_con">
			<label class="no_pad_top">Your E-mail address<span class="red">*</span> :</label>
			<input class="reg_text" id="login-email-address" type="email" name="email" value=""/>
			<label>Password<span class="red">*</span> :</label>
			<input class="reg_text" id="login-password" type="password" name="password" value=""/>
			<label>Stay signed in :</label>
			<input class="ckb" type="checkbox" name="IsStay" value="1" checked="checked">
			<div class="clear"></div>
			<input type="button" class="common_btn2 login_btn" value="Sign in" />
			 <a href="{:U('Admin/forgetpwd')}" class="forgot_password">Forget your password?</a>
			<div class="otheraccount_login">
			</div>
			<p class="common_or"><span>OR</span></p>
			<input type="button" class="common_btn3" value="Register" onclick="window.location.href='{:U('Admin/register')}'"></button>
        </div>
    </div>
</form>
</div>

<script type="text/javascript">
$('.login_btn').click(function() {
	var email = $("#login-email-address").val();
	var password = $("#login-password").val();

	if(email =='') {
		$.Prompt('please enter login name.');
		return;
	}
	if(password == '') {
		$.Prompt('The password can not be empty.');
		return;
	}
	var _form = $("#login_form");
	$.post(_form.attr('action'), _form.serialize(), function(data){
		//console.log(data);return;
		if(data.status == '1') {
			url = data.url || '{:U('Member/index')}';
			window.location.href = url;
		}else {
			$.Prompt(data.info);
		}
	});
});
</script>

<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
