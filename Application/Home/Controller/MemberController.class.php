<?php 

namespace Home\Controller;

class MemberController extends CommonController {
	
	public function _initialize()
	{
		parent::_initialize();
		if(!$this->memberID) {
			$this->redirect($this->referer? $this->referer: 'Admin/login');
		}
	}
	
	public function index()
	{
		$this->display();
	}
	
	public function orders()
	{
		$orderModel = D('Orders');
		$where['member_id'] = $this->memberID;
	}
	
	public function changepwd()
	{
		if(IS_POST) {
			$oldpassword = I('post.oldpassword', '');
			$newpassword = I('post.newpassword', '');
			$repassword = I('post.repassword', '');
			
			if(empty($oldpassword)) {
				$this->error('Please enter old password.');
			}
			if(empty($newpassword) || $repassword) {
				$this->error('Please enter new password.');
			}
			
			if(strlen($newpassword)<6 || strlen($newpassword)>20) {
				$this->error('Please enter password (6-20 characters).');
			}
			if($newpassword !== $repassword) {
				$this->error('Please enter the same password');
			}
			
			$membersModel = D('Members');
			if($membersModel->where("id='{$this->memberID}'")->save(array('password'=>md5($newpassword)))) {
				$this->success('Change the success.', U('Member/index'));
			}else {
				$this->error('Please try again or contact your administrator.');
			}
			
		}else {
			$this->display();
		}
	}
	
	
}
	