<!doctype html>
<html>
<head>
<title>My Address</title>
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

<div id="body_box" class="common_top common_account_box account_editaddress">
	<form action="{:U('Address/save')}" method="post" id="address_form">
	<input type="hidden" name="id" value="{$memberID}" />
	<input type="hidden" name="act" value="<notempty name="address">edit<else />add</notempty>" />
	<div class="wrap myprofile_box">
            <p>
                <label class="no_pad_top">First Name </label>
                <input type="text" name="firstname" value="{$member.firstname}" class="reg_text" disabled="disabled" style="background-color:#ccc;">
            </p>
            <p>
                <label>Last Name  </label>
                <input type="text" name="lastname" value="{$member.lastname}" class="reg_text" disabled="disabled" style="background-color:#ccc;">
            </p>
			<p>
                <label>E-mail</label>
                <input type="text" name="email" value="{$member.email}" class="reg_text" disabled="disabled" style="background-color:#ccc;">
            </p> 
            <p>
                <label>Select Your Country/Region   <span class="red">*</span></label>
                <div class="select_city">
                    <div class="select">
                    <select name="country" onchange="changeCountryToChangeSate(this.value,'profileaddress_box')">
                        <option>Please Select Country</option>
						<foreach name="country" item="vo">
						<option value="{$vo.id}" <if condition="$vo['id'] eq $address['country']">selected="selected"</if>>{$vo.name}</option>
						</foreach>
                    </select>
                    </div>
                </div>
            </p>
            <p>
                <label>State/Province   <span class="red">*</span></label>
                <div id="profileaddress_box"><input type="text" name="state" class="reg_text" value="{$address.state}"/></div>
            </p>
            <p>
                <label>City   <span class="red">*</span></label>
                <input type="text" name="city" value="{$address.city}" class="reg_text">
            </p>
            <p>
                <label>Address  <span class="red">*</span></label>
                <input type="text" name="address" value="{$address.address}"  class="reg_text">
            </p>                        
             <p>
                <label>ZIP/Postal Code    <span class="red">*</span></label>
                <input type="text" name="zip" value="{$address.zip}"  class="reg_text">
            </p>
            <p>
                <label>Mobilephone  <span class="red">*</span></label>
                <input type="text" name="telphone" value="{$address.telphone}"  class="reg_text">
            </p>
            <!--<p>
                <label></label>
                <input class="common_che_box" type="checkbox" name="is_master" id="is_master" value="1" />Save as a default shipping address
            </p>-->
            <input type="button" value="Submit" id="save" class="common_btn2" />
    </div>
	</form>
<script type="text/javascript">
    $('#save').click(function(){
        var telphone = $("input[name='telphone']").val();
        var address = $("input[name='address']").val();
        var city = $("input[name='city']").val();
        var state = $("input[name='state']").val();
        
		/*
		if(state == '') {
           state = $('select[name="state"]');
		}
		*/
        var country=$("select[name='country']").val();
        var zip = $("input[name='zip']").val();
        if(!country) {
            $.Prompt('Please enter country');
            return;
        }
        if(!state) {
            $.Prompt('Please enter state/provice');
            return;
        }
        if(!city) {
            $.Prompt('Please enter city');
            return;
        }
        if(!address) {
            $.Prompt('Please enter address');
            return;
        }
        if(!zip) {
            $.Prompt('Please enter postcode');
            return;
        }  
        if(!telphone) {
            $.Prompt('Please enter mobilephone');
            return;
        }

		var _form = $("#address_form");
		$.post(_form.attr('action'), _form.serialize(), function(data){
			$.Prompt(data.info);
			if(data.status == '1') {
				window.location.href = data.url;
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
