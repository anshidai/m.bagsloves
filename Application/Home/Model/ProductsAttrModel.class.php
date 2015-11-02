<?php
namespace Home\Model;

class ProductsAttrModel extends CommonModel {
	
	public function get_attrs($pid)
	{
		if(empty($pid)) return false;
		
		$where = "products_id='{$pid}'";
		
		if(is_array($pid)) {
			$where = array('products_id'=>array('in',$pid));
		}
		$type_attr = D('TypeAttr')->_cacheType();
		$res = $this->where($where)->order('sort desc')->select();
		if($res) {
			foreach($res as $k=>$v) {
				$v['attr_name'] = $type_attr[$v['attr_id']]['name'];
				$row = $v;
				$data[$v['attr_name']][$v['id']] = $row;
			}
		}
		return $data? $data: '';
	}
	
}