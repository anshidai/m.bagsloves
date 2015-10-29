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
<div id="next_page">{:U('Cate/lists', array('cid'=>$cateinfo['id'],'p'=>$_GET['p']+1))}</div>