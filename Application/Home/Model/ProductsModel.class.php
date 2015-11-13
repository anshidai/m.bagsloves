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
				$data[$v['name']]['input_type'] = $v['input_type'];
				$data[$v['name']]['name'] = $v['name'];
			} 
		}
		return $data? $data: '';
	}
	
	public function rand($field = '*', $limit = 9)
	{
		return $this->field($field)->where("isdown=0")->order()->limit($limit)->select();
	}
	
	//计算属性价格
	public function model_attr_price($model)
	{
		$price = 0;
		foreach ((array)$model as $v){
			$price += $v['attr_price'];
		}
		return $price;
	}
	
	//获取产品价格明细
	public function getpriceInfo($pid, $count, $model)
	{
		$list = $this->where("id='{$pid}'")->find();
		if(empty($list)) return false;
		
		$model_price = $this->model_attr_price($model);
		$list['price'] = (float)(VipPrice($list['price']) + $model_price);
		$list['pricespe'] = (float)(VipPrice($list['pricespe']) + $model_price);
		$list['count'] = $count;
		$ginfo = get_members_group(session('memberID'));
		$list['discount'] = $ginfo['discount']? $ginfo['discount']: 1;
		$list['price_total'] = $list['price'] * $count;
		$list['pricespe_total'] = $list['pricespe'] * $count;
		
		//优惠活动,1为批发
		if(in_array($list['activity'], array('1'))) {
			switch($list['activity']) {
				case 1:
					$PL_model = D('Products_lot');
					$data = $PL_model->where(array('product_id'=>$pid))->select();
					$maxcount = $PL_model->where("product_id='{$pid}'")->order("maxcount desc")->find();
					foreach($data as $k=>$v) {
						if($count>=$v['mincount'] && $count<=$v['maxcount']) {
							$list['pricespe'] = $list['price'] = (float)$v['price'];
							$list['price_total'] = $list['price'] * $count;
							$list['pricespe_total'] = $list['pricespe'] * $count;
							break 2;
						}elseif($count>=$maxcount['maxcount']) {
							$list['pricespe'] = $list['price'] = (float)$maxcount['price'];
							$list['price_total'] = $list['price'] * $count;
							$list['pricespe_total'] = $list['pricespe'] * $count;
							break 2;
						}
					}
					break;
			}
		}
		
		if($list['price_total'] <= $list['pricespe_total'] && $list['price_total']) {
			$list['total'] = $list['price_total'];
		} else{
			$list['total'] = $list['pricespe_total'];
		}
		if($discount>0) {
			$list['total'] = $list['total'] * $discount;
		}

		return $list;
	}
	
	//获取产品价格
	public function get_weight($pid)
	{
		$res = $this->where("id='{$pid}'")->find();
		
		return $res? $res['weight']: 0;
	}

	
	
}

