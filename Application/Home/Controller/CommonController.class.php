<?php 

namespace Home\Controller;

use Think\Controller;

class CommonController extends Controller {
	
	protected static $Model = null;	//数据Model
	protected $ProModel = null;
	public $sessionID,$memberID,$memberInfo,$memberShippingAddress, $referer;
	
	public function _initialize()
	{
		header("Content-Type:text/html; charset=utf-8");
		
		//是否关闭网站
		if(GetValue('close_site') == 1) {
			header("HTTP/1.1 500 Internal Server Error");
			header("Status: 500 Internal Server Error");
			die('<div style="margin: 10px; text-align: center; font-size: 14px"><p>The temporary closure of this site, you can not access!</p><p>' . GetValue('close_site_content') . '</p></div>');
		}
		
		//IP封锁
		if(isset($_COOKIE['ipblock']) && $_COOKIE['ipblock'] == 0) {
			
		} elseif((isset($_COOKIE['ipblock']) && $_COOKIE["ipblock"] == 1) || (GetValue('ipblock') == 1 && GetValue('ipblock_pwd') != '')) {
			$ipblock = new Home\Controller\IpblockController();
			$ipblock->index();
		}
		
		//货币初始化
		$currencies = get_currencies_arr();
		if(!isset($_SESSION['currency'])) {
			for($i = 0; $i < count ($currencies); $i++) {
				if($currencies[$i]['symbol'] == C('DEFAULT_CURRENCIES_SYMBOL')) {
					session('currency', $currencies[$i]);
				}
			}
		}
		$this->assign('currencies', $currencies);

		//生产一个唯一的session id
		$this->sessionID = cookie('sessionID');
		if(!$this->sessionID) {
			$this->sessionID = create_session_id();
			cookie('sessionID', $this->sessionID);
		}
		
		//读取用户id
		$auth_cookie = cookie('auth');
		if(empty($auth_cookie)) {
			$this->memberID = 0;
		}else {
			$auth = daddslashes(explode("\t", authcode($auth_cookie, 'DECODE', C('AUTHKEY'))));
			list($member_id, $member_email) = empty($auth) || count($auth) < 2 ? array('', '') : $auth;
			if(!empty($member_id)) {
				$this->memberID = $member_id;
			}
		}
		cookie('memberID', $this->memberID);
		
		if($this->memberID) {
			//读取用户信息
			$this->mid = $this->memberID;
			$this->member_Info = D("Members")->where("id=".$this->memberID)->find();
			$this->assign('member_Info', $this->member_Info);
			
			$this->member_ShippingAddress = D("Shippingaddress")->get_shippingaddress($this->memberID);
		}
		$this->assign('memberID', $this->memberID);
		
		$referer = '';
		if(isset($_GET['referer']) && $_GET['referer']) {
			$referer = $_GET['referer'];
		}else if(cookie('referer')) {
			$referer = cookie('referer');
		}
		$this->referer = $referer;
		
		//当前月份
		$today = getdate();
		$this->month = $today['month'];
		
		//会员等级
		$this->memberGropuInfo = get_members_group($this->memberID);
		$this->isVip = $this->memberGropuInfo? 1: 0;
		
		$this->ProModel = D('Products');
		$this->assign('catetree', get_catetree());
		
		$this->assign('itemCount', itemCount());

	}
	
	private function _common_cache()
	{

	}
	
}
