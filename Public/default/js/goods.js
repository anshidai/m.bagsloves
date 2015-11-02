$(function(){

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
});


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