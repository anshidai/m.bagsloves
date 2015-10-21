<?php 

namespace Home\Controller;

use Think\Controller;

class CommonController extends Controller {
	
	protected static $Model = null;	//数据Model
	public $sessionID,$memberID,$memberInfo,$memberShippingAddress;
	
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
		
		//生产一个唯一的session id
		$this->sessionID = session('sessionID');
		if(!$this->sessionID) {
			$this->sessionID = md5(uniqid(rand()));
			session('sessionID', $this->sessionID);
		}
		
		//读取用户id
		$this->memberID = session('memberID');
		if(!$this->memberID) {
			$this->memberID = 0;
		}else {
			//读取用户信息
			$this->mid = $this->memberID;
			$this->member_Info = D("Members")->where("id=".$this->memberID)->find();
			$this->member_ShippingAddress = D("Shippingaddress")->where("id=".$this->memberID)->find();
			session('memberShippingAddress', $this->member_ShippingAddress);
		}
		
		//当前月份
		$today = getdate();
		$this->month = $today['month'];
		
		//会员等级
		$this->memberGropuInfo = get_members_group($this->memberID);
		$this->isVip = $this->memberGropuInfo? 1: 0;
		
	}
	
}
