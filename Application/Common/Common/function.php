<?php 

if (isset($_GET['GLOBALS']) ||isset($_POST['GLOBALS']) ||  isset($_COOKIE['GLOBALS']) || isset($_FILES['GLOBALS'])) {
	die;
}
if (@ini_get('magic_quotes_sybase') != 0) @ini_set('magic_quotes_sybase', 0);


/**
 * 返回存储的值
 *
 * @param String $valuename 名称
 * @return String 值
 */
function GetValue($valuename, $cache = true)
{
	if (S('S_'.$valuename) == '' || !$cache) {
		$setting = D('Setting');
		$map['valuename'] = $valuename;
		$settInfo = $setting->where($map)->find();
		if(false == $settInfo) {
			return  null;
		}
		else {
			if(get_magic_quotes_runtime()) {
				$settInfo['valuetxt'] = stripslashes($settInfo['valuetxt']);
			}
			S('S_'.$valuename,$settInfo['valuetxt']);
			return S('S_'.$valuename);
		}
	}
	return S('S_'.$valuename);
}

//获取货币
function get_currencies_arr()
{
	$currencies = S('S_CURRENCIES');
	if(empty($currencies)){
		$currencies = D('Currencies')->where('status=1')->order('sort desc')->select();
		S('S_CURRENCIES', $currencies);
	}
	return $currencies;
}

function get_members_group($uid)
{
	$points = get_members_points($uid);
	$list = D('MembersGroup')->where("maxpoints>='$points' AND minpoints<='$points'")->find();
	return $list? $list: null;
}

function get_members_points($uid)
{
	$list = D("Members")->where("id='$uid'")->find();
	return $list? $list["points"]: 0;
}

//调用购物车购买数量
function itemCount()
{
	$num_total = D('Cart')->get_item_count(session('sessionID'));
	return $num_total? $num_total: 0;
}

function build_url($vo, $type)
{
	switch($type) {
		case 'pro_url':
			$url = U('Products/detail', array('pid'=>$vo['id']));
			return $url;
		case 'pid':
			$url = U('Products/detail', array('pid'=>$vo['id']));
			return $url;
		case 'products_id':
			$url = U('Products/detail', array('pid'=>$vo['products_id']));
			return $url;
		case 'pro_name':
			return $vo['name'];
		case 'pro_smallimage':
			$vo['smallimage'] = ltrim($vo['smallimage'], './');
			return IMG_DOMAIN.'/'.$vo['smallimage'];
		case 'pro_bigimage':
			$vo['bigimage'] = ltrim($vo['bigimage'], './');
			return IMG_DOMAIN.'/'.$vo['bigimage'];
		case 'altimg':
			if(GetValue('isBigimg')==0){
				return '';
			}
			$vo['bigimage'] = ltrim($vo['bigimage'], './');
			return IMG_DOMAIN.'/'.$vo['bigimage'];
		case 'pro_price':
			return getprice($vo['price'],$vo['pricespe']);//特价表示
			//return $vo['price'];
		case 'pro_pricespe':
			return $vo['pricespe'];
		case 'cate_url':
			return $url=U('Cate/index', array('cid'=>$vo['id']));
		case 'cate_list_url':
			return $url=U('Cate/lists', array('cid'=>$vo['id']));
		case 'cate_name':
			return $vo['name'];
		case 'ad_name':
			return $vo['name'];
		case 'ad_remark':
			return $vo['remark'];
		case 'ad_link':
			return $vo['link'];
		case 'ad_img':
			$vo['imgurl'] = ltrim($vo['imgurl'], './');
			return IMG_DOMAIN.'/'.$vo['img_url'];
		case 'article_url':
			return U('Article/index',array('id'=>$vo['id']));
		case 'article_title':
			return $vo['title'];
		case 'article_dateline':
			return date('Y-m-d H:i:s',$vo['dateline']);
		case 'cate_img':
			$vo['imgurl'] = ltrim($vo['imgurl'], './');
			return IMG_DOMAIN.'/'.$vo['imgurl'];
		case 'g_bigimage':
			$vo['img_url'] = ltrim($vo['img_url'], './');
			return IMG_DOMAIN.'/'.$vo['img_url'];
		case 'g_smallimage':
			$vo['thumb_url'] = ltrim($vo['thumb_url'], './');
			return IMG_DOMAIN.'/'.$vo['thumb_url'];
		case 'hotmail'://msn
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]="msnim:chat?contact=".$v;
		}
		return $r;
		case 'yahoo'://yahoo
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]="ymsgr:sendIM?".$v;
		}
		return $r;
		case 'email'://email
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]="mailto:".$v;
		}
		return $r;
		case 'skype'://skype
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){ 
			$r[$v]="callto://".$v;
		}
		return $r;
		case 'qq'://qq
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]="tencent://Message/?Menu=YES&Uin=".$v."&websiteName=im.qq.com";
		}
		return $r;
		case 'gtalk'://gtalk
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]="gtalk:chat?jid=".$v."&from_jid=";
		}
		return $r;
		case 'tel'://tel
		$r=array();
		foreach (explode(',',$vo) as $k=>$v){
			$r[$v]=$v;
		}
		return $r;
	}
}

