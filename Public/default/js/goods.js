$(function(){
	
	$("#dollicon").click(function(){
		$(".copynotice").show().find(".site_notice_content").text(window.location.href+"?source_user=&source=promotion_url")
	});
	
	$(".list_carousel ").touchCarousel({
		itemsPerMove:1,
		pagingNav: 0,
		scrollbar: 0,
		directionNav: 0,
		directionNav:false,
		itemLikeWindowWidth: 4,
		directionNavAutoHide:false,
		autoplay:false,
		directionNav:false,
		pagingNavControls:true
	});
	
	var goods_number = $("#buyskunums");
	$("a.plus").click(function() {
		goods_number.val(parseInt(goods_number.val()) +1);
		if(parseInt(goods_number.val()) <=0) {
			goods_number.val(1);
		}
	});
	$("a.reduce").click(function() {
		goods_number.val(parseInt(goods_number.val()) -1);
		if(parseInt(goods_number.val()) <=0) {
			goods_number.val(1);
		}
	});
	
	$('.similar_product_box').newMobileSlide({
		  container:'.similar_products', 
		  displaySlide:'.similar_products_box', 
		  contentSlide:'#similar_products_list', 
		  loop:false, 
		  play:false, 
		  visibleIntChange:true,
		  imgWidthChange:false, 
		  imgWidth:150, 
		  margin:8, 
		  steps:3, 
		  stepsSlide:true
    });
	
	$('.addtocart').click(function(e) {
		
		var attr_size = $("#attr_size").val();
		var attr_color = $("#attr_color").val();
		var qty = $('#buyskunums').val();
		qty = parseInt(qty);
		
		if(qty <=0) {
			qty = 1;
		}
		
		if(attr_size == '') {
            $.Prompt('Please select Size');
			return;
        }
        else if(attr_color == '') {
			$.Prompt('Please select Color');
			return;
        }
		
		var _form = $("#form_cart_quantity");
		
		$.post(_form.attr('action'), _form.serialize(), function(data){
			if(data.status == '1') {
				$('#shopping_cart_count').text(parseInt(data.item_count));
                $('#cart_total_qty').text(data.item_count);
				
				var windowWidth = document.documentElement.clientWidth;
				var windowHeight = document.documentElement.clientHeight;
				var popupHeight = $("#add_cart_box").height();
				var popupWidth = $("#add_cart_box").width();
				$("#add_cart_box").css({"top": (windowHeight - popupHeight) / 2 + $(document).scrollTop()});
				$('#add_cart_box').show().delay(30000).fadeOut(1000);
				
			}else {
				$.Prompt(data.info);
			}
		});
    });
	
	
});


$("#carousel").touchCarousel({
	itemsPerMove:1,
	pagingNav: 1,
	scrollbar: 0,
	directionNav: 0,
	directionNav:false,
	itemLikeWindowWidth: 1,
	directionNavAutoHide:false,
	autoplay:false,
	directionNav:true,
	pagingNavControls:true,
	onAnimComplete: function() {
		$(".current_index").html( this.getCurrentId()+1);
		if((this.getCurrentId()+1) == $('ul.touchcarousel-container li').length){
			$( ".arrow-holder.right" ).addClass("disabled");
		}else{
			$( ".arrow-holder.right" ).removeClass("disabled");
		}
	},
	onAnimStart:function(){
		if(this.numItems<=1){
			$( ".arrow-holder" ).css("display","none");
			return;
		}
	}
});


$('#add_favorites').click(function() {
	var _this = $(this);
	var _val = parseInt($('#favoritenum').text());
	var goods_id = _this.attr('data_id');
	var user_id = '';
	if(!user_id) {
		$.Prompt('Login required');
	}
	else {
		$.ajax({
			url: '/m-user-addFavorites.html',
			type: 'POST',
			data: {
				goods_id: goods_id
			},
			dataType: 'json',
			cache: false,
			success: function(res) {
				if (res == 1) {
					$.Prompt('Favorited Successfully');
					_this.find('#favoritenum').text(_val + 1);
				} else if (res == 2) {
					$.Prompt('Login required');
				} else if (res == 3) {
					$.Prompt('You have already added this');
				} else {
					$.Prompt('Favorite Failed');
				}
			},
			error: function() {
				alert('Connection fails, please retry refresh');
			},
			beforeSend: function() {
				createAjaxLoading();
			},
			complete: function() {
				removeAjaxLoading();
			}
		});
	}
});


$('.newsletter_btn').click(function() {
	if ($('#email').val() == '' || $('#email').val() == 'Your Email Address') {
		$.Prompt('Please Enter Your Email Address!');
		return;
	}
	$isvalidemail = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test($('#email').val());
	if (!$isvalidemail) {
		$.Prompt('Please Enter a valid e-mail address!');
		return;
	}

	$.ajax({
		url: "m-user-newsletter.html",
		type: 'POST',
		data: {
			email: $('#email').val()
		},
		dataType: 'json',
		cache: false,
		success: function(rs) {
			if (rs.status == '1') {
				$.Prompt('Successful');
			} else if (rs.msg) {
				$.Prompt(rs.msg);
			}
		},
		beforeSend: function() {
			createAjaxLoading();
		},
		complete: function() {
			removeAjaxLoading();
		}
	});
});


$('#add_favorites').click(function() {
	var _this = $(this);
	var _val = parseInt($('#favoritenum').text());
	var product_id = _this.attr('data_id');
	if(!user_id) {
		$.Prompt('Login required');
		return false;
	}
	$.post(_this.attr('action'), {id:product_id}, function(data){
		$.Prompt(data.info);
		if(data.status == '1') {
			 _this.find('#favoritenum').text(_val + 1);
		}
	});
});

function notice_close(){
		$("#site_notice").css("display","none");
		SetCookie("noticeisreaded","noticeisreaded");
}

/*
<!-- 促销倒计时 -->
$('.discount-timer').each(function() {
	$(this).genTimer({
		beginTime: "2015/10/17 21:01:56",
		targetTime: $(this).attr('endTime'),
		callback: function(time) {
			this.html(time);
		}
	});
});
*/