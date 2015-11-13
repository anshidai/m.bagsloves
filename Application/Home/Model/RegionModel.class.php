<?php
namespace Home\Model;

class RegionModel extends CommonModel {
	
	/**
	* 获取地区
	* type地区级别 0-国家 1-省份 2-市级 3-县级
	*/
	public function get_region_list($type = 0, $pid = 0)
	{
		$data = array();
		
		$where = "type='{$type}'";
		if($pid) {
			$where .= " AND pid='{$pid}'";
		}
		$res = $this->where($where)->order('name asc')->select();
		if($res) {
			foreach($res as $k=>$v) {
				$data[$v['id']] = $v;
			}
			unset($res);
		}
		return $data;
	}
	
	
	public function get_region($id = 0)
	{
		$data = $this->__Cache();
		return $id? $data[$id]: $data;
		
		
	}
	
	public function __Cache()
	{
		$cachekey = 'region_all_cache';
		$cachedata = S($cachekey);
		if(!$cachedata) {
			$res = $this->select();
			if($res) {
				foreach($res as $k=>$v) {
					$cachedata[$v['id']] = $v;
				}
				S($cachekey, $cachedata, 3600);
			}
			unset($res);
		}
		return $cachedata;
	}
	
	
	
}