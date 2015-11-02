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
<link href__CSS__css/tips.css" type="text/css"  rel="stylesheet" />
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
            });
        </script>
    </div>
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
				<select class="sale_property" name="attr[Size]">
					<option value="">Size</option>
					<notempty name="attrs.Size">
					<option value="{$attrs.Size.attr_value}">{$attrs.Size.attr_value}</option>
					</notempty>
				</select>                
			</div>
			
			<notempty name="related_attrs.Colors">
			<div class="ship_sel sel_color select" id="master_sale_property_box">
			<select class="master_sale_property" name="attr[Colors]">
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
                    <form class="quantityform">
                        <a href="javascript:;" class="reduce"></a>
                        <input type="text" value="1" name="count" class="buyskunums" id="buyskunums">
                        <a href="javascript:;" class="plus"></a>
                    </form>
                    <!--<span class="goods_stock">Stock (All:<font id="goods_stock_num">4000</font> pcs.)</span>-->
                </dd>
            </dl>
            <div class="clearboth"></div>
        </li>
		<li><button class="common_btn2 addtocart">Add to my cart</button></li>
        <div id="add_cart_box" style="display: none;">
            <div class="add_cart">
                <p>Item has been added to cart</p>
                <p><span id="cart_total_qty" style="color: red;">10</span> item(s) in cart , </p>
                <p>Subtotal: <span id="cart_subtotal" style="color: red;">US$1000</span></p>
                <a href="/m-cart-list.html" class="go_cart">Go to Cart</a>
                <p class="or">- OR -</p>
                <a href="javascript:void(0);" onclick="$('#add_cart_box').hide();" class="continue">Continue Shopping	</a>
            </div>
        </div>
        <li class="buyer_comments">
            <a href="javascript:void(0);">
                <span class="buyer_name"  id="add_favorites" data_id="10414"><i></i>Like (<b id="favoritenum">0</b>)</span>
                <i onclick="window.location.href='/Comment/p10414/list-r1.html'" class="arr"></i>
                <span class="comment_value">(0)</span>
                <div class="comment_star review star0" onclick="window.location.href='/Comment/p10414/list-r1.html'"></div>
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
        <li class="buyer_comments"><a href="/m-product-specificat.html?goods_id=10414">Specifications <i class="arr"></i></a></li>
        <li class="buyer_comments"><a href="/descript-10414.html">Product Description<i class="arr"></i></a></li>
		<div class="clear10"></div>
        <div class="last similar_products">
            <h3 class="commonh3_3">You May Also Like</h3>
            <div class="similar_products_box" style="overflow:hidden">
                <ul id="similar_products_list" class="common_pro_list2"  style="width:2000px;">
                    
                     <li>
    <a class="pic" href="/Sexy-Mermaid-Ivory-Lace-Sweet-Heart-Detachable-Wedding-Gown-p10391.html" title="Sexy Mermaid Ivory Lace Sweet Heart Detachable Wedding Gown"><img src="/upload/thumb/400x400/goods/test/wedding/Sexy-Mermaid-Ivory-Lace-Sweet-Heart-Detachable-Wedding-Gown-419515-2038055.jpg" alt="Sexy Mermaid Ivory Lace Sweet Heart Detachable Wedding Gown" title="Sexy Mermaid Ivory Lace Sweet Heart Detachable Wedding Gown"></a>
    <a class="name" href="/Sexy-Mermaid-Ivory-Lace-Sweet-Heart-Detachable-Wedding-Gown-p10391.html" title="Sexy Mermaid Ivory Lace Sweet Heart Detachable Wedding Gown">Sexy Mermaid Ivory Lace Sweet Heart Detachable Wedding Gown</a>
    <div class="price">
        <span>US$ 239.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10391"  goods_id="10391" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Ivory-Chapel-Train-Applique-Pleated-Bridal-Wedding-Gown-With-Jewel-Neck-p10392.html" title="Ivory Chapel Train Applique Pleated Bridal Wedding Gown With Jewel Neck"><img src="/upload/thumb/400x400/goods/test/wedding/d6b8a047-f09b-4dbe-8047-a6624c21749e.jpg" alt="Ivory Chapel Train Applique Pleated Bridal Wedding Gown With Jewel Neck" title="Ivory Chapel Train Applique Pleated Bridal Wedding Gown With Jewel Neck"></a>
    <a class="name" href="/Ivory-Chapel-Train-Applique-Pleated-Bridal-Wedding-Gown-With-Jewel-Neck-p10392.html" title="Ivory Chapel Train Applique Pleated Bridal Wedding Gown With Jewel Neck">Ivory Chapel Train Applique Pleated Bridal Wedding Gown With Jewel Neck</a>
    <div class="price">
        <span>US$ 212.49</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10392"  goods_id="10392" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Sweetheart-Backless-Satin-Short-Wedding-Dress-with-Sash-p10394.html" title="Sweetheart Backless Satin Short Wedding Dress with Sash"><img src="/upload/thumb/400x400/goods/test/wedding/Knee-Length-Cut-Out-Wedding-Dress-For-Bride-With-Sweetheart-Neck-466435-2305439.jpg" alt="Sweetheart Backless Satin Short Wedding Dress with Sash" title="Sweetheart Backless Satin Short Wedding Dress with Sash"></a>
    <a class="name" href="/Sweetheart-Backless-Satin-Short-Wedding-Dress-with-Sash-p10394.html" title="Sweetheart Backless Satin Short Wedding Dress with Sash">Sweetheart Backless Satin Short Wedding Dress with Sash</a>
    <div class="price">
        <span>US$ 101.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10394"  goods_id="10394" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Ivory-Strapless-Floral-Wedding-Dress-with-Sash-p10395.html" title="Ivory Strapless Floral Wedding Dress with Sash"><img src="/upload/thumb/400x400/goods/test/wedding/d51d1b7e-c5c1-4d7b-9fa1-974415ce9236.jpg" alt="Ivory Strapless Floral Wedding Dress with Sash" title="Ivory Strapless Floral Wedding Dress with Sash"></a>
    <a class="name" href="/Ivory-Strapless-Floral-Wedding-Dress-with-Sash-p10395.html" title="Ivory Strapless Floral Wedding Dress with Sash">Ivory Strapless Floral Wedding Dress with Sash</a>
    <div class="price">
        <span>US$ 263.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10395"  goods_id="10395" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/High-Quality-Chiffon-Wedding-Dress-p10397.html" title="High Quality Chiffon Wedding Dress"><img src="/upload/thumb/400x400/goods/test/wedding/36974559-bf2d-466b-b340-98de9632c9ba%2520%25281%2529.jpg" alt="High Quality Chiffon Wedding Dress" title="High Quality Chiffon Wedding Dress"></a>
    <a class="name" href="/High-Quality-Chiffon-Wedding-Dress-p10397.html" title="High Quality Chiffon Wedding Dress">High Quality Chiffon Wedding Dress</a>
    <div class="price">
        <span>US$ 182.15</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10397"  goods_id="10397" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Exquisite-Beaded-Sheer-Neckline-Short-Sleeve-Wedding-Dress-with-Translucent-Detachable-Cape-p10402.html" title="Exquisite Beaded Sheer Neckline Short Sleeve Wedding Dress with Translucent Detachable Cape"><img src="/upload/thumb/400x400/goods/test/WeddingDresses/4c6afb50-d52f-4d59-8532-56c4f4650743.jpg" alt="Exquisite Beaded Sheer Neckline Short Sleeve Wedding Dress with Translucent Detachable Cape" title="Exquisite Beaded Sheer Neckline Short Sleeve Wedding Dress with Translucent Detachable Cape"></a>
    <a class="name" href="/Exquisite-Beaded-Sheer-Neckline-Short-Sleeve-Wedding-Dress-with-Translucent-Detachable-Cape-p10402.html" title="Exquisite Beaded Sheer Neckline Short Sleeve Wedding Dress with Translucent Detachable Cape">Exquisite Beaded Sheer Neckline Short Sleeve Wedding Dress with Translucent Detachable Cape</a>
    <div class="price">
        <span>US$ 425.60</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10402"  goods_id="10402" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/One-Shoulder-Tulle-Wedding-Dress-With-Flowers-Detailing-p10403.html" title="One-Shoulder Tulle Wedding Dress With Flowers Detailing"><img src="/upload/thumb/400x400/goods/test/WeddingDresses/13c19269-6c05-41a6-b327-a47c1ee5df62.jpg" alt="One-Shoulder Tulle Wedding Dress With Flowers Detailing" title="One-Shoulder Tulle Wedding Dress With Flowers Detailing"></a>
    <a class="name" href="/One-Shoulder-Tulle-Wedding-Dress-With-Flowers-Detailing-p10403.html" title="One-Shoulder Tulle Wedding Dress With Flowers Detailing">One-Shoulder Tulle Wedding Dress With Flowers Detailing</a>
    <div class="price">
        <span>US$ 194.88</span>
        <span> </span>        <span class="oldprice">US$ 243.60</span>    </div>
              
       <div class="discount"><span>20%</span>OFF</div>
    </li>

