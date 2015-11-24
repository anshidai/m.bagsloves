<?php

/**
* 定义404跳转控制器 
*/
namespace Home\Controller;

class EmptyController extends CommonController {
	
	
	public function _empty()
	{
		@header('http/1.1 404 not found'); 
		$this->display('Public-404'); 	
	
	}
	
	public function index()
	{
		@header('http/1.1 404 not found'); 
		$this->display('Public-404'); 	
	}
	
	
}



