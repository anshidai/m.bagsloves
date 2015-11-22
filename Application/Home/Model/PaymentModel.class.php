<?php
namespace Home\Model;

class PaymentModel extends CommonModel {
	
	public function getlist()
	{
		$data = array();
		$list= $this->order('sort desc')->select();
		if($list) {
			foreach($list as $k=>$v) {
				$status = GetValue("{$v['name']}_status");
				if($status){
					$data[] = $v;
				}
			}
		}
		return $data;
	}
	
	public function get_id($name)
	{
		return $this->where(array('name'=>$name))->getField('id');
	}
	
	
}



