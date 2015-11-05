<?php
namespace Home\Model;

class ProductsAskModel extends CommonModel {
	
	
	public function getComment($pid, $where = 'status=1')
	{
		$map = "products_id='{$pid}'";
		if($where) {
			$map .= " AND {$where}";
		}
		$res = $this->where($map)->select();
		return $res;
	}
	
	
}