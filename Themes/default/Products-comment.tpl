<!doctype html>
<html>
<head>
<title>{:getprice($info['price'],$info['pricespe'],false)} - {:build_url($info,'pro_name')}</title>
<meta name="keywords" content="{:build_url($info,'pro_name')}" />
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

<div id="body_box" class="product_commentlist">
    <div class="common_top wrap common_reviews_box">
    <div class="reviews_box">
        <div class="reviews_lf">
            <h4>Reviews<i></i></h4>
            <div>
                <div class="star star_b5"></div>
                <span>(0)</span>
            </div>
            <div>
                <div class="star star_b4"></div>
                <span>(0)</span>
            </div>
            <div>
                <div class="star star_b3"></div>
                <span>(0)</span>
            </div>
            <div>
                <div class="star star_b2"></div>
                <span>(0)</span>
            </div>
            <div>
                <div class="star star_b1"></div>
                <span>(0)</span>
            </div>
        </div>
        <div class="fl review_goods">
            <a href="{:U('Products/detail', array('pid'=>$pid))}" class="name">{$info.name}</a>
            <div class="price">{:getprice($info['price'],$info['pricespe'],false)}</div>
            <div class="goods_star">
                <span>Overall Rating:</span>
                <div class="star star_b0"></div>
            </div>
            <a class="whitereview">White a review</a>
        </div>
    </div>
    <div class="clear10"></div>
    <ul class="reviewers">
		<empty name="comment">
		<li>Sorry, we have not found any info.</li>
		<else/>
		<foreach name="comment" item="vo">
		<li>
			<span class="time">{$vo.name}<span>{$vo.dateline|date="m/d/Y",###}</span></span> 
			<h4>{$vo.content}</h4>
			<div class="replay"><span>{$vo.replay}</span></div>
		</li>
		</foreach>
		</empty>
	</ul>
    <div class="clear"></div>
    <!--<div id="page_box">
            <a href="#" class="actived">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#" class="colon">···</a>
            <a href="#">48</a>
            <a href="#" class="next"> Next<i></i></a>
        </div>-->
    <div class="create_rev" id="newform">
        <h3 class="commonh3_1 tit">Create your own review.</h3>
    </div>
    <form class="rev_form" action="{:U('Products/add_comment')}" method="post" id="review_form">
        <input type="hidden" name="products_id" id="products_id" value="{$pid}">
		<input type="hidden" name="type" id="comment_type" value="Review">
		<p>
            <label class="form_label">User Name: <span class="red">*</span></label>
            <input type="text" name="name" class="form_txt">
        </p>
		<p>
            <label class="form_label">Email: <span class="red">*</span></label>
            <input type="text" name="email" class="form_txt">
        </p>
        <p>
            <label class="form_label"> Comment Rank: <span class="red">*</span></label>
            <input name="star" value="1" type="radio"/> <label>1</label> &nbsp;&nbsp;
            <input name="star" value="2" type="radio"/> <label>2</label> &nbsp;&nbsp;
            <input name="star" value="3" type="radio"/> <label>3</label> &nbsp;&nbsp;
            <input name="star" value="4" type="radio"/> <label>4</label> &nbsp;&nbsp;
            <input name="star" value="5" type="radio" checked="checked"/><label>5</label>
        </p>
        <div>
            <label class="form_label" >Content: <span class="red">*</span></label>
            <div>
                <textarea name="content" class="textarea"></textarea>
            </div>
        </div>
        <div class="clear10"></div>
		<div>
            <label class="form_label">Code: <span class="red">*</span></label>
            <input type="text" name="code" class="codeno">
            <img id="validateImg" src="{:U('Public/verify')}" height="42" onclick="this.src='/index.php?s=/Public/verify/t/'+new Date().getTime()+'.html'" />
            <div class="clear10"></div>
        </div>
        <input type="button" value="Submit" class="common_btn2" />
        <div class="clear"></div>
        <input type="reset" value="Reset" class="common_btn1" />
    </form>
    <div class="clear10"></div>
</div>
<script type="text/javascript">
$(function(){
    $('.common_btn2').click(function(){
        var nickname = $('input[name="name"]');
        var email = $('input[name="email"]');
        var content = $('textarea[name="content"]');
        var code = $("input[name='code']");
        var email_reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		
        if (!nickname.val()){
            $.Prompt('Please enter your name');
            return false;
        }
		if(email.val() == '' || !email_reg.test(email.val())) {
			 $.Prompt('Please fill in the email correctly.');
			return false;  
		}
        if (!content.val()){
            $.Prompt('Please enter content');
            return false;
        }
		if (!code.val()){
            $.Prompt('Please enter verification code');
            return false;
        }
		
		var _form = $("#review_form");
		$.post(_form.attr('action'), _form.serialize(), function(data){
			$.Prompt(data.info);
			if(data.status == '1') {
				window.location.href = "{:U('Products/detail', array('pid'=>$pid))}";
			}
		});
		
    });
    $('.whitereview').click(function() {
        var id_str = "#newform";
        $("body,html").animate({scrollTop: ($(id_str).offset().top - 56)}, 300);
    });
});
</script>

</div>

<include file="Themes/default/Public/front_footer.tpl" />

<script type="text/javascript">
    $(window).resize(function() {
        reLayout(".common_pro_list1", 400, 400);
    });
    reLayout(".common_pro_list1", 400, 400);
</script>

</body>
</html>
