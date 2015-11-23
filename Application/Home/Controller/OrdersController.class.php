<?php 

namespace Home\Controller;

class OrdersController extends MemberController {
	
	public function index()
	{
		$map['member_id'] = $this->memberID;
		$list = D('Orders')->where($map)->order('id desc')->select();
		if($list) {
			foreach($list as $k=>$v) {
				if($v['orders_status'] == '1') {
					$orders_status = 'Pending';
				}else if($v['orders_status'] == '2') {
					$orders_status = 'Processing';
				}else if($v['orders_status'] == '3') {
					$orders_status = 'Delivered';
				}else if($v['orders_status'] == '4') {
					$orders_status = 'Close';
				}
				$list[$k]['orders_status'] = $orders_status;
			}
		}
		$this->assign('list', $list);
		$this->display();
	}
	
	public function detail()
	{
		$sn = I('get.sn', 0, 'htmlspecialchars');

		if($this->memberID <= 0 && GetValue('quickbuy')==0) {
			redirect('Admin/login');
		}
		
		if(empty($sn)) {
			redirect('Orders/index', 5, 'please input order sn');
		}

		$ordersModel = D('Orders');
		$shippingInfo = $ordersModel->where("sn='{$sn}'")->find();
		if(empty($shippingInfo)) {
			redirect('Orders/index', 5, 'The order information does not exist, please try again');
		}
		
		$orders_id = $shippingInfo['id'];
		$orders_products_list = D('OrdersProducts')->where("orders_id='{$orders_id}'")->select();
		if(empty($orders_products_list)) {
			redirect('Orders/index', 5, 'The current order no goods');
		}
		foreach($orders_products_list as $k=>$v) {
			$orders_products_list[$k]['product'] = D('Products')->where("id='{$v['products_id']}'")->find();
		}
		
		$this->assign('shippingInfo', $shippingInfo);
		$this->assign('orders_products_list', $orders_products_list);

		$this->display();
	}
	
	public function add()
	{
		
		$this->display();
	}
	
}