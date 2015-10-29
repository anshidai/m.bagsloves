<?php

namespace Home\Controller;

class CateController extends CommonController {
	
	private $pagesize = 16;
	
    public function index()
	{
		$cid = I('get.cid', 0, 'intval');
		
		if($cid) {
			$cateinfo = get_cate($cid);
			$this->assign('cateinfo', $cateinfo);
		}
		
		$this->assign('cid', $cid);
		$this->display();
    }
	
	public function lists()
	{
		$cid = I('get.cid', 0, 'intval');
		$p = I('get.p', 1, 'intval');
		
		if(S($strFid_class) == '') {
            $classChildren = D('Cate')->getChildren ($cid );
            $classChildren[count($classChildren)] = $cid;
            S($strFid_class, implode(',', $classChildren)); //取得所有子类
        }
		
		$model = D('Products');
		
		$map['isdown'] = array('neq',1);
		$map['cateid']=array('in', S($strFid_class));
		
		$count = $model->where($map)->count();
		$list = $model->where($map)->page($p, $this->pagesize)->select();
		
		$cateinfo = get_cate($cid);
		
		$this->assign('cateinfo', $cateinfo);
		$this->assign('list', $list);
		$this->assign('count', $count? $count: 0);
		$this->assign('totalpage', ceil($count/$this->pagesize));
		
		if($p>1) {
			$this->display('Product-block');
		}else {
			$this->display();
		}

	}

	
	
}