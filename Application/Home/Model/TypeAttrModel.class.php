<?php
namespace Home\Model;

class TypeAttrModel extends CommonModel {

	public function getTypeAll($type_id)
	{
		$res = $this->_cacheType();
		if($res) {
			foreach($res as $k=>$v) {
				if($type_id == $v['type_id']) {
					if($v['input_type'] == '1' || $v['input_type'] == '3') {
						$v['values'] = explode("\n", $v['attr_value']);
					}
					$data[$v['id']] = $v;
				}
			}
		}
		return $data? $data: '';
	}
	
	
	public function _cacheType()
	{
		$cachekey = 'cache_type_attr_all';
		$cachedata = S($cachekey);
		if(!$cachedata) {
			$res = $this->where("status=1")->order('sort desc')->select();
			foreach($res as $k=>$v) {
				$cachedata[$v['id']] = $v;
			}
			unset($res);
			S($cachekey, $cachedata);
		}
		return $cachedata;
		
		
	}
	
	
	
}