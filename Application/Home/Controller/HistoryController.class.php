<?php 

namespace Home\Controller;

class HistoryController extends CommonController {
	
	
	public function index()
	{
		
		$this->assign('list', get_history());
		$this->display();
	}
	
	public function clear()
	{
		cookie('goods_history', null);
		
		$this->assign('message', 'Clearing Succeced');
		$this->assign('jump_url', U('History/index'));
		$this->display('Public-success');
	}
	
	
}

