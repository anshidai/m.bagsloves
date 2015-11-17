<!doctype html>
<html>
<head>
<title>Search</title>
<meta content="charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="false" id="twcClient" name="twcClient" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="__CSS__/style.css">
<link href="__CSS__/tips.css" type="text/css"  rel="stylesheet" />
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
<div id="body_box" class="search_default">
    <div id="header_box" class="common_top" style="display:block">
<div class="wrap">
    <div class="searchdefaultform_box">
        <form id="autocomplete-submit" class="searchform" method="get">
            <input type="button" class="btn_home" value="" onclick="location.href='/'" />
            <input type="text" name="keywords" autocomplete="off" id="autocomplete-ajax" class="search_input" placeholder="" value=""/>
            <input type="button" value="" id="btn-autocomplete" class="btn_search" />
        </form>
    </div>
</div>
</div>
<script>
var search_key = "";
$("input[name=keywords]").focus(function(){
    if($(this).val()==search_key) {
        $(this).val('');
    }                            
}); 

/*
$('#autocomplete-ajax').autocomplete({
    serviceUrl: '/m-product-autocomplete.html',
    onSelect: function(suggestion) {
        var keywords = $('#autocomplete-ajax').val();
        keywords = encodeURIComponent(suggestion.value);
        window.location.href = "/Search/" + keywords + "/list-r1.html";
    }
});
*/
$('#btn-autocomplete').click(function() {
	var keywords = $('#autocomplete-ajax').val();
    if(keywords == ""){
        $.Prompt('Please enter a keyword!');
        return false;
    }
    keywords = encodeURIComponent(keywords);
	url = '/index.php?s=/search/index/k/'+keywords+'.html';
	window.location.href = url;
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
<div class="clear"></div>
<div class="common_top common_word_box common_account_box">
	<div class="reg_box_third historykeywords">
    	<h3 class="commonh3_2 common_nav">
            <a href="javascript:;" class="bor_rt on">Hot</a><i></i><a href="javascript:;" class="bor_lf">History</a>
            <div  class="clearboth"></div>
        </h3>
        <div class="sddiv">
			<ul></ul>
        </div>
		
       <div class="sddiv" style="display:none">
			<ul>
            <li>
                <div class="wrap"><a class="search_clear_btn common_btn2" style="margin:10px 0" href="/m-search-clearhistory.html">Clear History</a></div>
            </li>
			<li><a href="/Search/dressde/list-r1.html">dressde</a></li>
			<li><a href="/Search/dress/list-r1.html">dress</a></li>
			</ul>
         </div>   
    </div>
</div>
<div class="clear15"></div>
<script type="text/javascript">
    $(function() {
        $(".common_nav a").click(function(){
            var ind = $(this).index();
            ind = ind > 0 ? ind - 1 : ind;
            $(this).addClass("on").siblings().removeClass("on")
            $(".sddiv").eq(ind).show().siblings(".sddiv").hide()
        })
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
