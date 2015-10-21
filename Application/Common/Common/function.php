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


