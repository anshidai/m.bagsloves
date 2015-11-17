<?php 

namespace Home\Controller;

class SearchController extends CommonController {
		
	private $pagesize = 16;	
	
	public function index()
	{
		$kwd = I('get.k', '', 'htmlspecialchars');
		$p = I('get.p', 1, 'intval');
		$sort = I('post.sort', '', 'htmlspecialchars');
		$by = I('post.by', '', 'htmlspecialchars');
		
		if(!in_array($sort, array('id','name','price','dateline'))) {
			$sort = 'id';
		}
		if(!in_array($by, array('desc','asc'))) {
			$by = 'desc';
		}
		
		if(empty($kwd)) {
			$this->display('Search-index');
		}
		
		$model = D('Products');
		
		$where['name'] = array('like', "%{$kwd}%");
		$where['serial'] = array('like', "%{$kwd}%");
		$where['_logic'] = 'or';
		$map['_complex'] = $where;
		$map['isdown'] = array('neq',1);
		
		$count = $model->where($map)->count();
		$list = $model->where($map)->order("{$sort} {$by}")->page($p, $this->pagesize)->select();
		
		$this->assign('sort', $sort);
		$this->assign('by', $by);
		$this->assign('k', $kwd);
		$this->assign('list', $list);
		$this->assign('count', $count? $count: 0);
		$this->assign('totalpage', ceil($count/$this->pagesize));
		
		$this->display($p>1? 'Product-block': 'Search-index');
	}
	
	public function defaults()
	{
		$this->display('Search-default');
	}
	
	
	
	
	
}