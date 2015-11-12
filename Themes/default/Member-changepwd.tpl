<!doctype html>
<html>
<head>
<title>Security Setting</title>
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

<div id="body_box" class="common_top common_account_box account_changepwd">
    <div class="forget_box">
    <div class="wrap password_box_con ">
		<form name="changepwd_form" id="changepwd_form" action="{:U('Member/changepwd')}">
			<label class="no_pad_top">Old Password<span class="red"></span>:</label>
			<input class="reg_text" type="password" id="oldpassword" name="oldpassword" />
			
			<label class="no_pad_top">New Password<span class="red"></span>:</label>
			<input class="reg_text" type="password" id="newpassword" name="newpassword" />
			
			<label>Confirm Password<span class="red"></span>:</label>
			<input class="reg_text" type="password" id="repassword" name="repassword" />
			
			<input type="button" value="Submit" class="common_btn2" />
		</form>
    </div>
</div>
<script type="text/javascript">
    $('.common_btn2').click(function(){
        var oldpassword = $("#oldpassword").val();
        var newpassword = $("#newpassword").val();
        var repassword = $("#repassword").val();

        if(oldpassword != '') {
            $.Prompt('Please enter old password.');
            return;
        }
		if(newpassword !='' || repassword !='') {
			$.Prompt('Please enter new password.');
            return;
		}
        if(newpassword != repassword) {
            $.Prompt('Please enter the same password.');
            return;
        }
		
		var _form = $("#changepwd_form");
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
