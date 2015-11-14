<?php
namespace Home\Model;

class ShippingaddressModel extends CommonModel {
	
	protected $_validate = array (
		array('id', '', 'Address already exists.', '0', 'unique', 1),
		array('address', 'require', 'Please enter address.'),
		array('city', 'require', 'Please enter city.'),	 
		array('state', 'require', 'Please enter state/provice.'),	 
		array('zip', 'require', 'Please enter postcode.'),
		array('telphone', 'require', 'Please enter mobilephone.'),
		array('country', 'require', 'Please enter country'),
	);
	
	
	function get_shippingaddress($memberid)
	{
		return $this->where(array('id'=>$memberid))->find();
	}
	
}
