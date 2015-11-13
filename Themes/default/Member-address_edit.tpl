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
	<div class="wrap myprofile_box">
            <p>
                <label class="no_pad_top">First Name <span class="red">*</span></label>
                <input type="text" name="first_name" value="{$member.firstname}" class="reg_text">
            </p>
            <p>
                <label>Last Name  <span class="red">*</span></label>
                <input type="text" name="last_name" value="{$member.lastname}" class="reg_text">
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
            <p>
                <label>E-mail</label>
                <input type="text" name="email" value="{$member.email}" class="reg_text" disabled="disabled">
            </p>                                    
            <!--<p>
                <label></label>
                <input class="common_che_box" type="checkbox" name="is_master" id="is_master" value="1" />Save as a default shipping address
            </p>-->
            <input type="button" value="Submit" id="save" class="common_btn2" />
    </div>
<script type="text/javascript">
    $('#save').click(function(){
        var first_name = $("input[name='first_name']");
        var last_name = $("input[name='last_name']");
        var telphone = $("input[name='telphone']");
        var address = $("input[name='address']");
        var city = $("input[name='city']");
        var state = $("input[name='state']");
        if(!state.val())
           state = $('select[name="state"]');
        var country_id=$("select[name='country_id']");
        var postcode=$("input[name='postcode']");
        if(!first_name.val())
        {       
            $.Prompt('Please enter first name');
            return;
        }
        if(!last_name.val())
        {
            $.Prompt('Please enter last name');
            return;
        } 
        if(country_id.val==0)
        {
            $.Prompt('');
            return;
        }
        if(!state.val())
        {
            $.Prompt('Please enter state/provice');
            return;
        }
        if(!city.val())
        {
            $.Prompt('Please enter city');
            return;
        }
        if(!address.val())
        {
            $.Prompt('Please enter address');
            return;
        }
        if(!postcode.val())
        {
            $.Prompt('Please enter postcode');
            return;
        }  
        if(!mobilephone.val())
        {
            $.Prompt('Please enter mobilephone');
            return;
        }
        if(!email.val())
        {
            $.Prompt('Please enter email');
            return;
        }
        if(!isEmail(email.val()))
        {
            $.Prompt('E-mail format error!');
            return;
        }

        $.ajax({
            url:"m-account-editAddress.html",
            type: 'POST',
            data:{
                first_name   : first_name.val(),
                last_name   : last_name.val(),
                email   : email.val(),
                mobilephone   : mobilephone.val(),
                telephone   : telephone.val(),
                address   : address.val(),
                city   : city.val(),
                state   : state.val(),
                country_id   : country_id.val(),
                postcode   : postcode.val(),
                address_id   : '2',
                ajax : 1,
                is_master  : $('#is_master').attr("checked") ? 1:0
            },
            dataType:'json',
            cache:false,
            success:function(rs){
                if(rs.status == '1'){                    
                    $.Prompt(rs.msg);
                    setTimeout(function(){
                         window.location.href='/m-account-address.html'; 
                    },400);   
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
