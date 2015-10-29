<?php

namespace Home\Controller;

class ProductsController extends CommonController {
	
	public function detail()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$info = D('Products')->where("id='{$pid}'")->find();
		if($info) {
			//获取产品相册
			$gallerys = M('Products_gallery')->where("pid='{$pid}'")->order('sort desc')->select();
			
			$this->assign('gallerys', $gallerys);
		}
		
		$this->assign('info', $info);
		$this->display();
	}
	
}
	