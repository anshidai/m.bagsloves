<?php

namespace Home\Widget;

use Think\Controller;

class CommonWidget extends Controller{
	
	protected static $Model = null;	//数据Model	
	
	public function Menu()
	{
		$categories = D('Category')->get_categories_tree();
		
		$this->assign('categories', $categories);
		
		$this->display('Common/category');
	}

	public function UserAcountTop()
	{
		$user_id = cookie('memberID');
		
		$wishlist = D('CollectGoods')->where("user_id='$user_id'")->count();
		
		$info['collect_total'] = $wishlist? $wishlist: 0;
		$info['coupons_total'] = 0;
		
		$this->assign('info', $info);
		$this->display('User/acount_top');
	}
	
}