<div class="select_content" id="skucontent10403"  goods_id="10403" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Court-Train-Ivory-Wedding-Dress-For-Bride-with-V-Neck-Mermaid-Buttons-p10406.html" title="Court Train Ivory Wedding Dress For Bride with V-Neck Mermaid Buttons"><img src="/upload/thumb/400x400/goods/test/WeddingDresses/d3731d8a-4ade-46b5-a47a-4b0bfff080cf.jpg" alt="Court Train Ivory Wedding Dress For Bride with V-Neck Mermaid Buttons" title="Court Train Ivory Wedding Dress For Bride with V-Neck Mermaid Buttons"></a>
    <a class="name" href="/Court-Train-Ivory-Wedding-Dress-For-Bride-with-V-Neck-Mermaid-Buttons-p10406.html" title="Court Train Ivory Wedding Dress For Bride with V-Neck Mermaid Buttons">Court Train Ivory Wedding Dress For Bride with V-Neck Mermaid Buttons</a>
    <div class="price">
        <span>US$ 322.11</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10406"  goods_id="10406" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/Beading-Chapel-Train-Ivory-Bridal-Wedding-Gown-with-A-line-Strapless-Neck-p10408.html" title="Beading Chapel Train Ivory Bridal Wedding Gown with A-line Strapless Neck"><img src="/upload/thumb/400x400/goods/test/WeddingDresses/181a01cc-2e4d-48e3-a403-d950c62406d5%2520%25281%2529.jpg" alt="Beading Chapel Train Ivory Bridal Wedding Gown with A-line Strapless Neck" title="Beading Chapel Train Ivory Bridal Wedding Gown with A-line Strapless Neck"></a>
    <a class="name" href="/Beading-Chapel-Train-Ivory-Bridal-Wedding-Gown-with-A-line-Strapless-Neck-p10408.html" title="Beading Chapel Train Ivory Bridal Wedding Gown with A-line Strapless Neck">Beading Chapel Train Ivory Bridal Wedding Gown with A-line Strapless Neck</a>
    <div class="price">
        <span>US$ 566.00</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10408"  goods_id="10408" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                     <li>
    <a class="pic" href="/A-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html" title="A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck"><img src="/upload/thumb/400x400/goods/test/WeddingDresses/fded5196-2989-47cf-8b2d-27b309c201c7.jpg" alt="A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck" title="A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck"></a>
    <a class="name" href="/A-line-Tiered-Lace-Floor-Length-Ivory-Bride-Wedding-Dress-with-Jewel-Neck-p10414.html" title="A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck">A-line Tiered Lace Floor-Length Ivory Bride Wedding Dress with Jewel Neck</a>
    <div class="price">
        <span>US$ 266.99</span>
        <span> </span>    </div>
        </li>

