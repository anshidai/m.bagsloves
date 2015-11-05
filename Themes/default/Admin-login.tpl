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
<link rel="stylesheet" type="text/css" href="__SKIN__font_icon/style.css">
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
    <div class="login_box">
    	<div class="wrap login_box_con">
			<label class="no_pad_top">Your E-mail address<span class="red">*</span> :</label>
			<input class="reg_text"  id="user_name" type="email" name="name" value=""/>
			<label>Password<span class="red">*</span> :</label>
			<input class="reg_text" id="user_pwd" type="password" name="password" value=""/>
			<div class="clear"></div>
			<button class="common_btn2 login_btn">Sign in</button>
			 <a href="/m-user-forgetpassword.html" class="forgot_password">Forget your password?</a>
			<div class="otheraccount_login">
				
			</div>
			<p class="common_or"><span>OR</span></p>
			<button class="common_btn3" onclick="window.location.href='/m-user-register.html?ref=%2Fm-account-index.html'">Register</button>
        </div>
    </div>
<script type="text/javascript">
$('.login_btn').click(function(){
	if($('#user_name').val()=='' || $('#user_name').val()=='Email Address') {
		$.Prompt('please enter login name.');
		return;
	}
	if($('#user_pwd').val()=='' || $('#user_pwd').val()=='Password') {
		$.Prompt('The password can not be empty.');
		return;
	}
	$.ajax({
		url:"m-user-login.html",
		type: 'POST',
		data:{
			name   : $('#user_name').val(),
			password   : $('#user_pwd').val(),
			ajax : 1,
			ref :"/m-account-index.html"
		},
		dataType:'json',
		cache:false,
		success:function(rs){
			if(rs.status == '1'){
				if(rs.ref)
				{    
					window.location.href=rs.ref;
				}
				else
				{
					window.location.href="m-account-index.html";
				}
			}else if(rs.msg){
				$.Prompt(rs.msg);
			}
		},
			beforeSend: function(){
				createAjaxLoading();
			},
			complete: function(){
				removeAjaxLoading();
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
