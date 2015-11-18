<?php 

namespace Home\Controller;

class MessageController extends MemberController {
	
	public function add()
	{
		if(IS_POST) {
			$code = I('post.code', '');
			$name = I('post.name', '');
			$content = I('post.content', '');
			$title = I('post.title', '');
			$email = I('post.email', '');
			$email_reg = '/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/i'; 
			if(empty($name)) {
				$this->error('Please enter your name');
			}
			if(empty($email) || !preg_match($email_reg, $email)) {
				$this->error('Please fill in the email correctly.'); 
			}
			if(empty($content)) {
				$this->error('Please enter content');
			}
			if(empty($title)) {
				$this->error('Please enter title');
			}
			if(strlen($content)<10) {
				$this->error('Please enter content may not be less than 10 characters.');
			}
			if(!check_verify($code)) {
				$this->error('Verification code error');
			}

			$data['status'] = 1;
			$data['ip'] = get_client_ip();
			$data['dateline'] = time();
			$data['content'] = $content;
			$data['email'] = $email;
			$data['type'] = 'Message';
			$data['name'] = $name;
			$data['title'] = $title;
			if(D('ProductsAsk')->add($data)) {
				$this->success('Your message has been submitted.');
			}
			$this->error('Failure to submit your message.');
		}else {
			$this->display();
		}
	}
	
	public function view()
	{
		$id = I('get.id', 0, 'intval');
	
		$info = D('ProductsAsk')->where("id='{$id}'")->find();
		$this->assign('info', $info);
		$this->display();
	}
	
	public function index()
	{
		$type = I('get.type', 'Message');
		if(!in_array($type, array('Message', 'Review'))) {
			$type = 'Message';
		}
		$email = $this->member_Info['email'];
		if($email) {
			$list = D('ProductsAsk')->where("email='{$email}' AND type='{$type}'")->order('id desc')->select();
		}
		$this->assign('type', $type);
		$this->assign('list', $list);
		$this->display();
	}

}

