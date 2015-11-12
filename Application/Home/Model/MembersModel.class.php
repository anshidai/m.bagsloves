<?php
namespace Home\Model;

class MembersModel extends CommonModel {
	
	protected $_validate = array (
		array('firstname', 'require', 'Firstname is required.'),
		array('lastname', 'require', 'Lastname is required.'),
		array('email', 'email', 'Email format is not correct.', 0),	 
		array('email', '', 'The email have been registered.', 0, 'unique', 1),	 
		array('repassword', 'password', 'Two passwords do not match, please try again.', 0, 'confirm' ),
		array('password', '6,20', 'Please enter password (6-20 characters).', 0, 'length'),
	);
		
	protected $_auto = array(
		array('password', 'md5', 1, 'function'),
		array('createdate', 'time', 1, 'function'),
		array('lastlogindate', 'time', 1, 'function'),
		array('lastloginip', 'get_client_ip', 1, 'function'),
	);
	
	
}