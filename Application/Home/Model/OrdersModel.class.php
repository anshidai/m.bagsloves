<?php
namespace Home\Model;

class OrdersModel extends CommonModel {
	
	protected $_auto=array(
		array('dateline', 'time', 1, 'function'),
		array('ip_address', 'get_client_ip', 1, 'function'),
		array('sn', 'get_sn', 1, 'function'),
	);
	
	public function get_order($id)
	{
		return $this->where("id=".$id)->find();
	}
}
	
	
	
}

