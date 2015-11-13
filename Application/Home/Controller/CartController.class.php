<?php

namespace Home\Controller;

class CartController extends MemberController {
	
	public function index()
	{
		$template = 'Member-empty';
		
		$cartModel = D('Cart');
		
		//购物车列表
		$list = $cartModel->get_cart_list($this->sessionID); 
		if($list) {
			//总重量
			$this->assign('totalWeight', $cartModel->cart_total_weight($this->sessionID));
			
			//总数量
			$this->assign('itemTotal', $cartModel->get_item_totalcount($this->sessionID));
			
			//总类数
			$this->assign('itemCount', $cartModel->get_item_count($this->sessionID));
			
			//产品总价格
			$cartTotal = $cartModel->cart_total($this->sessionID);
			$this->assign('cartTotal', getprice_str($cartTotal));
			
			//打折信息
			$discount = $cartModel->discount($cartTotal);
			$this->assign('discount', $discount);
			echo $discount['price'];
			//全部总价
			$this->assign('totalAmount', getprice_str($discount['price']));
			
			//购物车说明
			$this->assign('fee_readme', GetValue('fee_readme'));
			
			$this->assign('list', $list);
			
			$template = 'Cart-index';
		}
		
		$this->assign('act', 'cart');
		$this->assign('memberID', $this->memberID);
		$this->display($template);
	}
	
	
	public function changeNum()
	{
		$cart_id = I('post.id', 0, 'intval');
		$count = I('post.count', 0, 'intval');
		
		if(empty($count)) {
			$this->error('Add the quantity.');
		}
		
		$cartModel = D('Cart');
		if(!$cartModel->where("session_id='{$this->sessionID}' AND id='{$cart_id}'")->count()) {
			$this->error('Shopping cart no goods.');
		}
		
		if(!$cartModel->modify_quantity($this->sessionID, $cart_id, $count)) {
			$this->error('The operation failure.');
		}
		$this->success('The operation success.');
	}
	
	public function delcart()
	{
		$cart_id = I('get.id', 0, 'intval');
		
		if(empty($cart_id)) {
			$this->error('The request of the error address.');
		}
		
		if(!D('Cart')->delete_item($this->sessionID, $cart_id)) {
			$this->error('The operation failure.');
		}
		$this->success('The operation success.');
	}
	
	public function save()
	{
		$minimum_money = GetValue('minimum_money');
		if($minimum_money>0 && D('Cart')->cart_total($this->sessionID)<$minimum_money){
			$this->error("Not be less than {$minimum_money} minimum!");
		}
		
		if($this->memberID <= 0 && GetValue('quickbuy')==0) {
			$this->redirect('Admin/login');
		}
		$this->redirect('Cart/checked_pment');
	}
	
	public function checked_pment()
	{
		
	}
	
	
	
	
}

