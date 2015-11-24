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

//获取购物车购买的商品种类数量
function itemCount()
{
	return D('Cart')->get_item_count(cookie('sessionID'));
}

//获取购物车商品总数量
function TotalCount()
{
	return D('Cart')->get_item_totalcount(cookie('sessionID'));
}

//获取购物车商品总价格
function cart_total()
{
	return D('Cart')->cart_total(cookie('sessionID'));
}

/**
 * 根据VIP会员等级取得VIP会员价
 *
 */
function VipPrice($price)
{
	$GroupInfo = get_members_group(cookie('memberID'));
	if($GroupInfo['discount']) {
		$VipPrice = $GroupInfo['discount'] * $price;
	}else{
		$VipPrice = $price;
	}
	return $VipPrice;
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
	if(!isset($_SESSION['currency'])) {
		for($row = 0; $row < count ($currencies); $row ++) {
			if ($currencies[$row]['symbol'] == C('DEFAULT_CURRENCIES_SYMBOL')) {
				session('currency', $currencies[$row]);
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
		return "<strong style='font-weight: bold;'>".$_SESSION['currency']['code'] . (sprintf("%01.2f", $price * $_SESSION['currency']['rate']))."</strong>";
	}
	return $_SESSION['currency']['code'] . (sprintf("%01.2f", $price * $_SESSION ['currency']['rate']));
	
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

//发送邮件
function sendmail($sendTo, $subject, $body)
{
	$body = eregi_replace("[\]", '', $body);
	$headers = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=utf-8\r\n";
	if(GetValue('sendemailtype') == 'smtp') {
		mail($sendTo, $subject, $body, $headers);
	}
	if(GetValue("sendemailtype") == 'phpmail') {
		Vendor('PHPMailer.PHPMailerAutoload');
		
		$mail = new PHPMailer(); //实例化
		$mail->IsSMTP(); // 启用SMTP
		$mail->Host = GetValue('smtphost'); //smtp服务器的名称（这里以QQ邮箱为例）
		$mail->Port = GetValue('smtpport');
		$mail->SMTPAuth = true; //启用smtp认证
		$mail->Username = GetValue('smtpusername'); //发件人邮箱名
		$mail->Password = GetValue('smtppassword') ; //163邮箱发件人授权密码
		$mail->AddAddress($sendTo, 'Dear Guest');
		$mail->WordWrap = 50; //设置每行字符长度
		$mail->IsHTML(true); // 是否HTML格式邮件
		$mail->CharSet= 'utf-8'; //设置邮件编码
		$mail->Subject = $subject; //邮件主题
		$mail->Body = $body; //邮件内容
		$mail->AltBody = $body; //邮件正文不支持HTML的备用显示
		if(GetValue('smtpisssl') == '1') {
			$mail->SMTPSecure = 'ssl';
		}
		return($mail->Send());
	}

}

function save_history($id)
{
	
	$id = (int)$id;
	$history = cookie('goods_history');
	if($history) {
		$history = json_decode(urldecode($history));
		if(is_array($history)) {
			array_push($history, $id);
			$history = array_unique($history);
			if(count($history)>20) {
				$history = array_slice($history, -20);
			}
		}
	}else {
		$history = array($id);
	}
	cookie('goods_history', urlencode(json_encode($history)), 86400*30);
}

function get_history()
{
	if($history = cookie('goods_history')) {
		$history = json_decode(urldecode($history));
		if(is_array($history)) {
			$list = D('Products')->where(array('id'=>array('in', $history)))->order('id desc')->select();
			return $list;
		}
	}
	return false;
}


function check_verify($code, $id = '')
{
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

function get_sn()
{
	return toDate(time(), 'YmdHis');
}

function toDate($time, $format = 'Y-m-d H:i:s') 
{
	if(empty($time)) {
		return '';
	}
	$format = str_replace('#', ':', $format);
	return date($format, $time);
}

function get_region_name($id)
{
	$model = D('Region');
	$list = $model->where("id='{$id}'")->find();
	return $list? $list['name']: '';
}

function get_region_id($name)
{
	$model = D('Region');
	$list = $model->where("name='{$name}'")->find();
	return $list? $list['id']: '';
}

//付款方式费用
function get_orders_Fees($total, $itemTotal, $payment_id)
{
	$feeModel = D('Fee');
	$fee = $feeModel->where(array('payment_id'=>$payment_id))->find();
	if(!$fee){
		$fee['min_insurance'] = 0;
		$fee['min_freepaymoney'] = 0;
		$fee['minimum_money'] = 0;
	}
	$r = array();
	$r["products_total"] = $total;
	$r['total'] = $total;
	$r['minimum_money'] = $fee['minimum_money'];
	if($fee['min_insurance'] && $fee['insurance'] && $r["total"]<=$fee['min_insurance']) {
		$r['insurance'] = $itemTotal * $fee['insurance'];
	}
	else{
		$r['insurance'] = 0;
	}
	$r['total'] += $r['insurance'];
	if($fee['min_freepaymoney'] && $fee['paymoney'] && $r["total"]<=$fee['min_freepaymoney']) {
		$r['paymoney'] = (float)$r["total"] * (float)$fee['paymoney'];
	}
	else{
		$r['paymoney'] = 0;
	}
	$r['total'] = round($r["total"] + $r['paymoney'], 2);
	$r['insurance'] = round($r['insurance'], 2);
	$r['paymoney'] = round($r['paymoney'], 2);
	return $r;
}

function get_orders_status($id)
{
	$status = D('Orders')->field('orders_status')->where("id='{$id}'")->find();
	return $status? $status['orders_status']: '';
}

function create_session_id()
{
	$session_id = $_SERVER['HTTP_USER_AGENT'].get_client_ip();
	return md5($session_id);
}

/**
* disuc加密解密
* $string 明文或密文
* $operation 加密ENCODE或解密DECODE
* $key 密钥
* $expiry 密钥有效期 
*/    
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) 
{
	$ckey_length = 4;
	$key = md5($key != '' ? $key : $_SERVER['HTTP_HOST']);
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}
}

function daddslashes($string, $force = 1)
{
	if(is_array($string)) {
		$keys = array_keys($string);
		foreach($keys as $key) {
			$val = $string[$key];
			unset($string[$key]);
			$string[addslashes($key)] = daddslashes($val, $force);
		}
	} else {
		$string = addslashes($string);
	}
	return $string;
}

function get_orders_status_tips($orders_status)
{
	if($orders_status == '1') {
		$orders_status = 'Pending';
	}else if($orders_status == '2') {
		$orders_status = 'Processing';
	}else if($orders_status == '3') {
		$orders_status = 'Delivered';
	}else if($orders_status == '4') {
		$orders_status = 'Close';
	}
	return $orders_status;
}