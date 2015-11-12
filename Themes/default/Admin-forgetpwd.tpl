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

<div id="body_box" class="common_top common_account_box account_trackno user_forgetpassword">
    <form id="forgetpwd_form" action="{:U('Admin/forgetpwd')}" method="POST">
    <div class="forget_box">
        <div class="wrap forget_box_con ">
            <p>
            <label class="tips">Enter your email below and proceed.</label>
            </p>
            <p>
            <label>Email Address<span class="red">*</span> :</label>
            <input class="reg_text" type="text" name="email" id="email" />
            </p>
			<p>
            <input type="button" value="Reset Password" class="common_btn2" />
			</p>
        </div>
    </div>
</form>
<script>
    $('.common_btn2').click(function() {
		var email = $('#email').val();
        if(email == ''){
            $.Prompt('Please enter email');
            return false;
        }
		reg_email = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
		if(!reg_email.test(email)) {
			$.Prompt('Please Enter a valid e-mail address.');
			return;
		}
		$("#forgetpwd_form").submit();
    });
</script>
</div>
<div class="clear15"></div>
<div id="bottom_box">
    <div class="wrap copyright"></div>
</div>
</body>
</html>
