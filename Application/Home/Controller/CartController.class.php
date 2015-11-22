<?php

namespace Home\Controller;

class CartController extends CommonController {
	
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
			
			//满金额免运费
			$free_shipping = GetValue('free_shipping');
			$this->assign('free_shipping', $free_shipping);
			
			//运费
			$shippingPrice = $discount['price'] >= $free_shipping? 0: 15;
			$this->assign('shippingPrice', $shippingPrice);
			
			//全部总价 = 商品总价格 + 打折 + 运费
			$this->assign('totalAmount', getprice_str($discount['price'] + $shippingPrice));
			
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
		
		$cartModel = D('Cart');
		//购物车列表
		$cart_list = $cartModel->get_cart_list($this->sessionID);
		if(empty($cart_list)) {
			$this->redirect('Cart/index');
		}
		$this->assign('cart_list', $cart_list);
		
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
		
		//满金额免运费
		$free_shipping = GetValue('free_shipping');
		$this->assign('free_shipping', $free_shipping);
		
		//运费
		$shippingPrice = $discount['price'] >= $free_shipping? 0: 15;
		$this->assign('shippingPrice', $shippingPrice);
		
		//全部总价 = 商品总价格 + 打折 + 运费
		$this->assign('totalAmount', getprice_str($discount['price'] + $shippingPrice));
		
		//购物车说明
		$this->assign('fee_readme', GetValue('fee_readme'));
		
		//支付方式列表
		$paymentModel = D('Payment');
		$this->assign('paymentlist', $paymentModel->getlist());
		
		$regionModel = D('Region');
		$shippingaddressModel = D('Shippingaddress');
		$member = $this->member_Info;
		$address = $shippingaddressModel->get_shippingaddress($this->memberID);

