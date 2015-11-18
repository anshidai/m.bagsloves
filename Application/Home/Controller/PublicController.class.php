<?php

namespace Home\Controller;

class PublicController extends CommonController {
	
	
	public function help()
	{
		$this->display();
	}
	
	public function verify()
	{
		$Verify = new \Think\Verify();
		$Verify->fontSize   = 30;
		$Verify->length   = 4;
		$Verify->useNoise = false; 
		$Verify->codeSet = '0123456789';
		$Verify->entry();
	}
	
	
}
