<?php

namespace Home\Controller;

class ProductsController extends CommonController {
	
	public function detail()
	{
		$pid = I('get.pid', 0, 'intval');
		
		$model = D('Products');
		
		$info = $model->where("id='{$pid}'")->find();
		if($info) {
			//获取产品相册
			$gallerys = D('ProductsGallery')->where("pid='{$pid}'")->order('sort desc')->select();
			$this->assign('gallerys', $gallerys);
		}
		
		$attrs = $model->get_attrs($info['cateid'], $info['id']);
		
		
		$related_products_id = D('Products_related')->where("products_id={$pid}")->select();
		
		$product_ids = array($pid);
		if($related_products_id) {
			foreach($related_products_id as $val) {
				array_push($product_ids, (int)$val['related_products_id']);
			}
		}
		sort($product_ids);
		
		dump($attrs);exit;
		
		$this->assign('attrs', $attrs);
		$this->assign('info', $info);
		$this->display();
	}
	
}
	