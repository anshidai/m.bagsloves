<?php 

namespace Home\Controller;

class FavoriteController extends MemberController {
	
	
	public function index()
	{
		if(empty($this->member_Info['profav'])) {
			$this->display('Member-empty');
		}else {
			$list = D('Products')->where("id in({$this->member_Info['profav']})")->order('id desc')->select();
			$this->assign('list', $list);
			$this->display();
		}
	}
	
	public function delfav()
	{
		$id = I('post.id', 0, 'intval');
		
		$profav = explode(',', $this->member_Info['profav']);
		
		if(!empty($profav)) {
			$key = array_search($id, $profav);
			unset($profav[$key]);
			
			$data['profav'] = implode(',', $profav);
			$data['profav'] = trim($data['profav'], ',');
			
			if(D('Members')->data($data)->where("id=".$this->memberID)->save()) {
				$this->success('Deleting succeed');
			}
		}
		$this->error('Deleting Failed');
	}
	
	public function addfav()
	{
		$id = I('post.id', 0, 'intval');
		
		if($id) {
			$profav = explode(',', $this->member_Info['profav']);
			if(in_array($id, $profav)) {
				$this->error('You have already added this');
			}
			
			array_push($profav, $id);
			$profav = array_unique($profav);
			if(count($profav) > 50) {
				array_shift($profav);
			}
			$data['profav'] = implode(',', $profav);
			$data['profav'] = trim($data['profav'], ',');
			
			if(D('Members')->data($data)->where("id=".$this->memberID)->save() !== false) {
				$this->success('Favorited succeed');
			}
		}
		$this->error('Favorite Failed');
	}
	
	
}


