<?php
namespace Home\Model;

class ProductsModel extends CommonModel {

	
	public function get_attrs($cateid, $pid)
	{
		$typeid = D('Cate')->field('type_id')->where("id='{$cateid}'")->find();
		$type_attr = D('TypeAttr')->getTypeAll($typeid['type_id']);
		if($type_attr) {
			foreach($type_attr as $k=>$v) {
				$data[$v['name']] = D('Products_attr')->where("products_id='{$pid}' AND attr_id='{$v['id']}'")->find();
			} 
		}
		return $data? $data: '';
	}
	
	public function rand($field = '*', $limit = 9)
	{
		return $this->field($field)->where("isdown=0")->order()->limit($limit)->select();
	}

	
	
}