<!doctype html>
<html>
<head>
<title>Leave Message</title>
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

<div id="body_box" class="common_top common_account_box account_leavemessage">
	<form class="message_form" action="{:U('Message/add')}" method="post" id="message_form">
    <div class="wrap mymessageview">
            <p>
                <label style="padding-top:0px">Your Name  <span class="red">*</span></label>
                <input type="text" name="name" value="" class="reg_text">
            </p>
            <input type="hidden" id="email" name="email" value="{$member_Info.email}" class="reg_text">
            <p>
                <label>Title  <span class="red">*</span></label>
                <input type="text" name="title" class="reg_text" value="">
            </p>
            <p>
                <label>Content  <span class="red">*</span></label>
                <textarea name="content" class="remark"></textarea>
            </p>
            <p>
                <label>Code <span class="red">*</span></label>
                <input type="text" name="code" class="codeno" />
                <img id="validateImg" src="{:U('Public/verify')}" height="42" onclick="this.src='/index.php?s=/Public/verify/t/'+new Date().getTime()+'.html'" />
            </p>
            <div class="clear"></div>
            <input type="button" value="Submit" id="save" class="common_btn2" />
    </div>
	</form>
</div>
<script type="text/javascript">
    $('.common_btn2').click(function() {
        var username = $("input[name='name']");
        var email = $("#email");
        var title = $("input[name='title']");
        var content = $("textarea[name='content']");
        var code = $("input[name='code']");
        if(!username.val()) {
            $.Prompt('Please enter your name.');
            return;
        }
        if(!email.val()) {
            $.Prompt('Please enter email.');
            return;
        }
        if(!isEmail(email.val())) {
            $.Prompt('E-mail format error.');
            return;
        }
        if(!title.val()) {
            $.Prompt('Please enter Topic.');
            return;
        }
        if(!content.val()) {
            $.Prompt('Please enter Content.');
            return;
        }
        
        if(!code.val()) {
            $.Prompt('Please enter verification code.');
            return;
        }
		var _form = $("#message_form");
		$.post(_form.attr('action'), _form.serialize(), function(data){
			$.Prompt(data.info);
			if(data.status == '1') {
				window.location.href = "{:U('Message/index')}";
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
