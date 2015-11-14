<?php 

namespace Home\Controller;

class AddressController extends MemberController {
	
	
	public function index()
	{
		$act = I('get.act', 'show', 'htmlspecialchars');
		
		$template = 'Address-index';
		
		$regionModel = D('Region');
		$shippingaddressModel = D('Shippingaddress');
		$member = $this->member_Info;
		$address = $shippingaddressModel->get_shippingaddress($this->memberID);
		
		if($act == 'show' && $address) {
			$region = $regionModel->get_region();
			$address['region'] = $region[$address['city']]? $region[$address['city']]['name']: $address['city'];
			$address['region'] .= ', '.$region[$address['state']]? $region[$address['state']]['name']: $address['state'];
			$address['region'] .= ', '.$region[$address['country']]['name'];
			$address['region'] .= ', '.$address['zip'];
		}else if($act == 'edit' || $act == 'add') {
			$this->assign('country', $regionModel->get_region_list(0));
			$template = 'Address-edit';
		}
		
		$this->assign('member', $member);
		$this->assign('address', $address);
		$this->display($template);
	}
	
	public function save()
	{
		$act = I('post.act', '', 'htmlspecialchars');
		$memberID = I('post.id', '', 'intval');

		if(!in_array($act, array('add', 'edit')) || $memberID != $this->memberID) {
			$this->error('Illegal request.');
		}
		
		$shippingaddressModel = D('Shippingaddress');
		if($shippingaddressModel->create()) {
			if($act == 'add') {
				if($insertId = $shippingaddressModel->add()) {
					$this->success('Modify the success.', U('Member/address'));
				}
			}else if($act == 'edit') {
				if(false !== $shippingaddressModel->where("id='{$memberID}'")->save()) {
					$this->success('Modify the success.', U('Member/address'));
				}
			}	
		}else {
			$this->error($shippingaddressModel->getError());
		}
		
		
		
	}
	
	
	
}