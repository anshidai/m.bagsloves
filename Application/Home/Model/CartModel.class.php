<?php
namespace Home\Model;

class CartModel extends CommonModel {
	
	//获取商品种类总数
	public function get_item_count($sessionID)
	{
		return $this->where("session_id='{$sessionID}'")->count();
	}
	
	//获取产品总数
	public function get_item_totalcount($sessionID){
		return $this->where("session_id='{$sessionID}'")->sum('count');
	}
	
	//获取总价格
	public function cart_total($sessionID){
		$total = 0;
		$productModel = D('Products');
		$list = $this->where("session_id='{$sessionID}'")->select();
		for($row=0; $row<count($list); $row++) {
			$data = $productModel->getpriceInfo($list[$row]['pid'], $list[$row]['count'], unserialize($list[$row]['model']));
			$total = $total+$data['total'];
		}
		return $total;
	}
	
	//获取总重量
	public function cart_total_weight($sessionID)
	{
		$total = 0;
		$productsModel = D('Products');
		$res = $this->where("session_id='{$sessionID}'")->select();
		
		if($res) {
			foreach($res as $k=>$v) {
				$weight = $productsModel->get_weight($v['pid']) * $v['count'];
				$total = $total + $weight;
			}
		}
		return $total;
	}
	
	//检查购物车是否有相同商品
	public function check_item($sessionID, $pid, $model) 
	{
		$list = $this->where("session_id='{$sessionID}' and pid='{$pid}' and model='{$model}'")->find();
		return !empty($list)? count($list): 0;
	}
	
	//添加购物车
	public function add_item($sessionID, $pid, $count,$model) 
	{
		$qty = $this->check_item ( $sessionID, $pid,$model );
		if ($qty) {
			$data ['count'] = array ('exp', 'count+' . $count );
			$data['dateline'] = time();
			$this->where("session_id='{$sessionID}' and pid='{$pid}' and model='{$model}'")->save($data);
		} else {
			$data['pid'] = $pid;
			$data['uid'] = $this->memberID; //不是会员为0
			$data['session_id'] = $sessionID;
			$data['count'] = $count;
			$data['model'] = $model;
			$data['dateline'] = time();
			$this->add($data);
		}
	}
	
	//删除购物车中的内容
	public function delete_item($sessionID, $id)
	{
		if(empty($id)) return false;
		
		$map['session_id'] = $sessionID;
		$map['id'] = is_array($id)? array('in', $id): $id;
		return $this->where($map)->delete();
	}
	
	//修改物品数量
	public function modify_quantity($sessionID, $cart_id, $count, $model = '')
	{
		$data['count'] = $count;
		$data['dateline'] = time();
		if($model) {
			$data['model'] = $model;
		}
		return $this->where("session_id='{$sessionID}' and id='{$cart_id}'")->save($data);
	}
	
	//清空购物车
	public function clear_cart($sessionID)
	{
		$this->where("session_id='{$sessionID}'")->delete();
	}
	
	public function get_cart_list($sessionID)
	{
		$data = array();
		
		$res = $this->where("session_id='{$sessionID}'")->select();
		if($res) {
			$productsModel = D('Products');
			foreach($res as $k=>$v) {
				$v['model'] = unserialize($v['model']);
				$product_info = $productsModel->getpriceInfo($v['pid'], $v['count'], $v['model']);
				$v['products_id'] = $product_info['id']; 
				$v['price'] = $product_info['price']; 
				$v['pricespe'] = $product_info['pricespe']; 
				$v['serial'] = $product_info['serial']; 
				$v['name'] = $product_info['name']; 
				$v['bigimage'] = $product_info['bigimage']; 
				$v['smallimage'] = $product_info['smallimage']; 
				$v['count'] = $product_info['count']; 
				$v['discount'] = $product_info['discount']; 
				$v['price_total'] = $product_info['price_total']; 
				$v['pricespe_total'] = $product_info['pricespe_total']; 
				$v['total'] = $product_info['total']; 
				$v['costprice'] = $product_info['costprice']; 
				$v['provider'] = $product_info['provider'];
				$data[$k] = $v;
			}
		}
		return $data;
	}
	
	//打折信息
	public function discount($price)
	{
		$discount_enable = GetValue('discount_enable');
		
		//判断是否有折扣
		$discount = 1;
		$data = array();
		if($discount_enable) {
			$discountModel = M('Discount');
			$list = $discountModel->select();
			foreach($list as $k=>$v) {
				if($price>=$v['minmoney'] && $price <=$v['maxmoney']) {
					$discount = $v['discount'];
					break;
				}
			}
		}
		if($discount<1) {
			$data['price'] = round($price * $discount, 2);//保留两位
			$data['text'] = getprice_str($price).'*<Span style="color:red;font-weight:bold;">'.($discount*100).'%</span>='.getprice_str($data['price']);
		}else {
			$data['price'] = $price;
			$data['text'] = '';
		}
		return $data;
	}
	
	
	
	
	
	
}