/**
 * 替换冲突url名
 *
 * @param String $name
 * @return String 过滤后
 */
//返回类别导航条
/*function tourlstr($name){
return str_replace(array('*','&','#','（','）',';',' '),'_',$name);
}*/
function tourlstr($string){
	if (preg_match("/[\x{4e00}-\x{9fa5}]+/u", $string)) {
		return $string;
	}
	$depr=C('URL_PATHINFO_DEPR');
	$regex='/[^-a-zA-z0-9_ ]/';
	$string=preg_replace($regex,'',$string);
	$string=trim($string);
	$string=preg_replace('/[-_ ]+/','-',$string);
	$regex="/".
	$depr."(".C('VAR_GROUP').'|'.
	C('VAR_MODULE').'|'.
	C('VAR_ACTION').'|'.
	C('VAR_ROUTER').'|'.
	C('VAR_TEMPLATE').'|'.
	C('VAR_AJAX_SUBMIT').'|'.
	C('VAR_PATHINFO').")".$depr."/";
	$string=preg_replace($regex,"_$1_",$string);//中间
	$regex="/".
	$depr."(".C('VAR_GROUP').'|'.
	C('VAR_MODULE').'|'.
	C('VAR_ACTION').'|'.
	C('VAR_ROUTER').'|'.
	C('VAR_TEMPLATE').'|'.
	C('VAR_AJAX_SUBMIT').'|'.
	C('VAR_PATHINFO').")$/";
	$string=preg_replace($regex,"_$1",$string);//结尾
	return $string;
}

/**
 * 获取价格
 *
 * @param Integer $price 价格
 * @param Integer $spe 特价
 */
function getprice($price, $spe, $discount = true)
{
	//如果没有选择汇率，读取系统默认汇率
	$currencies = get_currencies_arr();
	if (!isset($_SESSION['currency'])) {
		for($row = 0; $row < count ($currencies); $row ++) {
			if ($currencies[$row]['symbol'] == C('DEFAULT_CURRENCIES_SYMBOL')) {
				$_SESSION['currency'] = $currencies[$row];
			}
		}
	}
	if($spe >=$price) {
		//货币汇率
		$re= $_SESSION['currency']['code'] . (sprintf("%01.2f", $spe * $_SESSION['currency']['rate']));
		$r_price = $price;
	} else {
		$price *= $_SESSION['currency']['rate'];
		$spe *= $_SESSION['currency']['rate'];
        $spe = sprintf("%01.2f", $spe);
        $price = sprintf("%01.2f", $price);
		if($discount){
			//$re=  '<span style="color:red;text-decoration: line-through;">'.$_SESSION ['currency'] ['code'] . $price . '</span>&nbsp;&nbsp;&nbsp;<span style="color:red;">' . $_SESSION ['currency'] ['code'] . $spe . '</span><br />Save:' . number_format ( (($price - $spe) / $price * 100), 0 ) . '% off';
			$re=  '<span class="make-price">'.$_SESSION ['currency'] ['code'] . $price . '</span><span class="shop-price">' . $_SESSION ['currency'] ['code'] . $spe . '</span>';
		}else{
			$re= $_SESSION ['currency'] ['code'] . $spe;
		}
		$r_price=$spe;
	}
	$memberID = session('memberID');
	//在价格里头显示vip价格
	if(!$memberID) {
		$memberID = 0;
	}
	$ginfo=get_members_group($memberID);
	if($ginfo){
		if($discount){
			return $re." ".$ginfo["name"].":".$_SESSION ['currency'] ['code'] .$r_price*$ginfo["discount"];
		}
		else{
			return $re;
		}
	}
	return $re;
}

function getprice_str($price, $is_string = true)
{
	if($is_string) {
		return "<strong style='color:red;font-weight: bold;'>".$_SESSION ['currency'] ['code'] . (sprintf("%01.2f", $price * $_SESSION ['currency'] ['rate']))."</strong>";
	}
	return $_SESSION ['currency'] ['code'] . (sprintf("%01.2f", $price * $_SESSION ['currency'] ['rate']));
	
}
//获取真实的价格
function get_real_price($price,$pricespe)
{
	if ($price>=$pricespe){
		return $pricespe;
	}
	else{
		return $price;
	}
}

//获取价格折扣比例
function get_pricediscount($pricespe, $price)
{
	return sprintf("%01.0f", (1 - $pricespe/$price) * 100);
}


function get_catetree()
{
	$cache_key = 'catetree';
	$data = S($cache_key);
	if(!$data) {
		$res = D('Cate')->order('sort desc')->select();
		if($res) {
			foreach($res as $val) {
				if($val['pid'] == '0') {
					$data[$val['id']] = $val;
				}else {
					$val['products_total'] = D('Products')->where("cateid='{$val['id']}'")->count();
					$data[$val['pid']]['sub'][$val['id']] = $val;
				}
			}
		}
		unset($res);
		S($cache_key, $data);
	}
	return $data;
}

function get_cate($cid)
{
	return D('Cate')->where("id='{$cid}'")->find();
}
