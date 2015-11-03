<?php

namespace Home\Controller;

class IndexController extends CommonController {

    public function index()
	{
		$cachedata = $this->_cache();
		
		$this->assign($cachedata);
		$this->display();
    }
	
	public function currencies() 
	{
		$post = $_POST;
		
		$currencies = get_currencies_arr();
		foreach($currencies as $k=>$v) {
			if($v['symbol'] == $post['currencies']) {
				session('currency', $v);
			}
		}
		header('location: '.$_SERVER['HTTP_REFERER']);

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