function showPopup()
{
	$('.popupBoxBg').show();
	$('.popupBox').show();
	scroll(0,0);            
}
function closePopup()
{
	$('.popupBoxBg').hide();
	$('.popupBox').hide();      
}

$('.btn_edit').click(function(){
	showPopup();
	$('.cancel_btn a').click(function(){
		closePopup();
	});
});

$('.btn_new_shipping_address').click(function(){
	showPopup();
	$('.cancel_btn a').click(function(){
		closePopup();
	});
});


$('.common_btn2').click(function(){
	var telphone = $("input[name='telphone']").val();
	var address = $("input[name='address']").val();
	var city = $("input[name='city']").val();
	var state = $("input[name='state']").val();
	
	var country = $("select[name='country']");
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
			window.location.reload();
		}else {
			closePopup();
			return;
		}
	});
});

 $('#message_header').toggle(
	function() {
	  $('#message_box').show();
	  $(this).find('span').text("-");
	},
	function () {
	  $(this).find('span').text("+");
	  $('#message_box').hide();
	}
);

$('#pay_checkout').click(function(){
	var payment_code = $("select[name='payment_code']").val();
	if(!payment_code) {
		$.Prompt('Please enter Payment Method.');
		return;
	}
	
	var _form = $("#pay_form");
	$.post(_form.attr('action'), _form.serialize(), function(data){
		$.Prompt(data.info);
		if(data.status == '1') {
			window.location.href = data.url;
		}
	});
	
	
	
});
