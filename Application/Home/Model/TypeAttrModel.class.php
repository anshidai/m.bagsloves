<?php
namespace Home\Model;

class TypeAttrModel extends CommonModel {

	public function getTypeAll($type_id)
	{
		$res = $this->where("type_id='{$type_id}' AND status=1")->order('sort desc')->select();
		if($res) {
			foreach($res as $k=>$val) {
				if($val['input_type'] == '1' || $val['input_type'] == '3') {
					$val['values'] = explode("\n", $val['attr_value']);
				}
				$data[$val['id']] = $val;
			}
		}
		return $data? $data: '';
	}
	
	
	
}