<div class="select_content" id="skucontent10414"  goods_id="10414" style="display:none">
    <div class="checkmain"></div>
</div>

                    
                 </ul>
            </div>
            
            <div class="clear"></div>
        </div>
    </ul>
</div>
<script type="text/javascript">
$(function(){
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
});
</script>
<script>
        var CountryDialog;
       $('#yourCurrency').click(function(){
           
            if(!CountryDialog)
            {
                CountryDialog = $('.valide_coupon_box').dialog({
                    drag: 'div.title_box',
                    buttons: '.close_coupon_box',
                    noLeft: true,
                }); 
            }
            CountryDialog.open();         
       });
    $(".select_country_btn").click(function(){
            var _cut = $('#cursel').val();		
            $.ajax({
                type: 'GET',
                url: '/h-Module-changeMyDelivery.html?code='+_cut,
                data: '',
                    complete: function() {},
                    success: function(data) {
                        if(data!=''&&data==1){
                            location.href=location.href;
                        }
                    },
                    error: function() {}
            });
            $this.removeClass('open');
            return false;
       });
    $('.master_sale_property').change(function() {
        var _obj = $(".product_detail");
        var property_id = $(this).val();
        var sale_property_id = _obj.find("input[name='sale_property_id']").val();
        var spec = 1;
        if (!property_id)
        {
            _obj.find("select[name='sale_property']").find('option').each(function(index) {
                $(this).removeAttr('disabled');
            });
            return;
        }
        var skulist = eval("(" + _obj.find("input[name='skulist']").val() + ")");
        var sku_array = new Object();

        $.each(skulist, function(index, item) {
            sku_array[item.sku_code] = item;
        });
        
        var sale_property_select = _obj.find("select[name='sale_property']");
        sale_property_select.find('option').each(function(index) {
            spec = 0;
            if ($(this).attr('value'))
            {
                var sku_code = property_id + "_" + $(this).attr('value');
                if (sku_array[sku_code])
                {
                    if (sku_array[sku_code].status > 0 && sku_array[sku_code].stock_nums > 0)
                    {
                        $(this).removeAttr('disabled');
                        if ($(this).attr('selected') == 'selected')
                        {
                            $('#goods_price').html('US$ '+ sku_array[sku_code].price);
                            $('#goods_stock_num').html(sku_array[sku_code].stock_nums);
                        }
                    }
                    else
                    {
                        if ($(this).attr('selected') == 'selected')
                        {
                            sale_property_select.val('');
                            $("input[name='sale_property_id']").val("")
                        }
                        $(this).attr('disabled', 'disabled');
                    }
                }
                else
                {
                    $(this).attr('disabled', 'disabled');
                }
            }
        });
        $("input[name='master_sale_property_id']").val(property_id);
        if(spec)
        {
            $('#goods_price').html('US$ '+ sku_array[property_id + "_0"].price);
            $('#goods_stock_num').html(sku_array[property_id + "_0"].stock_nums);
        }
    });
    $("select[name='sale_property']").change(function() {
        var _obj = $(".product_detail");
        var property_id = $(this).val();
        var master_sale_property_id = _obj.find("input[name='master_sale_property_id']").val();
        var spec = 1;
        if (!property_id)
        {
            _obj.find("select[name='master_sale_property']").find('option').each(function(index) {
                $(this).removeAttr('disabled');
            });
            return;
        }
        var skulist = eval("(" + _obj.find("input[name='skulist']").val() + ")");
        var sku_array = new Object();
        $.each(skulist, function(index, item) {
            sku_array[item.sku_code] = item;
        });
        
        var master_sale_property_select = _obj.find("select[name='master_sale_property']");
        master_sale_property_select.find('option').each(function(index) {
            if ($(this).attr('value'))
            {
                spec = 0;
                var sku_code = $(this).attr('value') + "_" + property_id;
                if (sku_array[sku_code])
                {
                    if (sku_array[sku_code].status > 0 && sku_array[sku_code].stock_nums > 0)
                    {
                        $(this).removeAttr('disabled');
                        if ($(this).attr('selected') == 'selected')
                        {
                            $('#goods_price').html('US$ '+ sku_array[sku_code].price);
                            $('#goods_stock_num').html(sku_array[sku_code].stock_nums);
                        }
                    }
                    else
                    {
                        if ($(this).attr('selected') == 'selected')
                        {
                            master_sale_property_select.val('');
                            $("input[name='master_sale_property_id']").val("");
                        }
                        $(this).attr('disabled', 'disabled');
                    }
                }
                else
                {
                    $(this).attr('disabled', 'disabled');
                }
            }
        });
        $("input[name='sale_property_id']").val(property_id);
        if(spec)
        {
            $('#goods_price').html('US$ '+ sku_array["0_" + property_id].price);
            $('#goods_stock_num').html(sku_array["0_" + property_id].stock_nums);
        }
    });

    $('.addtocart').click(function(e) {
        var goods_id = '10414';
        var master_sale_id = $('#master_sale_property_id').val();
        var sale_id = $('#sale_property_id').val();
        var qty = $('#buyskunums').val();
        var exist_master_sale = $('#master_sale_property_box').is(":visible")
        var exist_sale = $('#sale_property_box').is(":visible");
        var cart_count = $('#shopping_cart_count').text();

        if (exist_master_sale && !master_sale_id) {
            $.Prompt('Please select Color');
        }
        else if (exist_sale && !sale_id)
        {
            $.Prompt('Please select Size');
        }
        else
        {
            $.ajax({
                url: '/m-cart-ajaxAdd.html',
                type: 'POST',
                data: {
                    goods_id: goods_id,
                    sale_id: sale_id,
                    qty: qty,
                    master_sale_id: master_sale_id
                },
                dataType: 'json',
                cache: false,
                success: function(res) {
                    if (res.status == 1) {
                        $('#shopping_cart_count').text(parseInt(cart_count) + parseInt(res.offset));
                        $('#cart_total_qty').text(res.totalqty);
                        $('#cart_subtotal').text('US$ ' + res.totalprice);
                        var windowWidth = document.documentElement.clientWidth;
                        var windowHeight = document.documentElement.clientHeight;
                        var popupHeight = $("#add_cart_box").height();
                        var popupWidth = $("#add_cart_box").width();
                        $("#add_cart_box").css({"top": (windowHeight - popupHeight) / 2 + $(document).scrollTop()});
                        $('#add_cart_box').show().delay(30000).fadeOut(1000);
                        //alert('success');
                    } else {
                        $.Prompt(res.msg);
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
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

    $('#add_favorites').click(function() {
        var _this = $(this);
        var _val = parseInt($('#favoritenum').text());
        var goods_id = _this.attr('data_id');
        var user_id = '';
        if (!user_id)
        {
            $.Prompt('Login required');
        }
        else
        {
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
</script>
</div>
<div id="bottom_box">
    <!--<div class="wrap">
        <div class="searchform_box">
            <form id="autocomplete-submit" class="searchform" action="/m-product-search.html" method="get">
                <input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax2" class="search_input"  value=""/>
                <input type="submit"  value="" id="btn-autocomplete2" class="btn_search" />
            </form>
        </div>
    </div>-->
    <script>
        $('#autocomplete-ajax2').autocomplete({
            serviceUrl: '/m-product-autocomplete.html',
            onSelect: function(suggestion) {
                var keywords = $('#autocomplete-ajax2').val();
                keywords = encodeURIComponent(suggestion.value);
                window.location.href = "/Search/" + keywords + "/list-r1.html";
            }
        });
        $('#btn-autocomplete2').click(function() {
            var keywords = $('#autocomplete-ajax2').val();
			if(keywords == ""){
				$.Prompt('Please enter a keyword!');
				return false;
			}
            keywords = encodeURIComponent(suggestion.value);
            $('#autocomplete-submit2').attr('action', '/Search/' + keywords + '/list-r1.html');
        });
    </script>



    <div class="clear15"></div>
    <div class="wrap">
        <form class="newletterform">
            <label>Subscribe To Our Newsletter</label>
            <input  name="Newsletter_Email" type="text" value="Your Email Address" id="email"  class="newsletter_txt"/>
            <input name="" type="button" value="Subscribe" class="common_btn1 newsletter_btn" />
        </form>
    </div>

    <script type="text/javascript">
        $('.newsletter_btn').click(function() {
            if ($('#email').val() == '' || $('#email').val() == 'Your Email Address')
            {
                $.Prompt('Please Enter Your Email Address!');
                return;
            }
            $isvalidemail = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test($('#email').val());
            if (!$isvalidemail)
            {
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
        $("#email").click(function() {
            if ($(this).val() == "Your Email Address")
                $(this).val("");
        })
    </script>


    <div class="clear"></div>
    
	<include file="Themes/default/Public/front_footer.tpl" />
</div>

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
