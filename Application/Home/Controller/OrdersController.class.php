<?php 

namespace Home\Controller;

class OrdersController extends MemberController {
	
	public function index()
	{
		$map['member_id'] = $this->memberID;
		$list = D('Orders')->where($map)->order('id desc')->select();
		$this->assign('list', $list);
		$this->display();
	}
	
	public function detail()
	{
		$sn = I('get.sn', 0, 'htmlspecialchars');

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
			$orders_products_list[$k]['products_model'] = unserialize($v['products_model']);
			$orders_products_list[$k]['product'] = D('Products')->where("id='{$v['products_id']}'")->find();
		}
		
		$this->assign('shippingInfo', $shippingInfo);
		$this->assign('orders_products_list', $orders_products_list);

		$this->display();
	}
	
	public function del()
	{
		$sn = I('post.sn', 0, 'htmlspecialchars');
		if(empty($sn)) {
			$this->error('operation failure');
		}
		
		$model = D('Orders');
		if(!$model->where("member_id='{$this->memberID}' AND sn='{$sn}'")->count()) {
			$this->error('You currently have no this order number');
		}
		if($model->where("sn='{$sn}'")->save(array('orders_status'=>4))) {
			$this->success('Order is deleted success', U('Orders/index'));
		}else {
			$this->error('Order is deleted failure');
		}
	}
	
	public function confirm()
	{
		$sn = I('post.sn', 0, 'htmlspecialchars');
		if(empty($sn)) {
			$this->error('operation failure');
		}
		$model = D('Orders');
		if(!$model->where("member_id='{$this->memberID}' AND sn='{$sn}'")->count()) {
			$this->error('You currently have no this order number');
		}
		if($model->where("sn='{$sn}'")->save(array('orders_status'=>4))) {
			$this->success('operation success', U('Orders/index'));
		}else {
			$this->error('operation failure');
		}
		
	}
	
}