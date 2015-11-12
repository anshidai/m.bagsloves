<div id="top_box">
	<div class="top_wrap">
		<div class="navbtn help"><a href="/m-navpage-help.html"><i class="icon-favorite"></i></a></div>
		<div class="navbtn menber"><a href="{:U('Member/index')}"><i class="icon-user3"></i></a></div>
		<div id="logo"><a href="/"><img src="__CSS__/img/logo.png" /></a></div>
		<div class="navbtn searchformbtn"><i class="icon-search2"></i></div>
		<div class="navbtn cart_box">
			<div class="cart_txt">
				<a href="/m-cart-list.html"><i class="icon-cart8"><span id="shopping_cart_count">{:itemCount()}</span></i></a>
			</div>
		</div>
		<!--<div class="navbtn likebox">
			<a href="/m-account-favorites.html"><i class="icon-favorite2"></i></a>
		</div>-->
	</div>
	<!-- top_wrap end-->
	<div class="clearboth"></div>
</div>
<!-- top_box end-->
<div class="clear"></div>

<div class="topsearchform">
	<div class="searchform_box">
        <form id="autocomplete-submit" class="searchform" action="/m-product-search.html" method="get">
            <input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax" class="search_input"  value=""/>
            <button type="submit"  value="GO" id="btn-autocomplete" class="btn_search">Search</button>
        </form>
    </div>
</div>

<div class="topcategorieswrap">
	<div class="topcategorieswrapbg"></div>
	<ul class="topcategories">
		<li class="allcategories"><a href="{:build_url('','cate_url')}">All Categories<i></i></a></li>
		<notempty name="catetree">
		<foreach name="catetree" item="vo">
		<li <if condition="$vo['id'] eq $cid">class="actived"</if>>
			<notempty name="vo.sub">
			<a href="{:build_url($vo,'cate_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			<div class="category_son" <if condition="$vo['id'] eq $cid">style="display:block;"</if>>
				<dl>
					<foreach name="vo.sub" item="sub">
					<dd><a href="{:build_url($sub,'cate_list_url')}">{:build_url($sub,'cate_name')} ({$sub.products_total})</a></dd>
					</foreach>
				</dl>
			</div>
			<else/>
			<a href="{:build_url($vo,'cate_list_url')}">{:build_url($vo,'cate_name')}<i class="arr icon-right2"></i></a>
			</notempty>
		</li>
		</foreach>
		</notempty>
	</ul>
</div>

<script>
$('#autocomplete-ajax').autocomplete({
    serviceUrl: '/m-product-autocomplete.html',
    onSelect: function(suggestion) {
        var keywords = $('#autocomplete-ajax').val();
        keywords = encodeURIComponent(suggestion.value);
        window.location.href = "/Search/" + keywords + "/list-r1.html";
    }
});
$('#btn-autocomplete').click(function() {
    var keywords = $('#autocomplete-ajax').val();
    if(keywords == ""){
        $.Prompt('Please enter a keyword!');
        return false;
    }
    keywords = encodeURIComponent(suggestion.value);
    $('#autocomplete-submit').attr('action', '/Search/' + keywords + '/list-r1.html');
});
$(document).click(function() {
    $(".keywords_box").hide();
    $('#body_box').css('display', '');
    $('#inner_body_box').css('display', '');
    $('#account_body_box').css('display', '');
    $('#comment_body_box').css('display', '');
    $('footer').css('display', '');
});
$("input[name='keywords']").click(function(e) {
    e.stopPropagation();
});
$(".keywords_box").click(function(e) {
    e.stopPropagation();
});

</script>


<script type="text/javascript">
$(function(){
	var window_h=$(window).height();
	$(".topcategorieswrap").css("height",window_h);
	$(".topcategorieswrapbg").css("height",window_h);
	$(".topcategories").css({"height":window_h,"overflow-y":"auto"})
	
	$("#top_box .categoriesbtn").click(function(){
		$(".topcategorieswrap").toggle(500);
		$(this).toggleClass("oncategoriesbtn");
		if($(".topcategorieswrap").css("display")=="block"){
			$(document.body).css("height",window_h).css({"overflow":"hidden"});
		}else{$(document.body).css("height","auto").css({"overflow":"auto"});}
	});
	$("#top_box .categoriesbtn").click(function(e){
	var e=window.event || e;
	if(e.stopPropagation){
	e.stopPropagation();
	}else{
	e.cancelBubble = true;
	}							   
	});
	$(document).click(function(){
	$(".topcategorieswrap").hide(500);
	$("#top_box .categoriesbtn").removeClass("oncategoriesbtn");
	$(document.body).css("height","auto").css({"overflow":"auto"});
	});
	
	$("#top_box .searchformbtn").click(
		function(){
			$(".topsearchform").toggle();
			$(this).toggleClass("onsearchformbtn");
		}
	);
	$("#top_box .searchformbtn").click(function(e){
//阻止冒泡
	var e=window.event || e;
	if(e.stopPropagation){
	e.stopPropagation();
	}else{
	e.cancelBubble = true;
	}							   
	});
	$(document).click(function(){
	$(".topsearchform").hide();
	});
})
</script>  
