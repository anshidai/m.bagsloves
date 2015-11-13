var state_str = '[]';
var countryState=eval("("+state_str+")");
function changeCountryToChangeSate(country_id,state_td,state_name)
{
	if(!state_name)
		state_name = 'state'
	var state = $('#'+state_td).find('input[name='+state_name+']').val();
	if(!state) {
		state = $('#'+state_td).find('select[name='+state_name+']').val();
	}
	if(countryState[country_id]) {
		var state = $('#'+state_td).find('input[name='+state_name+']').val();
		if(!state) {
			state = $('#'+state_td).find('select[name='+state_name+']').val();
		}
		var str='<div class="select"><select name="'+state_name+'">';
		for(key in countryState[country_id]) {
			if(state && countryState[country_id][key].base_name.toLowerCase()==state.toLowerCase())
			str += '<option value="'+countryState[country_id][key].base_name+'" selected="selected">'+countryState[country_id][key].base_name+'</option>';
			else
			str += '<option value="'+countryState[country_id][key].base_name+'">'+countryState[country_id][key].base_name+'</option>';
		}
		str +='</select></div>';
		$('#'+state_td).html(str);
	}
	else {
		if(!state) state='';
		$('#'+state_td).html('<input type="text" name="'+state_name+'" value="'+state+'" />');
	}
	var myreg = /^\++[0-9]*$/;
	var inputVal = jQuery.trim($("input[name='mobilephone']").val());
	if(myreg.test(inputVal) && inputVal.length < 7) {
		if($("option[value=" + country_id + "]:selected").attr("codes")) {
			$("input[name='mobilephone']").val("+" + $("option[value=" + country_id + "]:selected").attr("codes") + " ");
		}
	} else if(!myreg.test(inputVal) && inputVal.length < 7) {
		if($("option[value=" + country_id + "]:selected").attr("codes")) {
			$("input[name='mobilephone']").val("+" + $("option[value=" + country_id + "]:selected").attr("codes") + " ");
		}
	}
	var inputVal = jQuery.trim($("input[name='billing_mobilephone']").val());
	if(myreg.test(inputVal) && inputVal.length < 7) {
		if($("option[value=" + country_id + "]:selected").attr("codes")) {
			$("input[name='billing_mobilephone']").val("+" + $("option[value=" + country_id + "]:selected").attr("codes") + " ");
		}
	} else if(!myreg.test(inputVal) && inputVal.length < 7) {
		if ($("option[value=" + country_id + "]:selected").attr("codes")) {
			$("input[name='billing_mobilephone']").val("+" + $("option[value=" + country_id + "]:selected").attr("codes") + " ");
		}
	}
}




