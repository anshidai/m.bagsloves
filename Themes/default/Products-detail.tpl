<!doctype html>
<html>
<head>
<title>{:getprice($info['price'],$info['pricespe'],false)} - {:build_url($info,'pro_name')}</title>
<meta name="keywords" content="{:build_url($info,'pro_name')}" />
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css"  rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="__SKIN__/font_icon/style.css">
<link href="__CSS__/touchCarousel.css" type="text/css"  rel="stylesheet"/>
<link href="__CSS__/mobile.zoom.css" type="text/css"  rel="stylesheet"/>
<script type="text/javascript" src="__JS__/jquery.js"></script>
<script type="text/javascript" src="__JS__/reLayout.js"></script>
<script type="text/javascript" src="__JS__/common.js"></script>
<script type="text/javascript" src="__JS__/jquery.autocomplete.js"></script>
<script type="text/javascript" src="__JS__/jq.puzz.js"></script>
<script type="text/javascript" src="__JS__/gentimer.js"></script>
<script type="text/javascript" src="__JS__/jquery.prompt.min.js"></script>
<script type="text/javascript" src="__JS__/dialog.js"></script>
<script type="text/javascript" src="__JS__/touchCarousel.js"></script>
<script type="text/javascript" src="__JS__/mobile.zoom.js"></script>
<script type="text/javascript" src="__JS__/iscroll.js"></script>
<script type="text/javascript" src="__JS__/goods.js"></script>
<script type="text/javascript">
 var goods_id = '{$info.id}';
</script>

