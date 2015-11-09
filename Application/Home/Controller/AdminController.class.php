<?php 

namespace Home\Controller;

use Think\Controller;

class AdminController extends Controller {
	
	
	public function login()
	{
		if(IS_POST) {
			
			
		} else{ 
			$this->display();
		}
	}
	
	public function register()
	{
		if(IS_POST) {
			$membersModel = D('Members');
			if($membersModel->create()) {
				if($insertId = $membersModel->add()) {
					session('memberID', $insertId);
					if(IS_AJAX) {
						$this->success('register success');
					}elseif(isset($_SESSION['back'])) {
						redirect($_SESSION['back']);
					}else{
						$this->redirect('Member/index');
					}
				}			
			}else {
				$this->error($membersModel->getError());
			}
		}else {
			$this->display();
		}
	}
	
	
	
}