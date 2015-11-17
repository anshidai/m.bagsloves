<!doctype html>
<html>
<head>
<title>Search Products</title>
<meta name="keywords" content="Search Products" />
<meta name="description" content="Search Products" />
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

<notempty name="list">

<div id="body_box" class="product_list">
	<div class="wrap pro_box">
        <div class="clearboth"></div>
        <div class="view_list_box">
        	<div class="all_pro">{$count} Item(s)</div>
            <div class="view_choose">
			<form class="sortby select" method="post">
				<select name="sort" id="sort_form" class="changegourl" onchange="this.form.submit();">
					<option value="id" <if condition="$sort eq 'id'">selected="selected"</if>>Sort by id</option>
					<option value="name" <if condition="$sort eq 'name'">selected="selected"</if>>Sort by name</option>
					<option value="price" <if condition="$sort eq 'price'">selected="selected"</if>>Sort by price</option>
					<option value="dateline" <if condition="$sort eq 'dateline'">selected="selected"</if>>Sort by update</option>
				</select><select name="by" id="by_form" class="changegourl" onchange="this.form.submit();">
					<option value="desc" <if condition="$by eq 'desc'">selected="selected"</if>>Desc</option>
					<option value="asc" <if condition="$by eq 'asc'">selected="selected"</if>>Asc</option>
				</select>
			</form>
            </div>
        </div>
        <div class="clearboth"></div>
        <div class="select_box" style="display:none"></div>
        <ul class="common_pro_list1" id="product_list">
		<notempty name="list">
		<foreach name="list" item="vo">
			<li>
				<a class="pic" href="{:build_url($vo,'pro_url')}"><img src="{:build_url($vo,'pro_smallimage')}" alt="{:build_url($vo,'pro_name')}"></a>
				<a class="name" href="{:build_url($vo,'pro_url')}">{:build_url($vo,'pro_name')}</a>
				<div class="price">
					<span>{:getprice($vo['price'],$vo['pricespe'],false)}</span>
					<span> </span>
					<span class="oldprice">{:getprice_str($vo['price'])}</span>
				</div>
			   <!--<div class="discount"><span>20%</span>OFF</div>-->
			</li>
			<div class="select_content" id="skucontent{$vo.id}" goods_id="{$vo.id}" style="display:none">
			<div class="checkmain"></div>
			</div>
		</foreach>
		</notempty>
		</ul>
        <script>
            $(function(){
                $(".select_content").css("left",(parseInt($("html").width()) - 300)/2 + "px");
                $(".select_box").height($("html").height());
            });
        </script>
        <div class="clear10"></div>
        <a href="javascript:;" class="viewmore listviewmore">View More >></a>
        <div class="clear10"></div>
    </div>
<script type="text/javascript">

$(document).ready(function(){
	var totalpage = {$totalpage};
	var curr_page = 1;
	var is_loading = false;
	var next_page='{:U('Search/index',array('k'=>$k, 'p'=>2))}';
	$(window).scroll(function(){
		if(($(window).scrollTop()+$(window).height()+1200)>=$(document.body).height()) {
			if(curr_page<totalpage && !is_loading) {
				$('.mask_wait_box').show();
				is_loading = true;
				$.get(next_page, {ajax:1}, function(data) {
					if(data) {
						curr_page = curr_page+1;
					  $('#product_list').append(data);                                              
					  $('.mask_wait_box').hide();
					  reLayout("#product_list",200,200);
					  is_loading = false;
					  next_page = $('#next_page').html();
					  $('#next_page').remove();
					}else {
						$('.mask_wait_box').hide();
						  $.Prompt('Error loading!');
						  is_loading = false;
					}
				});
			}
			else {
				//$.Prompt('Already in the end portion of the page!');
				$('.listviewmore').html('Already in the end portion of the page!');
			}
		}
	});
	$('.listviewmore').click(function(){
		if(curr_page<totalpage && !is_loading) {
			$('.mask_wait_box').show();
			is_loading=true;
			
			$.get(next_page, {ajax:1}, function(data){
				if(data) {
					curr_page = curr_page+1;
					$('#product_list').append(data);                                              
					$('.mask_wait_box').hide();
					reLayout("#product_list");
					is_loading = false;
					next_page = $('#next_page').html();
					$('#next_page').remove();
				}else {
					 $('.mask_wait_box').hide();
					  $.Prompt('Error loading!');
					  is_loading = false;
				}
			});
		}
		else {
			//$.Prompt('Already in the end portion of the page!');
			$('.listviewmore').html('Already in the end portion of the page!');
		}
	});
});
   
</script>

</div>


<else/>
<div class="wrap common_top common_success_box" id="body_box">
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <dl>
        <dt class="success_icon3"><p><i></i>Please enter the words</p></dt>
        <dd><a href="{:U('Search/default')}">[<u>Click here to return previous page</u>]</a></dd>
        <script>
			//setTimeout("window.location.href='{:U('Search/default')}'", 3000);
		</script> 
        </dl>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
    <div class="clear15"></div>
</div>

</notempty>

<script type="text/javascript">
$(function() {
	function close_dialog() 
	{
		if (window.parent != window.self) {
			//弹出框
			if (window.top != window.parent.self) {
				//左侧弹出框
				window.parent.location.reload();
			} else {
				if (window.top.right != window.self) {
					//全局弹出框
					window.top.right.location.reload();
					window.top.art.dialog({id: ""}).close();
				} else {
					//非弹出框
					window.location.reload();
				}
			}
		} else {
			//非弹出框
			window.location.reload();
		}
	}
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