var newaddress_str = '<div class="checkout_box">'+
              '<h3>New a shipping address</h3>'+
              '<ul class="newaddress">'+
                 '<li>'+
                   '<div class="firstname">'+
                       '<span class="must">*</span><label>First Name</label><br>'+
                       '<input type="text" name="first_name" />'+
                   '</div>'+
                   '<div class="lastname">'+
                       '<span class="must">*</span><label>Last Name</label><br>'+
                       '<input type="text" name="last_name" />'+
                   '</div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Select Your Country/Region</label><br>'+
                   '<div class="select"><select id="add_new_shipping_address" name="country_id" autocomplete="false" onchange="changeCountryToChangeSate(this.value,\'newaddress_state_box\')">'+
                        '<option value="0">Please select </option>'+
                        ''+
                        '<option codes="93" value="1">'+"Afghanistan"+'</option>'+
                        ''+
                        '<option codes="358" value="2">'+"Aland Islands"+'</option>'+
                        ''+
                   '</select></div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Province</label><br>'+
                   '<div id="newaddress_state_box"><input type="text" name="state" /></div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>City</label><br>'+
                   '<input type="text" name="city" />'+
                 '</li>'+
                  '<li>'+
                   '<span class="must">*</span><label>Address</label><br>'+
                   '<input type="text" name="address" />'+
                 '</li>'+                                  
                 '<li>'+
                   '<span class="must">*</span><label>ZIP/Postal Code</label><br>'+
                   '<input type="text" name="postcode" />'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Phone Number</label><br>'+
                   '<input type="text" name="mobilephone" />'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>E-mail</label><br>'+
                   '<input type="text" name="email" value="lba8610@163.com" />'+
                 '</li>'+                                 
                 '<li>'+
                   '<input type="hidden" name="address_id" value="0" />'+
                   '<div class="clear"></div>'+
                   '<div class="submit_btn"><a class="common_btn2" href="javascript:;">Sumbit</a></div>'+
                   '<div class="cancel_btn"><a class="common_btn1" href="javascript:;">Cancel</a></div>'+    
                   '<div class="clear"></div>'+                 
                 '</li>'+
              '</ul>'+
           '</div>';
    var newbillingaddress_str = '<div class="checkout_box">'+
              '<h3>New a Billing address</h3>'+
              '<ul class="newbillingaddress">'+
                 '<li>'+
                   '<div class="firstname">'+
                       '<span class="must">*</span><label>First Name</label><br>'+
                       '<input type="text" name="billing_first_name" />'+
                   '</div>'+
                   '<div class="lastname">'+
                       '<span class="must">*</span><label>Last Name</label><br>'+
                       '<input type="text" name="billing_last_name" />'+
                   '</div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Select Your Country/Region</label><br>'+
                   '<div class="select"><select id="add_new_billing_address" name="billing_country_id" autocomplete="false" onchange="changeCountryToChangeSate(this.value,\'newbillingaddress_state_box\',\'billing_state\')">'+
                        '<option value="0">Please select </option>'+
                        ''+
                        '<option codes="93" codes="93" value="1">'+"Afghanistan"+'</option>'+
                        ''+
                        '<option codes="358" codes="358" value="2">'+"Aland Islands"+'</option>'+
                        ''+
                        '<option codes="355" codes="355" value="3">'+"Albania"+'</option>'+
                        ''+
                   '</select></div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Province</label><br>'+
                   '<div id="newbillingaddress_state_box"><input type="text" name="billing_state" /></div>'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>City</label><br>'+
                   '<input type="text" name="billing_city" />'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Address</label><br>'+
                   '<input type="text" name="billing_address" />'+
                 '</li>'+                                  
                 '<li>'+
                   '<span class="must">*</span><label>ZIP/Postal Code</label><br>'+
                   '<input type="text" name="billing_postcode" />'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>Phone Number</label><br>'+
                   '<input type="text" name="billing_mobilephone" />'+
                 '</li>'+
                 '<li>'+
                   '<span class="must">*</span><label>E-mail</label><br>'+
                   '<input type="text" name="billing_email" value="lba8610@163.com" />'+
                 '</li>'+                                  
                 '<li>'+
                   '<input type="hidden" name="billing_id" value="0" />'+
                   '<div class="clear"></div>'+
                   '<div class="submit_btn"><a class="common_btn2" href="javascript:;">Sumbit</a></div>'+
                   '<div class="cancel_btn"><a class="common_btn1" href="javascript:;">Cancel</a></div>'+    
                   '<div class="clear"></div>'+                 
                 '</li>'+
              '</ul>'+
           '</div>';
    function showPopup(html)
    {
        $('.popupBoxBg').remove();
        $('.popupBox').remove();
        $(document.body).append('<div class="popupBoxBg"></div><div class="popupBox"></div>');
        $('.popupBox').html(html);
        scroll(0,0);            
    }
    function closePopup()
    {
        $('.popupBoxBg').remove();
        $('.popupBox').remove();      
    }
    $('.btn_new_shipping_address').click(function(){
        showPopup(newaddress_str)
        var obj=$('.popupBox ul.newaddress');
        obj.find('.cancel_btn a').click(function(){
            closePopup();
        });
                   $("#add_new_shipping_address option[value='45']").attr("selected", "selected");
           changeCountryToChangeSate('45','newaddress_state_box')
                saveAddress(obj);
    });
    saveAddress($('ul.newaddress'));
    $('.btn_new_billing_address').click(function(){
        showPopup(newbillingaddress_str)
        var obj=$('.popupBox ul.newbillingaddress');
        obj.find('.cancel_btn a').click(function(){
            closePopup();
        });
        $('input[name="billing_id"]').val('');
                $("#add_new_billing_address option[value='45']").attr("selected", "selected");
        changeCountryToChangeSate('45','new_billing_address_state','billing_state')
                saveBillingAddress(obj);
                $("#add_new_billing_address option[value='45']").attr("selected", "selected");
        changeCountryToChangeSate('45','newbillingaddress_state_box','billing_state')
            });
    saveBillingAddress($('ul.newbillingaddress'));
    $('.btn_edit').click(function(){
        showPopup(newaddress_str);
        var obj=$('.popupBox ul.newaddress');
        obj.find('.cancel_btn a').click(function(){
            closePopup();
        });
        var _val = $(this).attr('data_id');
        var address_id = obj.find('input[name="address_id"]');
        var firstname  = obj.find('input[name="first_name"]');
        var lastname   = obj.find('input[name="last_name"]');
        var country_id = obj.find('select[name="country_id"]');
        var state      = obj.find('input[name="state"]');
        if(state.length <= 0)
            state      = $('select[name="state"]');
        var city       = obj.find('input[name="city"]');
        var postcode   = obj.find('input[name="postcode"]');
        var address    = obj.find('input[name="address"]');
        var address_spare  = obj.find('input[name="address_spare"]');
        var email          = obj.find('input[name="email"]');
        var mobilephone    = obj.find('input[name="mobilephone"]');
        var telphone       = obj.find('input[name="telephone"]');
        $.ajax({                 
            url :'/m-user-getAddressById.html',
            type:'POST',
            data:{id:_val},
            dataType: 'json',
            cache: false,
            success: function(res) { 
                if(res)
                {
                    address_id.attr('value', res.id);
                    firstname.attr('value', res.first_name);
                    lastname.attr('value', res.last_name);
                    country_id.attr('value', res.country_id);
                    city.attr('value', res.city);
                    postcode.attr('value', res.postcode);
                    email.attr('value', res.email);
                    mobilephone.attr('value', res.mobilephone);
                    telphone.attr('value', res.telphone);
                    address.attr('value', res.address);
                    address_spare.attr('value', res.address_spare);
                    state.attr('value', res.state);
                    country_id.change();
                }
                else{
                    $.Prompt('illegal operation!');
                    closePopup();
                    return;
                }
            },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
        });
        saveAddress(obj);
    });
    $('.billing_btn_edit').click(function(){
        showPopup(newbillingaddress_str);
        var obj=$('.popupBox ul.newbillingaddress');
        obj.find('.cancel_btn a').click(function(){
            closePopup();
        });
        var _val = $(this).attr('data_id');    
        var _id = $(this).attr('id');
        var address_id = obj.find('input[name="billing_id"]');
        var firstname  = obj.find('input[name="billing_first_name"]');
        var lastname   = obj.find('input[name="billing_last_name"]');
        var country_id = obj.find('select[name="billing_country_id"]');
        var state      = obj.find('input[name="billing_state"]');
        if(state.length <= 0)
            state      = $('select[name="billing_state"]');
        var city       = obj.find('input[name="billing_city"]');
        var postcode   = obj.find('input[name="billing_postcode"]');
        var address    = obj.find('input[name="billing_address"]');
        var address_spare  = obj.find('input[name="billing_address_spare"]');
        var email          = obj.find('input[name="billing_email"]');
        var mobilephone    = obj.find('input[name="billing_mobilephone"]');
        var telphone       = obj.find('input[name="billing_telephone"]');
        $.ajax({                 
            url :'/m-user-getAddressById.html',
            type:'POST',
            data:{id:_val},
            dataType: 'json',
            cache: false,
            success: function(res) { 
                if(res)
                {
                    if(_id=='billing_btn_edit_0')
                    {
                        address_id.attr('value', '');
                    }
                    else
                    {
                        address_id.attr('value', res.id);
                    }  
                    firstname.attr('value', res.first_name);
                    lastname.attr('value', res.last_name);
                    country_id.attr('value', res.country_id);
                    city.attr('value', res.city);
                    postcode.attr('value', res.postcode);
                    email.attr('value', res.email);
                    mobilephone.attr('value', res.mobilephone);
                    telphone.attr('value', res.telphone);
                    address.attr('value', res.address);
                    address_spare.attr('value', res.address_spare);
                    state.attr('value', res.state);
                    country_id.change();
                }
                else{
                    $.Prompt('illegal operation!');
                    closePopup();
                    return;
                }
            },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
        });
        saveBillingAddress(obj);
    });
    function saveAddress(obj)
    {
        obj.find('.submit_btn a').click(function(){
            var address_id = obj.find('input[name="address_id"]').val();
            var firstname  = obj.find('input[name="first_name"]').val();
            var lastname   = obj.find('input[name="last_name"]').val();
            var country_id = obj.find('select[name="country_id"]').val();
            var state      = obj.find('input[name="state"]').val();
            if(!state)
                state      = $('select[name="state"]').val();
            var city       = obj.find('input[name="city"]').val();
            var postcode   = obj.find('input[name="postcode"]').val();
            var address    = obj.find('input[name="address"]').val();
            var address_spare  = obj.find('input[name="address_spare"]').val();
            var email          = obj.find('input[name="email"]').val();
            var mobilephone    = obj.find('input[name="mobilephone"]').val();
            var telphone       = obj.find('input[name="telephone"]').val();      
            if(!firstname)
            {       
                $.Prompt('Please enter first name');
                return;
            }
            if(!lastname)
            {
                $.Prompt('Please enter last name');
                return;
            }    
            if (country_id==0)
            {
                $.Prompt('Please select country');
                return;
            }
            if(!state)
            {
                $.Prompt('Please enter state/provice');
                return;
            }
            if(!city)
            {
                $.Prompt('Please enter city');
                return;
            }
            if(!address)
            {
                $.Prompt('Please enter address');
                return;
            }
            if(!postcode)
            {
                $.Prompt('Please enter postcode');
                return;
            }
            if(!mobilephone || mobilephone.length < 7)
            {
                $.Prompt('Please enter mobilephone');
                return;
            }     
            if(!email)
            {
                $.Prompt('Please enter email');
                return;
            }
            if(!isEmail(email))
            {
                $.Prompt('E-mail format error!');
                return;
            } 
            $.ajax({                 
                url :'/m-user-addAddress.html',
                type:'POST',
                data:{
                    id         : address_id ? address_id : 0,
                    first_name : firstname,
                    last_name  : lastname,
                    country_id : country_id,
                    state      : state,
                    city       : city,
                    postcode   : postcode,
                    address    : address,
                    address_spare: address_spare,
                    email      : email,
                    mobilephone: mobilephone,
                    telephone  : telphone,
                    is_master  : 1
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                    if(res.status == '1')
                    {
                        if(res.isreg)
                        window.location.href="/h-order-add.html?showprofile=1"; 
                        else
                        window.location.href="/h-order-add.html";
//                        window.location.reload(true); 
                        return false;
                    }
                    else{
                        $.Prompt(res.msg);
                    }
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
            });
            return false;
        });
    }
    function saveBillingAddress(obj)
    {
        obj.find('.submit_btn a').click(function(){
            var address_id = obj.find('input[name="billing_id"]').val();
            var firstname  = obj.find('input[name="billing_first_name"]').val();
            var lastname   = obj.find('input[name="billing_last_name"]').val();
            var country_id = obj.find('select[name="billing_country_id"]').val();
            var state      = obj.find('input[name="billing_state"]').val();
            if(!state)
                state      = $('select[name="billing_state"]').val();
            var city       = obj.find('input[name="billing_city"]').val();
            var postcode   = obj.find('input[name="billing_postcode"]').val();
            var address    = obj.find('input[name="billing_address"]').val();
            var address_spare  = obj.find('input[name="billing_address_spare"]').val();
            var email          = obj.find('input[name="billing_email"]').val();
            var mobilephone    = obj.find('input[name="billing_mobilephone"]').val();
            var telphone       = obj.find('input[name="billing_telephone"]').val();      
            if(!firstname)
            {       
                $.Prompt('Please enter first name');
                return;
            }
            if(!lastname)
            {
                $.Prompt('Please enter last name');
                return;
            }     
            if (country_id==0)
            {
                $.Prompt('Please select country');
                return;
            }
            if(!state)
            {
                $.Prompt('Please enter state/provice');
                return;
            }
            if(!city)
            {
                $.Prompt('Please enter city');
                return;
            }
            if(!address)
            {
                $.Prompt('Please enter address');
                return;
            }
            if(!postcode)
            {
                $.Prompt('Please enter postcode');
                return;
            }
            if(!mobilephone || mobilephone.length < 7)
            {
                $.Prompt('Please enter mobilephone');
                return;
            }     
            if(!email)
            {
                $.Prompt('Please enter email');
                return;
            }
            if(!isEmail(email))
            {
                $.Prompt('E-mail format error!');
                return;
            }
            $.ajax({                 
                url :'/m-user-addAddress.html',
                type:'POST',
                data:{
                    id         : address_id ? address_id : 0,
                    first_name : firstname,
                    last_name  : lastname,
                    country_id : country_id,
                    state      : state,
                    city       : city,
                    postcode   : postcode,
                    address    : address,
                    address_spare: address_spare,
                    email      : email,
                    mobilephone: mobilephone,
                    telephone  : telphone,
                    is_master  : 1,
                    address_type  : 1
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                    if(res.status == '1')
                    {
                        if(res.isreg)
                        window.location.href="/h-order-add.html?showprofile=1"; 
                        else
                        window.location.href="/h-order-add.html";
//                        window.location.reload(true); 
                        return false;
                    }
                    else{
                        $.Prompt(res.msg);
                    }
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
            });
            return false;
        });
    }
    $('.checkout').click(function(){
        var address  = false;
        var shipping = false;
        var payment = false;
        $('input[name="shipping_address"]').each(function(){
            if(($(this).attr("checked") || $(this).attr("checked") == 'checked') && $(this).val()){
                address = true;   
            }
        });
        if($('input[name="shipping_id"]:checked').val())
        {
            shipping = true;
        }
        if($('#payment_id').val())
        {
            payment = true;
        }
        if(!address){
            $.Prompt('Please select shipping address');
            return false;
        }
        if(!shipping){
            $.Prompt('Please Select Shipping Method');
            return false;
        }
        if(!payment){
            $.Prompt('Please Select Payment Method');
            return false;
        }
        $(this).attr("disabled", true);
        $.ajax({
            url :'/m-order-step1.html',
            type:'POST',
            data:{
                payment_id  : $('#payment_id').val(),
                shipping_id  : $('input[name="shipping_id"]:checked').val(),
                insurance  : $('#insurance').attr("checked") ? 1:0,
                shipping_address  : $('#shipping_address_id').find("option:selected").val(),
                order_remark : $('#order_remark').val(),
                use_credit : $('input[name="use_credit"]').val(),
                billing_address_id  : $('#billing_address_id').find("option:selected").val()
            },
            dataType: 'json',
            cache: false,
            success: function(res) { 
                    if(res.status)
                    {
                        if(!res.result.form_html)
                        {
                            location.href='/m-order-showPaymentInfo.html?itemno='+res.result.itemno;
                        }
                        else
                        {
                            //$('#oshtml').hide();
                            //$('#payiframe').show();
                            //$('#payiframe').attr('src','/m-order-paymentInterface.html?itemno='+res.result.itemno);
                            $('#order_payment').html(res.result.form_html);
                            $("#payment_form").attr('target','_self')
                            $("#payment_form").submit();
                        }
                    }
                    else
                    {
                         $.Prompt(res.msg);
						 removeAjaxLoading();
						 window.location.href=window.location.href;
                    }                 
            },
                beforeSend: function(){
                    $('.checkout').css('background','#666');
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
        });
    });
    $('input[name="shipping_address"]').each(function(){
        if($(this).attr('checked') == 'checked')
        {
            getShippingInfo($(this).attr('data_id'));
            $('#billing_address_0').val($(this).val());  
            $('#billing_btn_edit_0').attr('data_id',$(this).val());
            if($(this).val()==''){
                $('.billing_btn_edit').attr("data_id", $(this).val());
            }
        }
    });

    /*选择配送方式激活事件*/
    $('.shipping_method').live('click', function(){
        var shipping_id       = $(this).val();
        var shipping_priceobj    = $('#shipping_price');
        var order_total_priceobj = $('#order_totalprice');
        if(shipping_id)
        {
            $.ajax({                 
                    url :'/m-order-getShippingFee.html',
                    type:'POST',
                    data:{
                        shipping_id  : shipping_id
                    },
                    dataType: 'json',
                    cache: false,
                    success: function(res) { 
                        if(res){
                            order_total_priceobj.text(res.payment_amount);
                            $('#shippingmethodselected').text($("#shipping_id option:selected").text());
                            if(res.shipping_fee>0)
                            {
                                $('#shipfee').text('Shipping Price : US$ '+res.shipping_fee+'');
                                shipping_priceobj.text(res.shipping_fee);
                            }else{
                                $('#shipfee').text('Free Shipping');
                                shipping_priceobj.text('0');
                            }
                            if(parseInt($("#shipping_id option:selected").attr('data_discount'))<100)
                            {
                                $('#shipdiscout').html('( '+(100-parseInt($("#shipping_id option:selected").attr('data_discount')))+'% OFF )');
                            }
                            else
                            {
                                $('#shipdiscout').html('');
                            }
                            $('#checkout_totalprice').text(res.payment_amount);
                            if(res.is_show_credit)
                            {
                                $('#total_useful_credit').text(res.total_credit);
                                $('#max_exp_credit').text(res.max_exp_credit);
                                if(res.total_credit>0)
                                $('.creditbox').show(); 
                            }
                            else
                            {
                                $('#use_credit_text').val('');
                                $('#total_useful_credit').text(0);
                                $('#max_exp_credit').text(0);
                                $('.creditbox').hide(); 
                            }

                            if(res.insurance_fee > 0)
                            {
                                $('#insurance_box').show();
                                $('#insurance_price').text(res.insurance_fee);
                                if(res.insurance_default == 1) { 
                                     $("#insurance").attr("checked", 'checked');                       
                                  }
                            }
                            else
                            {
                                $('#insurance_box').hide();
                                $('#insurance_price').text(0);
                            }
                            calInsuanceFee();
                        }
                        setTotalprice();
                        //$('#billing_address_box').show();
                    },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
             });   
        }
        else
        {
            $('#shippingmethodselected').html('Please Select Shipping Method');
            $('#shipdiscout').html('');
            $('#shipfee').html('');
            $('#shipping_price').html('0');
            setTotalprice();
        }
    }); 
    $('#insurance').click(function(){
           var shipping_id = 0;
           shipping_id=$('input[name="shipping_id"]:checked').val();
           if(shipping_id){
               calInsuanceFee();
           }
           else{
            $('#insurance').attr("checked",false);
            $.Prompt('Please Select Shipping Method');
           }
           
    });
    function calInsuanceFee()
    {
           var ischecked   = $('#insurance').attr("checked");
           var shipping_id = 0;
           shipping_id=$('input[name="shipping_id"]:checked').val();
           if(shipping_id){
            $.ajax({                 
                url :'/m-order-validInsurance.html',
                type:'POST',
                data:{
                    shipping_id  : shipping_id,
                    insurance    : ischecked == 'checked' ? 1 : 0
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                    if(res){
                        $('#shipping_insurance').text(res.insurance_fee);
                        $('#payment_fee').text(0);
                        $('#payment_id').val(0);
                        $('#payment_id').change(); 
                        setTotalprice();
                    }                         
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }  
         });    
        }
    }
    var credit_blur = 0;
    $('#use_credit_text').blur(function(){
	$('#credits_total_tr').show();
        if(!credit_blur)
        {
            return;
        }
        credit_blur = 0;
        var _this = $(this);
        var shipping_id = parseInt($('input[name="shipping_id"]:checked').val());
        if(_this.val()=="")
        {
                _this.val(0);	
        }
        var credit_val  = _this.val();
        var insurance_selected = 0;
        if($("#insurance").attr("checked"))
        {
            insurance_selected = 1;
        }
        if(!shipping_id){
            _this.val(0);
            $.Prompt('Please select shipping method');
            return false;
        }
        if(shipping_id){
            $.ajax({                 
                url :'/m-order-validExpCredit.html',
                type:'POST',
                data:{
                    shipping_id  : shipping_id,
                    insurance_selected  : insurance_selected,
                    credit:credit_val
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                    if(res.status == 2){
                            $('#credits_value_amount').text(res.amount);
                            $('.exp_amount').text("US$ "+res.amount);
                    }else{
                            $('#credits_value_amount').text(res.amount);
                            $('.exp_amount').text("US$ "+res.amount);
                        _this.attr('value', res.credit);
                         alert(res.msg);
                      }          
                          $('#payment_id').val(0);
                          $('#payment_id').change();   
                      setTotalprice();
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }  
         });    
        }else{
            $.Prompt('Please select shipping method');
        }
    });
    
    $('.use_btn').click(function(){
        credit_blur = 1;
        $('#use_credit_text').blur();
    });

    /*选择付款方式激活事件*/
    $('#payment_id').live('change', function(){
        if(!$('input[name="shipping_id"]:checked').val())
        {
            $.Prompt('Please select the shipping method after then select payment method!');
            $('#payment_id').val('');  
            $('#payment_fee').text(0);
            setTotalprice();
            return;
        }
        var is_billing = $('#payment_id').find("option:selected").attr("data_id");
        if(is_billing==1){
            $('#billing_address_box').show();
        }else{
            $('#billing_address_box').hide();
        }
        var shipping_id       = $('input[name="shipping_id"]:checked').val()
        var payment_id       = $(this).val();
        var insurance_selected = 0;
        if($("#insurance").attr("checked"))
        {
            insurance_selected = 1;
        }
        if(payment_id)
        {
            $.ajax({                 
                url :'/m-order-getPaymentFee.html',
                type:'POST',
                data:{
                    payment_id  : payment_id,
                    shipping_id  : shipping_id,
                    insurance_selected  : insurance_selected,
                    credits_value_amount : parseFloat($('#credits_value_amount').text()),
                    subtotal  : parseFloat($('#shipping_price').text())+parseFloat($('#shipping_insurance').text())+parseFloat('492.1')
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                        if(res.status)
                        {
                            $('#payment_fee').text(res.fee);
                        }
                        else
                        {
                            $('#payment_fee').text(0);
                            $.Prompt('Error please try again!');
                            $('#payment_id').val('');
                        }                     
                        setTotalprice();
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
            });
        }
        else{
            $('#payment_fee').text(0);
            setTotalprice();
        }
    });
    function setTotalprice()
    {
            var totalprice=parseFloat($('#payment_fee').text())+parseFloat($('#shipping_price').text())+parseFloat($('#shipping_insurance').text())+parseFloat('492.1')-parseFloat($('#credits_value_amount').text());
            totalprice = Math.round(totalprice*100)/100
            $('#order_totalprice').text(totalprice);
            $('#checkout_totalprice').text(totalprice);
    }
    function getShippingInfo(country_id)
    {
        if(country_id == 'new_address'){
            showAll($('#new_shipping_address'));
            $('.shipping_delivery').find('p').text('Please select shipping address after');
            $('.shipping_delivery').find('table').empty();
        }else{
            $('#new_shipping_address').hide();
            $.ajax({                 
                url :'/m-order-shippingInfo.html',
                type:'GET',
                data:{
                    country_id  : country_id
                },
                dataType: 'json',
                cache: false,
                success: function(res) { 
                    if(res)
                    {
                        var creat_shipping = '<option value="">Please Select Shipping Method</option>';
                        var creat_shipping = '';
                        var i=1;
                        var free=1;
                        $.each(res, function(key, value){
                             creat_shipping += '<li><input valign="center" name="shipping_id" type="radio" class="radio shipping_method" value="'+value.id+'" data_price="'+ value.price + '" data_discount="'+ value.discount + '" id="shipping_' + value.id + '"'; 
                            if(free && !value.price){
                                creat_shipping += ' checked="checked"';
                                free = 0;
                            }
                            creat_shipping += '><label for="shipping_' + value.id + '"> ' + value.base_name + '</label>&nbsp;&nbsp;<label style="float:right;">' + value.detail +'</label>';
                            //if(value.price)
                            //    creat_shipping +=  '<span class="red">US$ '+value.price+'</span>';
                            //else
                            //    creat_shipping +=  '<span class="col_green">Free Shipping</span>';
                            creat_shipping += '</li>';
                        })
                        if(creat_shipping){
                            $('#shippingmethodselected').html('Choose your delivery');
                            $('#shippinglist').empty();
                            $('#shippinglist').append(creat_shipping);
                        }else{
                            $('#shippingmethodselected').html('Sorry, The address is not within the scope of the distribution');
                        }
                        //触发配送方式点击事件
                        $('.shipping_method').each(function(){
                            if($(this).attr('checked') == 'checked')
                            {
                                $(this).click();
                            }
                        });
                    }
                },
                beforeSend: function(){
                    createAjaxLoading();
                },
                complete: function(){
                    removeAjaxLoading();
                }   
            });
        }
    }
    $('#use_credit_btn').click(function(){
        var _this    = $(this);
        var hasClass = _this.hasClass('use_credit_link');
        if(hasClass)
        {
            $('.credit_use_box').show();
             $('#credits_total_tr').show();
            _this.removeClass('use_credit_link').addClass('open_credit');
        }
        else
        {
            $('.credit_use_box').hide();
            _this.addClass('use_credit_link').removeClass('open_credit');   
        }
    });
    $('#message_header').toggle(
        function () {
          $('#message_box').show();
          $(this).find('span').text("-");
        },
        function () {
          $(this).find('span').text("+");
          $('#message_box').hide();
        }
    );
    /*选择配送地址*/
    $('#shipping_address_id').live('change', function(){
        var shipping_address_id = $(this).val();
        $('.btn_edit').attr("data_id", shipping_address_id);
        $('#shipping_address').attr("value", shipping_address_id);
        if(shipping_address_id==''){
            $('.billing_btn_edit').attr("data_id", shipping_address_id);
        }
        var country_id = $('#shipping_address_id').find("option:selected").attr("data_id");
        $('#billing_address_0').val($(this).val());    
        $('#billing_btn_edit_0').attr('data_id',$(this).val());
        getShippingInfo(country_id);

    });
     /*选择账单地址*/
    $('#billing_address_id').live('change', function(){
        var billing_address_id = $(this).val();
        $('.billing_btn_edit').attr("data_id", billing_address_id);
    });
        $("#add_new_billing_address option[value='45']").attr("selected", "selected");
    changeCountryToChangeSate('45','new_billing_address_state','billing_state')