		$this->assign('country', $regionModel->get_region_list(0));
		$this->assign('member', $this->member_Info);
		$this->assign('address', $address);
		$this->display();
	}
	
	public function check_payment()
	{
		$payment_module_code = I('post.payment_module_code', '');
		$coupon = I('post.coupon', '');
		
		if($this->memberID <= 0 && GetValue('quickbuy')==0) {
			$this->redirect('Admin/login');
		}
		
		$cartModel = D('Cart');
		if($cartModel->get_item_count($this->sessionID) < 1) {
			$this->error("Your shopping cart does not have any goods.");
		}
		if(empty($payment_module_code)) {
			$this->error('Please select PAYMENT METHOD.');
		}
		
		$couponModel = D('Coupon');
		if(!empty($coupon) {
			if(!$couponModel->validate($coupon)){
				$this->error('The coupon is invalid.');
			}
		}
		
		$ordersModel = D('Orders');
		$shippingModel = D('Shipping');
		$shippingaddressModel = D('Shippingaddress');
		$paymentModel = D('Payment');
		
		if($delivery_list = $ordersModel->create()) {
			$delivery = $_POST['delivery']; //0会员本身地址，1其它地址
			if($delivery == 0) {
				$memberModel = D('Members');

				$delivery_list['member_id'] = $this->memberID;
				$this->member_info = $member_info = $memberModel->find($this->memberID);
				$delivery_list['delivery_email'] = $member_info['email'];
				$delivery_list['delivery_firstname'] = $member_info['firstname'];
				$delivery_list['delivery_lastname'] = $member_info['lastname'];
				
				$address = $shippingaddressModel->get_shippingaddress($this->memberID);
				$delivery_list['delivery_address'] = $address['address'];
				$delivery_list['delivery_country'] = $address['country'];
				$delivery_list['delivery_state'] = $address['state'];
				$delivery_list['delivery_city'] = $address['city'];
				$delivery_list['delivery_zip'] = $address['zip'];
				$delivery_list['delivery_telephone'] = $address['telphone'];
			}
			
			$delivery_list['total_weight'] = $cartModel->cart_total_weight($this->sessionID );
			$delivery_list['shippingmoney'] = $shippingModel->get_shipping_fee($delivery_list['shipping_id'], $delivery_list['delivery_country'], $delivery_list['delivery_state'], $delivery_list['delivery_city'], $delivery_list['total_weight']);
			$delivery_list['shippingmoney'] = $delivery_list['shippingmoney']['price'];
			
			//没有价格取保险金
			if(empty($delivery_list['shippingmoney'])) {
				$delivery_list['shippingmoney'] = $shippingModel->get_insure($delivery_list["shipping_id"]);
			}
			$delivery_list['shipping_method'] = $delivery_list['shipping_module_code']=$shipping_model->get_name($delivery_list["shipping_id"]);
			
			
			$products_total = $cartModel->cart_total($this->sessionID);//产品总价格
			$discount = $cartModel->discount($products_total);//打折信息
			$sum_total = round($discount['price'], 2);//打折后价格
			$delivery_list['discount'] = $discount['text'];
			$itemTotal = $cartModel->get_item_totalcount($this->sessionID);//总数量
			$payment_id = $paymentModel->get_id($delivery_list["payment_module_code"]);
			$fee = get_orders_Fees($sum_total,$itemTotal,$payment_id);
			
			//最小订单金额
			if($fee['minimum_money'] && $fee["total"]<=$fee['minimum_money']){
				$this->error("Not be less than ".$fee['minimum_money']." minimum!");
			}
			
			//满金额免运费, 总金额大于免运费
			$free_shipping = GetValue('free_shipping');
			$this->free_shipping = $free_shipping;
			if($free_shipping && $fee['total']>=$free_shipping) {
				$delivery_list['shippingmoney'] = 0;
			}
			
			$delivery_list['paymoney'] = $fee["paymoney"];
			$delivery_list['insurance'] = $fee["insurance"];
			$delivery_list['orders_total'] = $fee['total'] + $delivery_list['shippingmoney']; //总价加上运费
			
			$delivery_list['products_total'] = $fee['products_total'];

			//判断手动和选择
			$delivery_list['delivery_country'] = is_numeric($delivery_list['delivery_country'])? get_region_name($delivery_list['delivery_country']): $delivery_list['delivery_country'];
			$delivery_list['delivery_state'] = is_numeric($delivery_list['delivery_state'])? get_region_name($delivery_list['delivery_state']): $delivery_list['delivery_state'];
			$delivery_list['delivery_city'] = is_numeric($delivery_list['delivery_city'])? get_region_name($delivery_list['delivery_city']): $delivery_list['delivery_city'];
			
			//货币符号
			$delivery_list['currencies_code'] = $_SESSION['currency']['code']? $_SESSION['currency']['code']: '$';
			
			//如果使用了优惠券
			if($coupon) {
				$delivery_list['orders_total'] -= $coupon['amount'];
				$delivery_list['coupon'] = $coupon['amount']; //记录优惠了多少价格
			}
			
			//生成订单
			$ordersModel->create($delivery_list); //过滤
			if($orders_id = $ordersModel->add()) {
				//保存优惠券使用者
				$couponModel->where(array('coupon' => $coupon))->save(array('user'=>$delivery_list['delivery_lastname'].' '.$delivery_list['delivery_firstname'],'status'=>0));
				
				//处理orders_products表
				$orders_products_model = D ('Orders_products');
				$list = $cartModel->display_contents($this->sessionID);
				if($list) {
					foreach($list as $k=>$v) {
						$data['orders_id'] = $orders_id;
						$data['products_model'] = serialize($v['model']);
						$data['products_id'] = $v['pid'];
						$data['products_name'] = $v['name'];
						$data['products_price'] = $v['price'];
						$data['products_pricespe'] = $v['pricespe'];
						$data['products_quantity'] = $v['count'];
						$data['products_total'] = $v['total'];
						if($orders_products_model->create($data)){
							$orders_products_model->add();
						}
					}
				}

				//清除购物车
				$cartModel->clear_cart($this->sessionID);

				//发送邮件
				//邮件变量
				$this->itemTotal = $itemTotal; //总数量
				$this->totalWeight = $delivery_list['total_weight']; //总重量
				$this->orders_data = $delivery_list; //订单数据
				$this->list = $list; //购物车产品
				$this->cartTotal = getprice_str($products_total); //产品总价格
				$fee['insurance']>0 && $this->assign('insurance',getprice_str($fee['insurance']));
				$fee['paymoney']>0 && $this->assign('paymoney',getprice_str($fee['paymoney']));
				$this->discount = $discount;//打折
				$this->shippingPrice = getprice_str($delivery_list['shippingmoney']); //运费
				$this->totalAmount = getprice_str($delivery_list['orders_total']); //全部总价

				$this->this_script = "http://".$_SERVER['HTTP_HOST'];
				$sendto = array($delivery_list['delivery_email'],GetValue('mailcopyTo')); //抄送
				$body = $this->fetch("MailTpl:checkout");
				sendmail($sendto,GetValue('sitename')." - new order(SN:".$orders_model->sn.")!",$body)	;
				$this->redirect('Cart/pment', array ('id' => $orders_id ) );
				
				
			} else {
				$this->error($ordersModel->getError());
			}
			
			
			
		}else {
			$this->error($ordersModel->getError());
		}
		
		
		
		
		
		
		
		
		
	}
	

	
}

