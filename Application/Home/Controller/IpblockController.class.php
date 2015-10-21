<?php 

namespace Home\Controller;

class IpblockController extends CommonController {
	
	public function _initialize() 
	{
		
	}
	
	public function index()
	{
		if(GetValue("ipblock_lang") == 1 && substr_count($_SERVER["HTTP_ACCEPT_LANGUAGE"], 'zh-cn') > 0) {
			$this->redirect('Ipblock/login');
		}
		
		$IpLocation = new \Org\Net\IpLocation();
		
		$result = $IpLocation->getlocation();
		$address = $result['country'].$result['area'];
		$ip = $result['ip'];
		$city = GetValue("ipblock_city");
		$cityinfo = unserialize($city);
		foreach ($cityinfo as $k=>$v) {
			if (substr_count($address, $v)>0 || substr_count($ip, $v)>0) {
				$this->redirect('Ipblock/login');
			}
		}
		cookie('ipblock', 0, 3600*6); //不在范围
	}
	
	public function login(){
		 $this->view->display('Ipblock/login');
	}
	
	public function dologin(){
		
		if(GetValue('ipblock_pwd') == $_POST['password']) {
			cookie('ipblock', 0, 3600*6);
			$this->redirect('Index/index');
		}
		else {
			cookie('ipblock', 1, 3600*6);
			$this->redirect('Ipblock/login');
		}

	}
	
	
}