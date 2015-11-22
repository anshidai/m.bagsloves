<?php
namespace Home\Model;

class CouponModel extends CommonModel {
	
	publiic function validate($coupon)
	{
		$map['coupon'] = trim($coupon);
		$map['status'] = 1;
		$map['start_time'] = array('elt', time());
		$map['expire_time'] = array('egt', time());
		return $this->where($map)->find();
	}
	
}

