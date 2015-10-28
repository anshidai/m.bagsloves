<?php

namespace Home\Controller;

class IndexController extends CommonController {

    public function index()
	{
		$cachedata = $this->_cache();
		
		$this->assign($cachedata);
		$this->display();
    }
	
	protected function _cache()
	{

		//最新商品
        $data['new_products'] = $this->ProModel->where('isnew=1 and isdown!=1')->order('sort desc,id desc')->limit('0,4')->select();
		
		//畅销热卖商品
        $data['hot_products'] = $this->ProModel->where('ishot=1 and isdown!=1')->order('sort desc,id desc')->limit('0,4')->select();
		
		return $data;
		
	}
	
	
	
}