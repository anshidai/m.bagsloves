<?php
namespace Home\Model;

class CateModel extends CommonModel {
	
	
	
	/**
	 * 取得该类别下的所有子类
	 */
	function getChildren($id) 
	{
		static $children = array ();
		$data = $this->where(array('pid' => $id))->select();
		if(func_num_args() > 1) {
			$children = array();
			$children [] = $id;
		}
		foreach($data as $k => $v) {
			$children[] = $v['id'];
			$this->getChildren($v['id']);
		}
		return $children;
	}
	
	public function getCate($id, $field = '*')
	{
		return $this->field($field)->where(array('id' => $id))->find();
	}
	
	
}