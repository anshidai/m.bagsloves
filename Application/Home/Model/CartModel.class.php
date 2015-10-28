<?php
namespace Home\Model;

class CartModel extends CommonModel {
	
	//获取产品总数
	public function get_item_count($sessionID)
	{
		return $this->where("session_id='{$sessionID}'")->count();
	}
	
	
}