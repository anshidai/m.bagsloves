<!doctype html>
<html>
<head>
<title>Register</title>
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

<div id="body_box" class="common_top common_account_box account_trackno user_register">
<form name="register_form" id="register_form" action="{:U('Admin/register')}">
    <div class="reg_box">
    <div class="wrap reg_box_con">
		<label class="no_pad_top">First Name<span class="red">*</span> :</label>
        <input id="firstname" class="reg_text" name="firstname"/>
		<label>Last Name<span class="red">*</span> :</label>
        <input id="lastname" class="reg_text" name="lastname"/>
        <label>E-mail address<span class="red">*</span> :</label>
        <input id="email-address" class="reg_text" name="email"/>
        <label>Create a password<span class="red">*</span> :</label>
        <input id="password-new" class="reg_text" name="password" type="password"/>
        <label>Confirm Password<span class="red">*</span> :</label>
        <input id="password-confirm" class="reg_text" name="repassword" type="password"/>
        <div class="clear15"></div>
        <input type="button" class="common_btn3" value="Register" />
        <p class="common_or"><span>OR</span></p>
        <input type="button" class="common_btn2" value="Sign in" onclick="window.location.href='{:U('Admin/login')}'" />
    </div>
</form>
</div>
<script type="text/javascript">
$('.common_btn3').click(function() {
	var firstname = $("#firstname").val(),
		lastname = $("#lastname").val(),
		email = $("#email-address").val(),
		password = $("#password-new").val(),
		password_confirm = $("#password-confirm").val();
	
	if(firstname == '') {
		$.Prompt('Please enter First Name.');
        return;
	}
	if(lastname == '') {
		$.Prompt('Please enter Last Name.');
        return;
	}
	if(email == '') {
		$.Prompt('Email format is not correct.');
        return;
	}
	if(password == '' || password.length<6 || password.length>20) {
		$.Prompt('Please enter password (6-20 characters)');
        return;
	}
	if(password !== password_confirm) {
		$.Prompt('Two passwords do not match, please try again.');
        return;
	}
	reg_email = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
	if(!reg_email.test(email)) {
		$.Prompt('Please Enter a valid e-mail address.');
		return;
	}
	
	var _form = $("#register_form");
	$.post(_form.attr('action'), _form.serialize(), function(data){
		//console.log(data)
		if(data.status == '1') {
			url = data.url | '{:U('Member/index')}';
			window.location.href = url;
		}else {
			$.Prompt(data.info);
		}
	});
});

</script>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
