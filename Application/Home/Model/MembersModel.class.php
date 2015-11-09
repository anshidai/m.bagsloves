<?php
namespace Home\Model;

class MembersAskModel extends CommonModel {
	
	protected $_validate = array (
		array('firstname', 'require', 'Firstname is required.'),
		array('lastname', 'require', 'Lastname is required.'),
		array('email', 'email', 'Incorrect email format.', 0),	 
		array('repassword', 'password', 'Confirm password error!', 0, 'confirm' ),
		array('password', 'chkpwd', 'Incorrect password format!', 0, 'callback' ),
		array('email', 'uniqueEmail', 'The email have been registered!', 0, 'callback',1 )
	);
		
	protected $_auto = array(
		array('password', 'md5', 1, 'function'),
		array('createdate', 'time', 1, 'function'),
		array('lastlogindate', 'time', 1, 'function'),
		array('lastloginip', 'get_client_ip', 1, 'function'),
	);
	
	protected function chkpwd()
	{
		$password = $_REQUEST['password'];
		if(strlen($password )>= 6) {
			return true;
		} else {
			return false;
		}
	}
	
	protected function uniqueEmail()
	{
		$res = $this->where("email='{$_REQUEST['email']}'")->find();

		if($res){
			return false;
		}
		else{
			return true;
		}
	}
	
	
	
}