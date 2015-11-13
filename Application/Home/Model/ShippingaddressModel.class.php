<?php
namespace Home\Model;

class ShippingaddressModel extends CommonModel {
	
	function get_shippingaddress($memberid)
	{
		return $this->where(array('id'=>$memberid))->find();
	}
	
}