<!--share-->
<style type="text/css">
.stButton{position:relative;z-index:1;text-decoration:none;color:#000;display:inline-block;cursor:pointer;margin-right:3px;margin-left:3px;font-size:11px;line-height:16px}
.stButton .stLarge{display:inline-block;height:32px;width:32px;position:relative}
.stButton .stLarge:hover{opacity:.75;background-position:-32px}
</style>
</head>
<body>
<include file="Themes/default/Public/header.tpl" />

<div id="body_box" class="product_detail">
<div id="breadcrumb" class="wrap"><a href="/">Home</a> > <a href="/Wedding-Dresses-c909.html">Wedding Dresses</a> > <a href="/Wedding-Dresses-c918.html">Wedding Dresses</a> > <a href="/Beach-Wedding-Dresses-c919.html">Beach Wedding Dresses</a> > <span>A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck</span></div>
<div class="product_detail">
    <div class="wrap viewimgbox">
        <div class="goods_img">
            <div id="carousel" class="carousel touchcarousel" style="overflow: visible;">
				<notempty name="gallerys">
				<ul class="touchcarousel-container">
				<foreach name="gallerys" item="vo">
				<li class="touchcarousel-item" href="{:build_url($vo,'g_bigimage')}"><img src="{:build_url($vo,'g_bigimage')}" alt="{:build_url($info,'pro_name')}"></li>
				</foreach>
				</ul>
				</notempty>
            </div>
        </div>
        <script>
            function notice_close(){
                    $("#site_notice").css("display","none");
                    SetCookie("noticeisreaded","noticeisreaded");
            }
            $(function() {
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
            });
        </script>
    </div>
	<form name="cart_quantity" id="form_cart_quantity" action="{:U('Products/add_cart')}" method="post">
    <ul class="common_bor_wrap pro_info">
        <li>
            <h2>
                {:build_url($info,'pro_name')}
                <span class="product_itemno">Item Code: {$info.serial}</span>
            </h2>
        </li>
        <li>
            <div class="goods_price_info">
                <span class="price" id="goods_price">{:getprice($info['price'],$info['pricespe'],false)}</span>
				<span class="oldprice">{:getprice_str($info['price'])}</span>
				<span class="pro_discount">{:get_pricediscount($info['pricespe'], $info['price'])}% OFF</span>
			</div>
		</li>        
                <!-- 促销倒计时 开始 -->
				<!--<div class="timelimitbox" endtime="2015/11/01 00:00:00">
					<span class="day_count">2</span>
					<span class="day">days</span>
					<span class="day_seconds">06:37:20</span>
				</div>-->
            <li>
			<input type="hidden" name="id" value="{$info.id}">

			<div class="ship_sel sel_size select" id="sale_property_box">
				<select class="sale_property" id="attr_size" name="attr[Size]">
					<!--<option value="">Size</option>-->
					<notempty name="attrs.Size">
					<option value="{$attrs.Size.attr_value}">{$attrs.Size.attr_value}</option>
					</notempty>
				</select>                
			</div>
			
			<notempty name="related_attrs.Colors">
			<div class="ship_sel sel_color select" id="master_sale_property_box">
			<select class="master_sale_property" id="attr_color" name="attr[Colors]">
				<option value="">Color</option>
				<foreach name="related_attrs.Colors" item="color">
				<option value="{$color.attr_value}__{$color.attr_price}" <if condition="$color.products_id eq $pid">selected="selected"</if>>{$color.attr_value}</option>
				</foreach>
			</select>
			</div>
			</notempty>
			
			<dl class="quantityform_box">
                <dt>QTY:</dt>
                <dd>
                    <div class="quantityform">
                        <a href="javascript:;" class="reduce"></a>
                        <input type="text" value="1" name="count" class="buyskunums" id="buyskunums">
                        <a href="javascript:;" class="plus"></a>
                    </div>
                    <!--<span class="goods_stock">Stock (All:<font id="goods_stock_num">4000</font> pcs.)</span>-->
                </dd>
            </dl>
            <div class="clearboth"></div>
        </li>
		<li>
			<input name="addtocart" type="button" value="Add to my cart" class="common_btn2 addtocart" />
		</li>
        <li class="buyer_comments">
            <a href="javascript:void(0);">
                <span class="buyer_name" id="add_favorites" data_id="{$info.id}"><i></i>Like (<b id="favoritenum">{$profav}</b>)</span>
                <i class="arr"></i>
                <span class="comment_value">({$commnet_count})</span>
                <div class="comment_star review star0" onclick="window.location.href='{:U('Products/comment', array('pid'=>$pid))}'"></div>
            </a>
        </li>
      <script>
            $(function(){
                $("#dollicon").click(function(){
                    $(".copynotice").show().find(".site_notice_content").text(window.location.href+"?source_user=&source=promotion_url")
                })
            })
        </script>        
        <div id="site_notice" class="copynotice" style="display: none">
            <div class="site_notice">
            <a rel="nofollow" href="javascript:;" onclick="notice_close()" class="site_notice_close"></a>
              <div class="site_notice_title">Copy & Share</div>
              <div class="site_notice_content">                
              </div>
            </div>
        </div>
        <script type="text/javascript">var switchTo5x=true;</script>
		<li class="buyer_comments" id="shareicon">
            <i></i>
            Share
            <div class="addthis_sharing_toolbox">
                <a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fm1736.newdemo.zhcart.com%2FA-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html%3Fsource_user%3D%26source%3Dsns_share_facebook&t=US%24%20266.9900%20A-line%20Tiered%20Lace%20Floor-Length%20Ivory%20Bride%20Wedding%20Dress%20with%20Jewel%20Neck" target="_blank"><span class="stButton"><span class="stLarge" style="background-image: url(__CSS__/img/share_facebook.png);"></span></span></a>
                <a href="https://twitter.com/intent/tweet?original_referer=http%3A%2F%2Fm1736.newdemo.zhcart.com%2FA-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html%3Fsource_user%3D%26source%3Dsns_share_twitter&text=US%24%20266.9900%20A-line%20Tiered%20Lace%20Floor-Length%20Ivory%20Bride%20Wedding%20Dress%20with%20Jewel%20Neck&url=http%3A%2F%2Fm1736.newdemo.zhcart.com%2FA-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html%3Fsource_user%3D%26source%3Dsns_share_twitter" target="_blank"><span class="stButton"><span class="stLarge" style="background-image: url(__CSS__/img/share_twitter.png);"></span></span></a>
                <a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fm1736.newdemo.zhcart.com%2FA-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html%3Fsource_user%3D%26source%3Dsns_share_pinterest&media=http%3A%2F%2Fm1736.newdemo.zhcart.com%2Fupload%2Fgoods%2Ftest%2FWeddingDresses%2Ffded5196-2989-47cf-8b2d-27b309c201c7.jpg&description=US%24%20266.9900%20A-line%20Tiered%20Lace%20Floor-Length%20Ivory%20Bride%20Wedding%20Dress%20with%20Jewel%20Neck" target="_blank"><span class="stButton"><span class="stLarge" style="background-image: url(__CSS__/img/share_pinterest.png);"></span></span></a>
                <a href="https://plus.google.com/share?url=http%3A%2F%2Fm1736.newdemo.zhcart.com%2FA-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html%3Fsource_user%3D%26source%3Dsns_share_google" target="_blank"><span class="stButton"><span class="stLarge" style="background-image: url(__CSS__/img/share_google.png);"></span></span></a>
			</div>
        </li>
        <!--share end-->
        <!--<li class="buyer_comments"><a href="/m-product-specificat.html?goods_id=10414">Specifications <i class="arr"></i></a></li>-->
        <li class="buyer_comments"><a href="{:U('Products/desc',array('pid'=>$pid))}">Product Description<i class="arr"></i></a></li>
		<div class="clear10"></div>
        <div class="last similar_products">
            <h3 class="commonh3_3">You May Also Like</h3>
            <div class="similar_products_box" style="overflow:hidden">
				<notempty name="randlist">
				<ul id="similar_products_list" class="common_pro_list2" style="width:2000px;">
				<foreach name="randlist" item="vo">
					<li>
						<a class="pic" href="{:build_url($vo,'pro_url')}"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}"></a>
						<a class="name" href="{:build_url($vo,'pro_url')}">{:build_url($vo,'pro_name')}</a>
						<div class="price">
							<span>{:getprice($vo['price'],$vo['pricespe'],false)}</span>
							<span> </span>
							<span class="oldprice">{:getprice_str($vo['price'])}</span>
						</div>
					</li>
					<div class="select_content" id="skucontent{$vo.id}"  goods_id="{$vo.id}" style="display:none">
						<div class="checkmain"></div>
					</div>
				</foreach>
				</ul>
				</notempty>
                 </ul>
            </div>
            <div class="clear"></div>
        </div>
    </ul>
	</form>
</div>
</div>

<div id="add_cart_box" style="display: none;">
	<div class="add_cart">
		<p>Item has been added to cart</p>
		<p><span id="cart_total_qty" style="color: red;">0</span> item(s) in cart , </p>
		<!--<p>Subtotal: <span id="cart_subtotal" style="color: red;">US$1000</span></p>-->
		<a href="{:U('Cart/index')}" class="go_cart">Go to Cart</a>
		<p class="or">- OR -</p>
		<a href="javascript:void(0);" onclick="$('#add_cart_box').hide();" class="continue">Continue Shopping</a>
	</div>
</div>


<script type="text/javascript">
$('#add_favorites').click(function() {
        var _this = $(this);
        var _val = parseInt($('#favoritenum').text());
        var product_id = _this.attr('data_id');
        var user_id = '{$memberID}';
        if(!user_id) {
            $.Prompt('Login required');
			return false;
        }
		$.post('{:U('Favorite/addfav')}', {id:product_id}, function(data){
			$.Prompt(data.info);
			if(data.status == '1') {
				 _this.find('#favoritenum').text(_val + 1);
			}
		});
    });
</script>
<include file="Themes/default/Public/front_footer.tpl" />

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
