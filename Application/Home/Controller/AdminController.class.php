<?php 

namespace Home\Controller;

class AdminController extends CommonController {
	
	public function login()
	{
		if($this->memberID > 0) {
			$this->redirect($this->referer? $this->referer: 'Member/index');
		}
		
		if(IS_POST) {
			$email = I('post.email', '', 'htmlentities');
			$password = I('post.password', '', 'htmlentities');
			$isStay = I('post.IsStay', 0, 'intval');
			
			if(empty($email)) {
				$this->error('please enter login name.');
			}
			if(empty($password)) {
				$this->error('The password can not be empty..');
			}
			
			$membersModel = D('Members');
			$info = $membersModel->where("email='{$email}'")->find();
			if(empty($info) || md5($password) !== $info['password']) {
				$this->error('Login failure，please try again.');
			}
			
			$cookietime = null;
			if($isStay) {
				$cookietime = 86400*30;
			}
			cookie('auth', authcode("{$info['id']}\t{$info['email']}", 'ENCODE', C('AUTHKEY')), $cookietime);

			//将购物车sessionid修改为现在的uid;
			$cartModel = D('Cart');
			$session_id = cookie('sessionID');
			$cartModel->where("uid='{$info['id']}' OR session_id='{$session_id}'")->save(array('session_id'=>$info['id']));
			
			//更新登录信息
			$membersModel->where("id='{$info['id']}'")->save(array('lastlogindate'=>time(), 'lastloginip'=>get_client_ip()));
			
			$this->success('register success', $this->referer? $this->referer: U('Member/index'));
			
		} else{ 
			$this->display();
		}
	}
	
	public function register()
	{
		if($this->memberID > 0) {
			$this->redirect($this->referer? $this->referer: 'Member/index');
		}
		
		if(IS_POST) {
			$membersModel = D('Members');
			if($membersModel->create()) {
				if($insertId = $membersModel->add()) {
					session('memberID', $insertId);
					
					$this->success('register success', $this->referer? $this->referer: U('Member/index'));
				}			
			}else {
				$this->error($membersModel->getError());
			}
		}else {
			$this->display();
		}
	}
	
	public function forgetpwd()
	{
		if($this->memberID > 0) {
			$this->redirect($this->referer? $this->referer: 'Member/index');
		}
		
		if(IS_POST) {
			$email = I('post.email', '', 'htmlentities');
			
			$msg = '';
			$sendmail_status = 0;  //默认发送失败 0-失败 1-成功
			
			if(!preg_match('/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/', $email)) {
				$msg = 'Please Enter a valid e-mail address.';
			}
			else if(!D('Members')->where("email='{$email}'")->count()) {
				$msg = 'Email error, do not have this account';
			}else {
				$sendto = $email;
				$body = $this->fetch('Public:forgetpwd');
				$title = GetValue('sitename').'- Forgot Password';
				if($sendmail_status = sendmail($sendto, $title, $body)) {
					$msg = 'Your password has been sent,Please check your email.';
				}else {
					$msg = 'Please try again or contact your administrator.';
				}
			}
			$this->assign('msg', $msg);
			$this->assign('sendmail_status', $sendmail_status);
			if($sendmail_status) {
				$this->display('Admin:sendmail_success');
			}else {
				$this->display('Admin:sendmail_failure');
			}

		}else {
			$this->display();
		}
	}
	
	public function loginout()
	{
		cookie('memberID', null);
		cookie('auth', null);
		$this->redirect($this->referer? $this->referer: 'admin/login');
		
	}
	
}

