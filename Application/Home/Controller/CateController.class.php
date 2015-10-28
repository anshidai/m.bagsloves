<?php

namespace Home\Controller;

class CateController extends CommonController {

    public function index()
	{
		$cid = I('get.cid', 0, 'intval');
		
		if($cid) {
			$cateinfo = get_cate($cid);
			$this->assign('cateinfo', $cateinfo);
		}
		
		$this->assign('cid', $cid);
		$this->display();
    }
	
	public function lists()
	{
		$cid = I('get.cid', 0, 'intval');
		
		$cache_key = 'cate_lists' . $cid;
		$cachedata = S($cache_key);
		if(!$cachedata) {
						
		}
		
		$cateinfo = get_cate($cid);
		
		$this->assign('cateinfo', $cateinfo);
		$this->display();
	}
	
}