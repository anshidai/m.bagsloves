<?php

namespace Home\Widget;

use Think\Controller;

/**
 * 分类widget
 * 用于动态调用分类信息
 */

class CommonWidget extends Controller{
		
	public function CartTotal()
	{
		
	}
	
	
	public function Menu()
	{
		$categories = D('Category')->get_categories_tree();
		
		$this->assign('categories', $categories);
		
		$this->display('Common/category');
	}

	public function UserAcountTop()
	{
		$user_id = session('user_id');
		
		$wishlist = D('CollectGoods')->where("user_id='$user_id'")->count();
		
		$info['collect_total'] = $wishlist? $wishlist: 0;
		$info['coupons_total'] = 0;
		
		$this->assign('info', $info);
		$this->display('User/acount_top');
	}
	
}


