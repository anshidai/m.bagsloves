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
		$map['id'] = array('in', $id);
		$this->where($map)->delete();
	}
	
	//清空购物车
	public function clear_cart($sessionID)
	{
		$this->where("session_id='{$sessionID}'")->delete();
	}
	
	
	
}